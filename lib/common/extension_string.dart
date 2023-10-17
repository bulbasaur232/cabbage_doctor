extension Insert on String {
  String insertAt(int index, String string) {
    if (index < 0 || index > length) {
      throw IndexError.withLength(index, length);
    }
    String prefix = substring(0, index);
    String suffix = substring(index);

    return prefix + string + suffix;
  }
}