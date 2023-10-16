import 'package:bug_doctor/classify/dto/dto_disease_detail_info.dart';
import 'package:bug_doctor/classify/dto/dto_disease_info.dart';
import 'package:bug_doctor/disease_list/dto/dto_simple_info.dart';
import 'package:bug_doctor/tflite/vo_classifier_category.dart';

ClassifierCategory dummyCategory = ClassifierCategory('탄저병', 94.5);

List<DiseaseInfo> dummyList = [dummyInfo1, dummyInfo2, dummyInfo3];

DiseaseInfo dummyInfo1 = DiseaseInfo(
    sickNameKor: '탄저병',
    sickNameEng: 'Tanzeas',
    imaPath:
    "http://ncpms.rda.go.kr/npmsAPI/thumbnailViewer2.mo?uploadSpec=npms&uploadSubDirectory=/photo/sickns/&imageFileName=f778890c1bf9128ab7a35cddbf8819b9803ba1f57474ff03070aa85c9cb4708afe234dbb9b0b97e48b03b12ae0114e5d",
    possibility: 94.5,
    sickKey: 'D00000711');

DiseaseInfo dummyInfo2 = DiseaseInfo(
    sickNameKor: '정상',
    sickNameEng: 'normal',
    imaPath:
    "http://ncpms.rda.go.kr/npmsAPI/thumbnailViewer2.mo?uploadSpec=npms&uploadSubDirectory=/photo/sickns/&imageFileName=f778890c1bf9128ab7a35cddbf8819b9803ba1f57474ff03070aa85c9cb4708afe234dbb9b0b97e48b03b12ae0114e5d",
    possibility: 34.5,
    sickKey: 'D00000711');

DiseaseInfo dummyInfo3 = DiseaseInfo(
    sickNameKor: '바나나바나나바나나바나나바나나바나나바나나바나나',
    sickNameEng: 'banbnabnanbanbanbnanban',
    imaPath:
    "http://ncpms.rda.go.kr/npmsAPI/thumbnailViewer2.mo?uploadSpec=npms&uploadSubDirectory=/photo/sickns/&imageFileName=f778890c1bf9128ab7a35cddbf8819b9803ba1f57474ff03070aa85c9cb4708afe234dbb9b0b97e48b03b12ae0114e5d",
    possibility: 3.2,
    sickKey: 'D00000711');

AdditionalImage dummyAdditional1 = AdditionalImage('잎의 증상(잎)', 'http://ncpms.rda.go.kr/npmsAPI/thumbnailViewer2.mo?uploadSpec=npms&uploadSubDirectory=/photo/sickns/&imageFileName=d559284e66fd90cfca578c1d189bd962f1be9adb088789c15d2965d4ff508e9a02c32c9a2b851aaac9a28c4e2ec07211');
AdditionalImage dummyAdditional2 = AdditionalImage('엽육의 증상(잎)', 'http://ncpms.rda.go.kr/npmsAPI/thumbnailViewer2.mo?uploadSpec=npms&uploadSubDirectory=/photo/sickns/&imageFileName=f778890c1bf9128ab7a35cddbf8819b9f1be9adb088789c15d2965d4ff508e9a02c32c9a2b851aaac9a28c4e2ec07211');

List<String> dummySymptoms = ['주로 잎에 발생하며, 후에 줄기와 꼬투리에도 발생한다.', '잎에서는 처음에 흰색의 원형 내지 타원형 반점으로 나타나고, 진전되면 병반이 부정형으로 확대되면서 병반의 내부는 회색 내지 회황색을 띠고, 테두리는 흑색을 띠게 된다.', '심하게 감염된 잎에서는 병반이 융합하여 커지고, 잎이 말라죽는다.'];
List<String> dummyPreventionMethod = ['건전종자를 파종한다.', '이 병에 잘 걸리지 않는 품종을 선택하여 재배한다.', '수확 수 병든 잎을 제거하여 포장을 청결하게 한다.'];
// List<String> dummyDevelopmentCondition = ['병원균은 병든 식물체의 조직이나 종자에서 균사 혹은 분생포자의 형태로 월동후, 분생포자를 형성하여 공기전염 한다.', '주로 여름과 가을의 노지포장에서 많이 발생한다.'];
List<String> dummyDevelopmentCondition = ['- 병이 발생한 포장은 배추과 채소작물 이외의 비기주작물과 돌려짓기한다.- 건전한 상토를 사용하거나 묘상의 상토를 소독 후 육묘한다.- 석회를 포장 10a당 150～180㎏ 시용하면 발병억제 효과가 있다.- 재배포장의 토양습도가 높지 않도록 배수를 철저히 한다.- 병든 그루의 잔재물을 주변의 토양과 함께 제거한다.- 병이 발생한 포장에서 다른 재배포장으로 토양이 유입되지 않도록 주의한다.- 발병이 우려되는 포장은 등록약제를 처리한다.- 병이 발생한 포장에서 다른 재배포장으로 토양이 유입되지 않도록 주의한다.- 발병이 우려되는 포장은 등록약제를 처리한다.- 병이 발생한 포장에서 다른 재배포장으로 토양이 유입되지 않도록 주의한다.- 발병이 우려되는 포장은 등록약제를 처리한다.'];

DetailedDiseaseInfo dummyDetail = DetailedDiseaseInfo(
    sickNameKor: '순무황화모자이크바이러스병',
    sickNameEng: 'Phytophthora root rot',
    // imaPath: 'http://ncpms.rda.go.kr/npmsAPI/thumbnailViewer2.mo?uploadSpec=npms&uploadSubDirectory=/photo/sickns/&imageFileName=f778890c1bf9128ab7a35cddbf8819b9803ba1f57474ff03070aa85c9cb4708afe234dbb9b0b97e48b03b12ae0114e5d',
    imaPath: 'http://ncpms.rda.go.kr/npmsAPI/thumbnailViewer2.mo?uploadSpec=npms&uploadSubDirectory=/photo/sickns/&imageFileName=f3ecb3f5b44a310b7536d679a1fa3489803ba1f57474ff03070aa85c9cb4708afe234dbb9b0b97e48b03b12ae0114e5d',
    symptoms: dummySymptoms,
    preventionMethod: dummyPreventionMethod,
    developmentCondition: dummyDevelopmentCondition,
    additionalImages: [dummyAdditional1, dummyAdditional2]);

// List<SimpleInfo> dummySimpleInfoList = [dummySimpleInfo, dummySimpleInfo, dummySimpleInfo, dummySimpleInfo, dummySimpleInfo];

SimpleInfo dummySimpleInfo = SimpleInfo(sickNameKor: '배추애벌레병', sickNameEng: 'very longes english name test hhhhhhhhhhhh', imaPath: 'http://ncpms.rda.go.kr/npmsAPI/thumbnailViewer2.mo?uploadSpec=npms&uploadSubDirectory=/photo/sickns/&imageFileName=f3ecb3f5b44a310b7536d679a1fa3489803ba1f57474ff03070aa85c9cb4708afe234dbb9b0b97e48b03b12ae0114e5d', sickKey: 'D00000706');

List<String> dummyLabels = ['검은무늬병', '검은썩음병', '그루썩음병', '균핵병', '모자이크병', '밑둥썩음병'];

const longText = '로렘 입숨(lorem ipsum; 줄여서 립숨, lipsum)은 출판이나 그래픽 디자인 분야에서 폰트, 타이포그래피, 레이아웃 같은 그래픽 요소나 시각적 연출을 보여줄 때 사용하는 표준 채우기 텍스트로, 최종 결과물에 들어가는 실제적인 문장 내용이 채워지기 전에 시각 디자인 프로젝트 모형의 채움 글로도 이용된다. 이런 용도로 사용할 때 로렘 입숨을 그리킹(greeking)이라고도 부르며, 때로 로렘 입숨은 공간만 차지하는 무언가를 지칭하는 용어로도 사용된다. 로렘 입숨(lorem ipsum; 줄여서 립숨, lipsum)은 출판이나 그래픽 디자인 분야에서 폰트, 타이포그래피, 레이아웃 같은 그래픽 요소나 시각적 연출을 보여줄 때 사용하는 표준 채우기 텍스트로, 최종 결과물에 들어가는 실제적인 문장 내용이 채워지기 전에 시각 디자인 프로젝트 모형의 채움 글로도 이용된다. 이런 용도로 사용할 때 로렘 입숨을 그리킹(greeking)이라고도 부르며, 때로 로렘 입숨은 공간만 차지하는 무언가를 지칭하는 용어로도 사용된다.로렘 입숨(lorem ipsum; 줄여서 립숨, lipsum)은 출판이나 그래픽 디자인 분야에서 폰트, 타이포그래피, 레이아웃 같은 그래픽 요소나 시각적 연출을 보여줄 때 사용하는 표준 채우기 텍스트로, 최종 결과물에 들어가는 실제적인 문장 내용이 채워지기 전에 시각 디자인 프로젝트 모형의 채움 글로도 이용된다. 이런 용도로 사용할 때 로렘 입숨을 그리킹(greeking)이라고도 부르며, 때로 로렘 입숨은 공간만 차지하는 무언가를 지칭하는 용어로도 사용된다.';
