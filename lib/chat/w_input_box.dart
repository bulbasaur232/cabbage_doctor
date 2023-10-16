import 'package:flutter/cupertino.dart';

class InputBox extends StatefulWidget {
  final Function(String) onPressed;

  const InputBox(this.onPressed, {super.key});

  @override
  State<InputBox> createState() => _InputBoxState();
}

class _InputBoxState extends State<InputBox> {
  final inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: CupertinoColors.lightBackgroundGray,
          borderRadius: BorderRadius.circular(30)),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: CupertinoTextField(
                onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
                controller: inputController,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(30)),
                placeholder: '궁금하신 내용을 입력해 주세요.',
                placeholderStyle: const TextStyle(
                    fontSize: 18, color: CupertinoColors.inactiveGray),
              ),
            ),
          ),
          CupertinoButton(
              onPressed: () {
                widget.onPressed(inputController.text);
                inputController.clear();
              },
              child: const Icon(CupertinoIcons.paperplane, size: 25)),
          const SizedBox(width: 5)
        ],
      ),
    );
  }
}
