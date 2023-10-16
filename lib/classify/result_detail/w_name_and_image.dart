import 'package:bug_doctor/classify/dto/dto_disease_detail_info.dart';
import 'package:bug_doctor/common/design_config.dart';
import 'package:flutter/cupertino.dart';

class NameAndImage extends StatelessWidget {
  final DetailedDiseaseInfo detail;

  const NameAndImage(this.detail, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
      child: Column(
        children: [
          Text(detail.sickNameKor,
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.black),
              textAlign: TextAlign.center),
          Text(detail.sickNameEng,
              style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.inactiveGray),
              textAlign: TextAlign.center),
          const SizedBox(height: 10),
          Container(
              color: boxColor,
              padding: const EdgeInsets.all(5),
              child: Image.network(detail.imaPath)),
        ],
      ),
    );
  }
}
