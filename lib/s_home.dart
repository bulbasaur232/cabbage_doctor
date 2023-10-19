import 'package:bug_doctor/classify/s_classify.dart';
import 'package:bug_doctor/common/w_navigationbar.dart';
import 'package:bug_doctor/config.dart';
import 'package:bug_doctor/disease_list/s_disease_list.dart';
import 'package:bug_doctor/license/s_license.dart';
import 'package:bug_doctor/common/w_menu_button.dart';
import 'package:bug_doctor/chat/s_chat_screen.dart';
import 'package:bug_doctor/tflite/classifier.dart';
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
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                MenuButton(
                  text: '사진 진단\n바로가기',
                  image: Padding(
                    padding: const EdgeInsets.fromLTRB(0,0,7,0),
                    child: Image.asset('$imgPath/camera.png',width: 60, height: 60,),
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
                  image: Image.asset('$imgPath/yellowfile.png', width: 60, height: 60),
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
                    padding: const EdgeInsets.fromLTRB(0,0,7,5),
                    child: Image.asset('$imgPath/chat.png', width: 60, height: 60),
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
                    padding: const EdgeInsets.fromLTRB(0,0,0,5),
                    child: Image.asset('$imgPath/purplefile.png',width: 60,height: 60),
                  ),
                  color: const Color(0xfff4a29f),
                  onTap: () => Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (context) => const LicencesPage(),
                    ),
                  ),
                ),
              ]),
              Expanded(
                  flex: 3,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xffb2abe1),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            const Text(
                              '❕공지사항❕\n',
                              style: TextStyle(
                                color: CupertinoColors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Column(
                              children: [
                                Row(children: [
                                  const Text('◆'),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: RichText(
                                        text: const TextSpan(
                                            text:
                                                '2030/10/07 강원도 정선군에서 고랭지 배추를 이용한 상온 상압 초전도체 개발 성공!',
                                            style: TextStyle(
                                                color: CupertinoColors.black,
                                                fontSize: 16))),
                                  )
                                ]),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(children: [
                                  const Text('◆'),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: RichText(
                                        text: const TextSpan(
                                            text:
                                                '하루 아침에 \'10원에서 5억원\'으로 떡상! 배추코인 가격 폭등, 세계 경제 시장 뒤흔들다!',
                                            style: TextStyle(
                                                color: CupertinoColors.black,
                                                fontSize: 16))),
                                  )
                                ]),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
              Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('$imgPath/cabbage_boy.png',
                            width: 60, height: 60),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text('Hello Sejong Capstone 💛'),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
