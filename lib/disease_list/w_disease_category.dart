
import 'package:bug_doctor/common/extension_string.dart';
import 'package:bug_doctor/common/url_launder.dart';
import 'package:bug_doctor/config.dart';
import 'package:bug_doctor/disease_list/dto/dto_simple_info.dart';
import 'package:flutter/cupertino.dart';

class DiseaseCategory extends StatelessWidget {
  final SimpleInfo simpleInfo;

  const DiseaseCategory(this.simpleInfo, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => launchUrlFunc(Uri.parse(
          detailDiseaseInfoUrl.insertAt(91, simpleInfo.sickKey))),
      child: Container(
        margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
        padding: const EdgeInsets.fromLTRB(8, 8, 12, 8),
        width: 20,
        height: 110,
        decoration: BoxDecoration(
            color: CupertinoColors.systemBackground,
            borderRadius: BorderRadius.circular(3)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(3),
                child: Image.network(simpleInfo.imaPath,
                    width: 110, height: 110, fit: BoxFit.fill)),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(simpleInfo.sickNameKor,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22))),
                    Text(simpleInfo.sickNameEng,
                        style: const TextStyle(
                            color: CupertinoColors.inactiveGray,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                        maxLines: 2,
                        overflow: TextOverflow.fade),
                  ],
                ),
              ),
            ),
            Icon(
              CupertinoIcons.chevron_forward,
              color: CupertinoColors.black.withOpacity(0.5),
              size: 30,
            )
          ],
        ),
      ),
    );
  }
}
