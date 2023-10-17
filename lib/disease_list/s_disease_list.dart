import 'dart:convert';

import 'package:bug_doctor/classify/s_classify.dart';
import 'package:bug_doctor/common/w_navigationbar.dart';
import 'package:bug_doctor/config.dart';
import 'package:bug_doctor/disease_list/dto/dto_simple_info.dart';
import 'package:bug_doctor/disease_list/w_cabbage.dart';
import 'package:bug_doctor/disease_list/w_disease_category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DiseaseList extends StatefulWidget {
  const DiseaseList({super.key});

  @override
  State<DiseaseList> createState() => _DiseaseListState();
}

class _DiseaseListState extends State<DiseaseList> {
  late List<String> labels;
  List<SimpleInfo> infoList = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    labels = List<String>.from(classifier.labels);
    labels.remove(normalLabel);
    // labels = dummyLabels;

    for (final label in labels) {
      _getSimpleInfoList(label);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: loading
            ? CupertinoColors.systemBackground
            : CupertinoColors.lightBackgroundGray,
        navigationBar: navigationBar(title: '병충해 목록'),
        child: SafeArea(
          child: loading
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: Column(
                    children: [
                      CabbageIntro(labels.length),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) =>
                            DiseaseCategory(infoList.elementAt(index)),
                        itemCount: infoList.length,
                      ),
                      const SizedBox(height: 15)
                    ],
                  ),
                ),
        ));
  }

  void _getSimpleInfoList(String label) async {
    infoList.add(await _getSimpleInfo(label));
    if (infoList.length == labels.length) {
      setState(() {
        loading = false;
      });
    }
  }

  Future<SimpleInfo> _getSimpleInfo(String label) async {
    var uri = Uri.http(requestUrl, pathVariable, <String, String>{
      'apiKey': ncpmsApiKey,
      'serviceCode': serviceCode,
      'serviceType': serviceType,
      'cropName': cropName,
      'sickNameKor': label
    });
    var response = await http.get(uri);
    var responseBody = utf8.decode(response.bodyBytes);

    var json = jsonDecode(responseBody);
    var info = json['service']['list'][0];
    var simpleInfo = SimpleInfo(
        sickNameKor: info['sickNameKor'],
        sickNameEng: info['sickNameEng'],
        imaPath: info['oriImg'],
        sickKey: info['sickKey']);

    return simpleInfo;
  }
}
