class Notice {
  final String _headLine;
  final String _name;
  final String _date;

  Notice(this._headLine, this._name, this._date);

  String get date => _date;

  String get name => _name;

  String get headLine => _headLine;
}