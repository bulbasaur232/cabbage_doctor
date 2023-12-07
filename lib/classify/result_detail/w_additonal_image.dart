import 'package:bug_doctor/classify/dto/dto_disease_detail_info.dart';
import 'package:bug_doctor/common/design_config.dart';
import 'package:flutter/cupertino.dart';

class AdditonalImage extends StatelessWidget {
  final AdditionalImage image;

  const AdditonalImage(this.image, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: sidePadding),
      padding: const EdgeInsets.fromLTRB(12, 12, 20, 12),
      decoration: BoxDecoration(
        color: boxColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            image.imageTitle,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Image.network(image.imagePath),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
