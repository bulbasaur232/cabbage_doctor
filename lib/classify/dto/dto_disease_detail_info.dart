class DetailedDiseaseInfo {
  final String _sickNameKor;
  final String _sickNameEng;
  final String _imaPath;

  final List<String> _symptoms;
  final List<String> _preventionMethod;
  final List<String> _developmentCondition;
  final List<AdditionalImage> _additionalImages;

  DetailedDiseaseInfo(
      {required sickNameKor,
      required sickNameEng,
      required imaPath,
      required symptoms,
      required preventionMethod,
      required developmentCondition,
      required additionalImages})
      : _sickNameKor = sickNameKor,
        _sickNameEng = sickNameEng,
        _imaPath = imaPath,
        _symptoms = symptoms,
        _preventionMethod = preventionMethod,
        _developmentCondition = developmentCondition,
        _additionalImages = additionalImages;

  List<AdditionalImage> get additionalImages => _additionalImages;

  List<String> get symptoms => _symptoms;

  String get imaPath => _imaPath;

  String get sickNameEng => _sickNameEng;

  String get sickNameKor => _sickNameKor;

  List<String> get preventionMethod => _preventionMethod;

  List<String> get developmentCondition => _developmentCondition;
}

class AdditionalImage {
  final String _imageTitle;
  final String _imagePath;

  AdditionalImage(this._imageTitle, this._imagePath);

  String get imagePath => _imagePath;

  String get imageTitle => _imageTitle;
}
