import 'package:bug_doctor/dummy/dummy.dart';
import 'package:flutter/cupertino.dart';
import 'package:typewritertext/typewritertext.dart';

const beginContents = SizedBox(
  width: 350,
  height: 300,
  child: Center(
    child: Text('안녕하세요!\n 무엇이 궁금하신가요?',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 30),),
  ),
);

const loadingContents = Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Text('답변을 생각 중이에요', style: TextStyle(fontSize: 32)),
    TypeWriterText(
      text: Text('....', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, letterSpacing: 10)),
      duration: Duration(milliseconds: 400),
      repeat: true,
    ),
  ],
);

Widget answerContent(String text) {
  return SingleChildScrollView(
    physics: const ClampingScrollPhysics(),
    child: TypeWriterText(
      text: Text(text, style: const TextStyle(fontSize: 18), textAlign: TextAlign.justify),
      duration: const Duration(milliseconds: 20),
    ),
  );
}
