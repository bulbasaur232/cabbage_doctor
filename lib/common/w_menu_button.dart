import 'package:flutter/cupertino.dart';

class MenuButton extends StatelessWidget {
  final Color color;
  final String text;
  final VoidCallback? onTap;
  final double fontSize;
  final Widget image;

  const MenuButton(
      {required this.image,
      this.color = CupertinoColors.systemGreen,
      this.text = '',
      this.onTap,
      this.fontSize = 18,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        width: 180,
        height: 120,
        child: Stack(children: [
          Positioned(
            top: 20,
            left: 20,
            child: Text(
              text,
              style: TextStyle(
                  color: CupertinoColors.white,
                  fontSize: fontSize,
                  letterSpacing: 0.5,
                  height: 1.3,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ),
          Positioned(right: 0, bottom: 0, child: image),
        ]),
      ),
    );
  }
}
