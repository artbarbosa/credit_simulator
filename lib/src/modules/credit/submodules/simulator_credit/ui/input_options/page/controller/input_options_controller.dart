class InputOptionsController {
  int term = 0;
  int ltv = 0;
  bool hasProtected = true;

  onChangeTerm(num value) {
    term = value.round();
  }

  onChangeLtv(num value) {
    ltv = value.round();
  }

  void setHasProtected(bool value) {
    hasProtected = value;
  }
}
