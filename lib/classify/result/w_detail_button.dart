import 'package:bug_doctor/classify/dto/dto_disease_info.dart';
import 'package:bug_doctor/classify/result_detail/s_result_detail.dart';
import 'package:bug_doctor/common/design_config.dart';
import 'package:bug_doctor/config.dart';
import 'package:flutter/cupertino.dart';

class DetailButton extends StatelessWidget {
  final DiseaseInfo info;

  const DetailButton(this.info, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 255),
        info.sickNameKor == normalLabel
            ? const SizedBox.shrink()
            : CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () =>
              Navigator.of(context).push(
                  CupertinoPageRoute(
                      builder: (context) => DetailResultScreen(info))),
          child: Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 10, sidePadding, 0),
              padding: const EdgeInsets.symmetric(vertical: 3),
              width: 120,
              decoration: BoxDecoration(
                  color: CupertinoColors.systemBackground,
                  border:
                  Border.all(color: CupertinoColors.systemBlue),
                  borderRadius: BorderRadius.circular(10)),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('더 알아보기',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(width: 3),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0,0,0,2),
                    child: Icon(CupertinoIcons.chevron_right_circle, size: 20),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
