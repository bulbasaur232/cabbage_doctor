import 'package:bug_doctor/chat/chatgpt/func_chatgpt.dart';
import 'package:bug_doctor/chat/w_contents.dart';
import 'package:bug_doctor/chat/w_input_box.dart';
import 'package:bug_doctor/common/w_navigationbar.dart';
import 'package:bug_doctor/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:speech_balloon/speech_balloon.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late String text;
  late Widget content;
  late Function(String) callBack;
  bool stopInput = false;

  @override
  void initState() {
    super.initState();
    content = beginContents;
    callBack = (String question) async {
      setState(() {
        content = loadingContents;
        stopInput = true;
      });
      final gptStream = chatCompletionStream(question);
      text = '';
      gptStream.listen(
        (event) {
          setState(() {
            content =
                answerContent(text = text + event.choices[0].delta.content!);
          });
        },
        onDone: () => setState(() {
          stopInput = false;
        }),
      );
    };
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: navigationBar(title: '챗봇'),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(height: 30),
                SpeechBalloon(
                  width: 350,
                  height: 300,
                  borderRadius: 30,
                  borderWidth: 10,
                  borderColor: CupertinoColors.systemGreen.withOpacity(0.7),
                  nipLocation: NipLocation.bottom,
                  nipHeight: 20,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 17),
                      child: content),
                ),
                const SizedBox(height: 25),
                Image.asset(
                  '$imgPath/cabbage_boy.png',
                  scale: 2.5,
                ),
                const SizedBox(height: 20),
                InputBox(callBack, stopInput),
              ],
            ),
          ),
        ));
  }
}
