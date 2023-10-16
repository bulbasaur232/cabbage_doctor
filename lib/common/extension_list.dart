extension SwapElement on List {
  void swap(int idx1, int idx2) {
    var temp = this[idx1];
    this[idx1] = this[idx2];
    this[idx2] = temp;
  }
}

