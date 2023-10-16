import 'package:flutter/cupertino.dart';

class MenuButton extends StatelessWidget {
  final Color color;
  final String text;
  final VoidCallback? onTap;
  final double fontSize;

  const MenuButton(
      {super.key,
      this.color = CupertinoColors.systemGreen,
      this.text = '',
      this.onTap,
      this.fontSize = 21});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      child: Container(
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(15)),
        width: 170,
        height: 150,
        child: GestureDetector(
          onTap: onTap,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                      color: CupertinoColors.white,
                      fontSize: fontSize,
                      letterSpacing: 0.5,
                      height: 1.3,
                      fontWeight: FontWeight.w800),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
