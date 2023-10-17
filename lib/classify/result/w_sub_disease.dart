import 'package:bug_doctor/classify/dto/dto_disease_info.dart';
import 'package:bug_doctor/common/design_config.dart';
import 'package:bug_doctor/config.dart';
import 'package:flutter/cupertino.dart';

class SubDisease extends StatelessWidget {
  final DiseaseInfo info;
  final VoidCallback callBack;

  const SubDisease(this.info, this.callBack, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => callBack(),
      child: Container(
        margin:
            const EdgeInsets.symmetric(horizontal: sidePadding, vertical: 3),
        width: double.infinity,
        height: 100,
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
            color: boxColor, borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(3),
                  child: info.sickNameKor == normalLabel
                      ? Image.asset('$imgPath/normal.png', fit: BoxFit.fill)
                      : Image.network(info.imaPath, fit: BoxFit.fill)),
            ),
            const SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 160,
                  child: Text(info.sickNameKor,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  width: 160,
                  child: Text(
                    info.sickNameEng,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 14,
                        color: CupertinoColors.black.withOpacity(0.6),
                        overflow: TextOverflow.fade),
                  ),
                ),
              ],
            ),
            Expanded(
                child: Stack(
              children: [
                const Center(
                    child: Icon(CupertinoIcons.arrow_right_circle_fill,
                        color: CupertinoColors.inactiveGray)),
                Positioned(
                  bottom: 3,
                  left: 4,
                  right: 0,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      ' ${info.possibility}%',
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
