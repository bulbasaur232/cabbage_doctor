import 'package:bug_doctor/classify/result/s_result.dart';
import 'package:bug_doctor/common/w_navigationbar.dart';
import 'package:bug_doctor/config.dart';
import 'package:bug_doctor/tflite/classifier.dart';
import 'package:bug_doctor/tflite/vo_classifier_category.dart';
import 'package:flutter/cupertino.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';

final ImagePicker picker = ImagePicker();
late Classifier classifier;

class Classify extends StatelessWidget {
  const Classify({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: navigationBar(title: '진단하기'),
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            const _Button(
                color: CupertinoColors.systemGreen,
                icon: CupertinoIcons.camera,
                text: '촬영해서 진단하기',
                imageSource: ImageSource.camera),
            const _Button(
                color: CupertinoColors.systemGreen,
                icon: CupertinoIcons.photo_on_rectangle,
                text: '사진파일로 진단하기',
                imageSource: ImageSource.gallery),
            Image.asset(
              '$imgPath/haeboseyo.png',
              width: 250,
              height: 250,
            ),
          ],
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;
  final ImageSource imageSource;

  const _Button(
      {super.key,
      this.color = CupertinoColors.systemGreen,
      required this.icon,
      required this.text,
      required this.imageSource});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () async {
          /// 이미지 가져오기
          final image = await picker.pickImage(source: imageSource);
          if (image == null) return;

          /// 이미지 판독후 상위 3개 결과 추출
          final predictResult = classifier.predict(img.decodeImage(await image.readAsBytes())!);
          final resultNum = predictResult.length < 3 ? predictResult.length : 3;
          final resultList = predictResult.getRange(0, resultNum).toList();

          // final resultList = <ClassifierCategory>[
          //   ClassifierCategory('탄저병', 94.5),
          //   ClassifierCategory('탄저병', 5.5),
          //   ClassifierCategory('탄저병', 0),
          // ];

          /// 판독결과 가지고 결과 페이지 라우팅
          if (!context.mounted) return;
          Navigator.of(context).push(CupertinoPageRoute(
              builder: (context) => ResultScreen(resultList,image)));
        },
        child: Center(
          child: Container(
            height: 200,
            width: 350,
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(8)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: CupertinoColors.white, size: 65),
                const SizedBox(height: 15),
                Text(
                  text,
                  style: const TextStyle(
                      color: CupertinoColors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
