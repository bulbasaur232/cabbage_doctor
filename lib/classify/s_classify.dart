import 'package:bug_doctor/classify/result/s_result.dart';
import 'package:bug_doctor/common/w_navigationbar.dart';
import 'package:bug_doctor/config.dart';
import 'package:bug_doctor/tflite/classifier.dart';
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
      backgroundColor: const Color(0xffedeeed),
      child: SafeArea(
        child: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            height: 600,
            decoration: BoxDecoration(color: CupertinoColors.systemBackground, borderRadius: BorderRadius.circular(10 )),
            child: Column(
              children: [
                const _Button(
                    color: Color(0xff85cd97),
                    icon: CupertinoIcons.camera,
                    text: '촬영으로 진단하기',
                    imageSource: ImageSource.camera),
                const SizedBox(height: 20),
                const _Button(
                    color: Color(0xff7ec2d3),
                    icon: CupertinoIcons.photo_on_rectangle,
                    text: '사진파일로 진단하기',
                    imageSource: ImageSource.gallery),
                const SizedBox(height: 20),
                Image.asset(
                  '$imgPath/wonchu.png',
                  width: 230,
                  height: 160,
                )
              ],
            ),
          ),
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
      {this.color = CupertinoColors.systemGreen,
      required this.icon,
      required this.text,
      required this.imageSource,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        /// 이미지 가져오기
        final image = await picker.pickImage(source: imageSource);
        if (image == null) return;

        /// 이미지 판독후 상위 3개 결과 추출
        final predictResult =
            classifier.predict(img.decodeImage(await image.readAsBytes())!);
        final resultNum = predictResult.length < 3 ? predictResult.length : 3;
        final resultList = predictResult.getRange(0, resultNum).toList();

        /// 판독결과 가지고 결과 페이지 라우팅
        if (!context.mounted) return;
        Navigator.of(context).push(CupertinoPageRoute(
            builder: (context) => ResultScreen(resultList, image)));
      },
      child: Center(
        child: Container(
          height: 180,
          width: 350,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(5)),
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
    );
  }
}
