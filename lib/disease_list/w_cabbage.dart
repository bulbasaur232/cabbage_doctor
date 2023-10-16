import 'package:bug_doctor/config.dart';
import 'package:flutter/cupertino.dart';

class CabbageIntro extends StatelessWidget {
  final int diseaseNum;

  const CabbageIntro(this.diseaseNum, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.fromLTRB(0,25,10,0),
      color: CupertinoColors.systemBackground,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            '$imgPath/napa_cabbage.png',
            width: 140,
            height: 140,
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 45),
              const Row(
                children: [
                  Text(
                    '배추',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                  ),
                  SizedBox(width: 5),
                  Text('Napa cabbage', style: TextStyle(fontSize: 15),)
                ],
              ),
              const SizedBox(height: 3),
              Text('$diseaseNum종의 질병 진단 가능',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ],
          )
        ],
      ),
    );
  }
}
