import 'package:bug_doctor/common/design_config.dart';
import 'package:bug_doctor/config.dart';
import 'package:flutter/cupertino.dart';

class StringInfo extends StatelessWidget {
  final String title;
  final List<String> list;
  final String icon;

  const StringInfo(this.title, this.icon, this.list, {super.key});

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
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
            child: Image.asset('$imgPath/$icon.png', height: 80, width: 80),
          ),
          Expanded(
            child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: list
                        .map((e) => Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 5, 5, 0),
                                  child: Icon(CupertinoIcons.circle_fill,
                                      size: 8,
                                      color: CupertinoColors.black
                                          .withOpacity(0.4)),
                                ),
                                Expanded(
                                    child: Text('$e\n',
                                        textAlign: TextAlign.justify)),
                              ],
                            ))
                        .toList())),
          )
        ],
      ),
    );
  }
}
