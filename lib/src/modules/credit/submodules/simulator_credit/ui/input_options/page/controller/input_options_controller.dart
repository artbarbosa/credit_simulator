class InputOptionsController {
  int term = 12;
  int ltv = 35;
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
