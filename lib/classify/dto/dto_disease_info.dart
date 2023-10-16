class DiseaseInfo {
  final String _sickNameKor;
  final String _sickNameEng;
  final String _imaPath;
  final double _possibility;
  final String _sickKey;

  DiseaseInfo(
      {required sickNameKor,
      required sickNameEng,
      required imaPath,
      required possibility,
      required sickKey})
      : _sickNameKor = sickNameKor,
        _sickNameEng = sickNameEng,
        _imaPath = imaPath,
        _possibility = possibility,
        _sickKey = sickKey;

  double get possibility => _possibility;

  String get imaPath => _imaPath;

  String get sickNameEng => _sickNameEng;

  String get sickNameKor => _sickNameKor;

  String get sickKey => _sickKey;
}
