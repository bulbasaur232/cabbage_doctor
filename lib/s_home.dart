import 'package:bug_doctor/classify/s_classify.dart';
import 'package:bug_doctor/common/w_navigationbar.dart';
import 'package:bug_doctor/config.dart';
import 'package:bug_doctor/disease_list/s_disease_list.dart';
import 'package:bug_doctor/license/s_license.dart';
import 'package:bug_doctor/common/w_menu_button.dart';
import 'package:bug_doctor/chat/s_chat_screen.dart';
import 'package:bug_doctor/tflite/classifier.dart';
import 'package:bug_doctor/w_notice.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await dotenv.load(fileName: '.env').then((value) => loadTflite());
  OpenAI.apiKey = gptApiKey;
  runApp(
    const CupertinoApp(
      title: appName,
      theme: CupertinoThemeData(
        brightness: Brightness.light,
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ),
  );
}

Future<void> loadTflite() async {
  classifier = Classifier();
  await classifier.init();
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return CupertinoPageScaffold(
      navigationBar: navigationBar(isHome: true),
      child: SafeArea(
        child: Column(
          children: [
            Container(
              color: const Color(0xfff1f5f7),
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    MenuButton(
                      text: '사진 진단\n바로가기',
                      image: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 7, 0),
                        child: Image.asset(
                          '$imgPath/camera.png',
                          width: 60,
                          height: 60,
                        ),
                      ),
                      color: const Color(0xfff8d039),
                      onTap: () => Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) => const Classify(),
                        ),
                      ),
                    ),
                    MenuButton(
                      text: '병충해 목록\n확인하기',
                      image: Image.asset('$imgPath/yellowfile.png',
                          width: 60, height: 60),
                      color: const Color(0xff81d0d8),
                      onTap: () => Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) => const DiseaseList(),
                        ),
                      ),
                    )
                  ]),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    MenuButton(
                      text: '챗봇에게\n물어보기',
                      image: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 7, 5),
                        child: Image.asset('$imgPath/chat.png',
                            width: 60, height: 60),
                      ),
                      color: const Color(0xff97d5a5),
                      onTap: () => Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) => const ChatScreen(),
                        ),
                      ),
                    ),
                    MenuButton(
                      text: '소스 출처',
                      image: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 6),
                        child: Image.asset('$imgPath/purplefile.png',
                            width: 60, height: 60),
                      ),
                      color: const Color(0xfff4a29f),
                      onTap: () => Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) => const LicencesPage(),
                        ),
                      ),
                    ),
                  ]),
                  Container(
                      width: 150,
                      height: 5,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          color: CupertinoColors.inactiveGray.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(30))),
                ],
              ),
            ),
            const NoticeForm(),
            Expanded(
                child: Container(
              decoration: const BoxDecoration(
                  color: CupertinoColors.extraLightBackgroundGray,
                  border: BorderDirectional(
                      top: BorderSide(width: 0.8, color: Color(0xffdcdee3)))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    CupertinoIcons.info_circle,
                    size: 20,
                    color: CupertinoColors.inactiveGray,
                  ),
                  const SizedBox(width: 10),
                  Center(
                    child: Text(
                      '''본 어플리케이션에서 제공하고 있는 병충해 정보는\n저작권법에 의해서 보호 받는 농촌진흥청의 저작물입니다.''',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 15,
                          color: CupertinoColors.black.withOpacity(0.7)),
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
