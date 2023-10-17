import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final inputController = TextEditingController();

class InputBox extends StatelessWidget {
  final Function(String) onPressed;
  final bool stopInput;

  const InputBox(this.onPressed, this.stopInput, {super.key});

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
                onTapOutside: (event) =>
                    FocusManager.instance.primaryFocus?.unfocus(),
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
                var input = inputController.text.trim();
                if (stopInput || input == '') return;
                onPressed(input);
                inputController.clear();
              },
              child: stopInput
                  ? const SizedBox(
                      width: 25,
                      height: 25,
                      child: CircularProgressIndicator(strokeWidth: 3))
                  : const Icon(CupertinoIcons.paperplane, size: 25)),
          const SizedBox(width: 5)
        ],
      ),
    );
  }
}
