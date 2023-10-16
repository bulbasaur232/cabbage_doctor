import 'dart:math';

import 'package:bug_doctor/tflite/vo_classifier_category.dart';
import 'package:bug_doctor/tflite/vo_classifier_model.dart';
import 'package:image/image.dart' as img;
import 'package:flutter/cupertino.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';

const modelPath = 'assets/model';
const tflitePath = 'model/model_unquant.tflite';
const labelPath = '$modelPath/labels.txt';

// 이미지를 인식하여 어떤 질병인지 추정하는 클래스
// init() -> execute()
class Classifier {
  late List<String> _labels;
  late ClassifierModel _model;

  List<String> get labels => _labels;

  List<ClassifierCategory> predict(img.Image image) {
    // Load the image and convert it to TensorImage for TensorFlow Input
    final inputImage = _preProcessInput(image);

    // Define the output buffer
    final outputBuffer = TensorBuffer.createFixedSize(
      _model.outputShape,
      _model.outputType,
    );

    // Run inference
    _model.interpreter.run(inputImage.buffer, outputBuffer.buffer);

    // Post Process the outputBuffer
    final resultCategories = _postProcessOutput(outputBuffer);

    return resultCategories;

    /*
    // Pick first result
    final topResult = resultCategories.first;
    debugPrint('Top category: $topResult');

    return topResult;
    */
  }

  Future<void> init() async {
    await Future.wait([_loadModel(tflitePath), _loadLabels(labelPath)]);
  }

  Future<void> _loadModel(String modelFileName) async {
    // #1
    final interpreter = await Interpreter.fromAsset(modelFileName);

    // #2
    final inputShape = interpreter
        .getInputTensor(0)
        .shape;
    final outputShape = interpreter
        .getOutputTensor(0)
        .shape;

    debugPrint('Input shape: $inputShape');
    debugPrint('Output shape: $outputShape');

    // #3
    final inputType = interpreter
        .getInputTensor(0)
        .type;
    final outputType = interpreter
        .getOutputTensor(0)
        .type;

    debugPrint('Input type: $inputType');
    debugPrint('Output type: $outputType');

    _model = ClassifierModel(
      interpreter: interpreter,
      inputShape: inputShape,
      outputShape: outputShape,
      inputType: inputType,
      outputType: outputType,
    );
  }

  Future<void> _loadLabels(String labelsFileName) async {
    // #1
    final rawLabels = await FileUtil.loadLabels(labelsFileName);

    // #2
    _labels = rawLabels
        .map((label) => label.substring(label.indexOf(' ')).trim())
        .toList();

    debugPrint('Labels: $_labels');
  }

  // #1
  TensorImage _preProcessInput(img.Image image) {
    final inputTensor = TensorImage(_model.inputType);
    inputTensor.loadImage(image);

    // #2
    final minLength = min(inputTensor.height, inputTensor.width);
    final cropOp = ResizeWithCropOrPadOp(minLength, minLength);

    // #3
    final shapeLength = _model.inputShape[1];
    final resizeOp = ResizeOp(shapeLength, shapeLength, ResizeMethod.BILINEAR);

    // #4
    final normalizeOp = NormalizeOp(127.5, 127.5);

    // #5
    final imageProcessor = ImageProcessorBuilder()
        .add(cropOp)
        .add(resizeOp)
        .add(normalizeOp)
        .build();

    imageProcessor.process(inputTensor);

    // #6
    return inputTensor;
  }

  List<ClassifierCategory> _postProcessOutput(TensorBuffer outputBuffer) {
    // #1
    final probabilityProcessor = TensorProcessorBuilder().build();

    probabilityProcessor.process(outputBuffer);

    // #2
    final labelledResult = TensorLabel.fromList(_labels, outputBuffer);

    // #3
    final categoryList = <ClassifierCategory>[];
    labelledResult.getMapWithFloatValue().forEach((key, value) {
      final roundedVal = (value * 1000).roundToDouble() / 10; // 소숫점 두 번째 자리에서 빈올림
      final category = ClassifierCategory(key, roundedVal);
      categoryList.add(category);
      debugPrint('label: ${category.label}, score: ${category.score}');
    });

    // #4
    categoryList.sort((a, b) => (b.score > a.score ? 1 : -1));

    return categoryList;
  }
}

