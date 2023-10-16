import 'package:flutter/cupertino.dart';

ScrollController scrollController = ScrollController();

void moveTop() {
  scrollController.animateTo(scrollController.position.minScrollExtent,
      duration: const Duration(milliseconds: 500), curve: Curves.ease);
}