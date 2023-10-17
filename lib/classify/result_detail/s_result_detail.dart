import 'dart:convert';
import 'package:bug_doctor/classify/dto/dto_disease_detail_info.dart';
import 'package:bug_doctor/classify/dto/dto_disease_info.dart';
import 'package:bug_doctor/classify/result_detail/w_add_image.dart';
import 'package:bug_doctor/classify/result_detail/w_name_and_image.dart';
import 'package:bug_doctor/classify/result_detail/w_string_info.dart';
import 'package:bug_doctor/common/w_navigationbar.dart';
import 'package:bug_doctor/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DetailResultScreen extends StatefulWidget {
  final DiseaseInfo diseaseInfo;

  const DetailResultScreen(this.diseaseInfo, {super.key});

  @override
  State<DetailResultScreen> createState() => _DetailResultScreenState();
}

class _DetailResultScreenState extends State<DetailResultScreen> {
  bool loading = true;
  late DetailedDiseaseInfo detail;
  PageController controller = PageController();

  @override
  void initState() {
    super.initState();
    _getDetailedInfo();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: navigationBar(title: '상세정보'),
      child: loading
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      NameAndImage(detail),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        width: double.infinity,
                        height: 400,
                        child: PageView(
                          physics: const ClampingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          controller: controller,
                          children: [
                            StringInfo('증상 설명', 'think', detail.symptoms),
                            StringInfo(
                                '발생 환경', 'farmer', detail.developmentCondition),
                            StringInfo(
                                '방제 방법', 'bandaid', detail.preventionMethod),
                            ...detail.additionalImages
                                .map((image) => AddImage(image)),
                          ],
                        ),
                      ),
                      SmoothPageIndicator(
                        controller: controller,
                        count: 3 + detail.additionalImages.length,
                        effect: const ExpandingDotsEffect(
                            dotHeight: 13,
                            dotWidth: 13,
                            activeDotColor: Color(0xff3498db)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  void _getDetailedInfo() async {
    detail = await _getDetailedDiseaseInfo(widget.diseaseInfo);
    setState(() {
      loading = false;
    });
  }

  Future<DetailedDiseaseInfo> _getDetailedDiseaseInfo(
      DiseaseInfo diseaseInfo) async {
    var uri = Uri.http(requestUrl, pathVariable, <String, String>{
      'apiKey': ncpmsApiKey,
      'serviceCode': detailServiceCode,
      'serviceType': serviceType,
      'sickKey': diseaseInfo.sickKey,
    });
    var response = await http.get(uri);
    var responseBody = utf8.decode(response.bodyBytes);

    var json = jsonDecode(responseBody);
    var info = json['service'];

    List<AdditionalImage> list = List.empty(growable: true);
    List images = info['imageList'];
    for (var e in images) {
      list.add(AdditionalImage(e['imageTitle'], e['image']));
    }

    List<String> symptoms = (info['symptoms'] as String)
        .split('<br/>')
        .map((e) => e.trim())
        .toList();
    List<String> preventionMethod = (info['preventionMethod'] as String)
        .split('<br/>')
        .map((e) => e.substring(e.indexOf('-') + 1))
        .map((e) => e.trim())
        .toList();
    List<String> developmentCondition = (info['developmentCondition'] as String)
        .split('<br/>')
        .map((e) => e.trim())
        .toList();

    return DetailedDiseaseInfo(
        sickNameKor: diseaseInfo.sickNameKor,
        sickNameEng: diseaseInfo.sickNameEng,
        imaPath: diseaseInfo.imaPath,
        symptoms: symptoms,
        preventionMethod: preventionMethod,
        developmentCondition: developmentCondition,
        additionalImages: list);
  }
}
