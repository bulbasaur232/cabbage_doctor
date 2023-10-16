import 'package:bug_doctor/config.dart';
import 'package:flutter/cupertino.dart';

CupertinoNavigationBar navigationBar(
    {bool isHome = false, String title = appName}) {
  return CupertinoNavigationBar(
    border: isHome? Border.all(color: CupertinoColors.systemBackground) : const Border(
        bottom: BorderSide(
            color: CupertinoColors.inactiveGray, width: 0.0 // 0.0 means one physical pixel
            )),
    trailing: isHome
        ? null
        : Icon(CupertinoIcons.airplane,
            color: CupertinoColors.black.withOpacity(0.0)),
    backgroundColor: CupertinoColors.systemBackground,
    middle: Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('$imgPath/cabbage.png', width: 35, height: 35),
          const SizedBox(width: 10),
          Text(title,
              style: const TextStyle(fontSize: 33, fontFamily: 'Kangwon')),
        ],
      ),
    ),
  );
}
