import 'package:flutter_dotenv/flutter_dotenv.dart';

const appName = '배추도사';
const imgPath = 'assets/images';
const normalLabel = '정상';
const detailDiseaseInfoUrl = 'https://ncpms.rda.go.kr/mobile/MobileSicknsDtlR.ms?hiKncrCode=VC&sKncrCode=VC021001&dtlKey=';

const requestUrl = 'ncpms.rda.go.kr';
const pathVariable = '/npmsAPI/service';
final ncpmsApiKey = dotenv.env['NCPMS_KEY']!;
const cropName = '배추';
const serviceCode = 'SVC01';
const detailServiceCode = 'SVC05';
const serviceType = 'AA003';

final gptApiKey = dotenv.env['GPT_KEY']!;


