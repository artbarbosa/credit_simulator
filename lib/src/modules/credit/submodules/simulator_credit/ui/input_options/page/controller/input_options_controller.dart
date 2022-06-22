class InputOptionsController {
  int _term = 12;
  int _ltv = 35;
  bool _hasProtected = true;

  int get term => _term;
  int get ltv => _ltv;
  bool get hasProtected => _hasProtected;

  onChangeTerm(num value) {
    _term = value.round();
  }

  onChangeLtv(num value) {
    _ltv = value.round();
  }

  void setHasProtected(bool value) {
    _hasProtected = value;
  }
}
