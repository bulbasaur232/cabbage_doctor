class SimpleInfo {
  final String _sickNameEng;
  final String _sickNameKor;
  final String _imaPath;
  final String _sickKey;

  SimpleInfo(
      {required sickNameKor,
      required sickNameEng,
      required imaPath,
      required sickKey})
      : _sickNameKor = sickNameKor,
        _sickNameEng = sickNameEng,
        _imaPath = imaPath,
        _sickKey = sickKey;

  String get imaPath => _imaPath;

  String get sickNameKor => _sickNameKor;

  String get sickNameEng => _sickNameEng;

  String get sickKey => _sickKey;
}
