import 'package:bug_doctor/classify/dto/dto_disease_info.dart';
import 'package:bug_doctor/classify/result/w_detail_button.dart';
import 'package:bug_doctor/classify/result/w_main_disease.dart';
import 'package:bug_doctor/classify/result/w_sub_disease.dart';
import 'package:bug_doctor/common/design_config.dart';
import 'package:bug_doctor/common/extension_list.dart';
import 'package:bug_doctor/common/scroller.dart' as scroller;
import 'package:bug_doctor/common/w_navigationbar.dart';
import 'package:bug_doctor/config.dart';
import 'package:bug_doctor/dummy/dummy.dart';
import 'package:bug_doctor/tflite/vo_classifier_category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:image_picker/image_picker.dart';

class ResultScreen extends StatefulWidget {
  final List<ClassifierCategory> resultList;
  final XFile originalImage;

  const ResultScreen(this.resultList, this.originalImage, {super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  bool loading = true;
  List<DiseaseInfo> infoList = [];

  @override
  void initState() {
    super.initState();
    for (final category in widget.resultList) {
      _getDiseaseInfoList(category);
    }
    // loading = false;
    // infoList = dummyList;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: navigationBar(title: '진단 결과'),
      child: loading
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                controller: scroller.scrollController,
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    MainDisease(infoList[0], widget.originalImage),
                    DetailButton(infoList[0]),
                    const SizedBox(height: 40),
                    Container(
                      alignment: AlignmentDirectional.centerStart,
                      margin: const EdgeInsets.fromLTRB(sidePadding, 0, 0, 0),
                      child: const Text(
                        ' 다른 질병일 확률',
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(height: 3),
                    ...infoList.sublist(1).map((info) => SubDisease(
                        info,
                        () => setState(() {
                              infoList.swap(0, infoList.indexOf(info));
                              scroller.moveTop();
                            }))),
                    const SizedBox(height: 30)
                  ],
                ),
              ),
            ),
    );
  }

  void _getDiseaseInfoList(ClassifierCategory category) async {
    infoList.add(await _getDiseaseInfo(category));
    if (infoList.length == widget.resultList.length) {
      setState(() {
        infoList.sort((a, b) => b.possibility > a.possibility ? 1 : -1);
        loading = false;
      });
    }
  }

  Future<DiseaseInfo> _getDiseaseInfo(ClassifierCategory category) async {
    if (category.label == normalLabel) {
      return DiseaseInfo(
          sickNameKor: '정상',
          sickNameEng: 'Normal',
          imaPath: '',
          possibility: category.score,
          sickKey: '');
    }

    var uri = Uri.http(requestUrl, pathVariable, <String, String>{
      'apiKey': ncpmsApiKey,
      'serviceCode': serviceCode,
      'serviceType': serviceType,
      'cropName': cropName,
      'sickNameKor': category.label
    });
    var response = await http.get(uri);
    var responseBody = utf8.decode(response.bodyBytes);

    var json = jsonDecode(responseBody);
    var info = json['service']['list'][0];
    var diseaseInfo = DiseaseInfo(
      sickNameKor: info['sickNameKor'],
      sickNameEng: info['sickNameEng'],
      imaPath: info['oriImg'],
      possibility: category.score,
      sickKey: info['sickKey'],
    );

    return diseaseInfo;
  }
}
