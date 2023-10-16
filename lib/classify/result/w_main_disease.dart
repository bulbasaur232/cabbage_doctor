import 'dart:io';

import 'package:bug_doctor/classify/dto/dto_disease_info.dart';
import 'package:bug_doctor/classify/result_detail/s_result_detail.dart';
import 'package:bug_doctor/common/design_config.dart';
import 'package:bug_doctor/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class MainDisease extends StatelessWidget {
  final DiseaseInfo info;
  final XFile originalImage;

  const MainDisease(this.info, this.originalImage, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
                padding: const EdgeInsets.fromLTRB(5, 0, 5, 10),
                height: 370,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                    child: info.sickNameKor == normalLabel
                        ? Image.asset('$imgPath/normal.png', fit: BoxFit.fill)
                        : Image.network(info.imaPath, fit: BoxFit.fill))),
            Positioned(
              bottom: 22,
              right: 17,
              child: GestureDetector(
                onTap: () {
                  showCupertinoDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (context) => SizedBox(
                      width: 500,
                      height: 800,
                      child: CupertinoAlertDialog(
                        title: const Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                          child: Text('판독 이미지', style: TextStyle(fontSize: 20)),
                        ),
                        content: Image.file(File(originalImage.path)),
                        actions: [
                          CupertinoDialogAction(
                            isDefaultAction: true,
                            onPressed: () => Navigator.pop(context),
                            child: const Text('닫기'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                child: Container(
                  height: 52,
                  width: 52,
                  decoration: BoxDecoration(
                    color: CupertinoColors.systemYellow.withOpacity(0.8),
                    border: null,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: const Icon(CupertinoIcons.photo_fill,
                      color: CupertinoColors.white),
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: sidePadding),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 240,
                    child: Text(info.sickNameKor,
                        overflow: TextOverflow.fade,
                        maxLines: 3,
                        style: const TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    width: 240,
                    height: 20,
                    child: Text(info.sickNameEng,
                        maxLines: 3,
                        style: TextStyle(
                            fontSize: 15,
                            color: CupertinoColors.black.withOpacity(0.6)),
                        overflow: TextOverflow.visible),
                  ),
                ],
              ),
              Text('${info.possibility}%',
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold)),
            ],
          ),
        )
      ],
    );
  }
}
