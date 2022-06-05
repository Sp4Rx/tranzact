extension BoolParsing on String {
  bool toBool() {
    return toLowerCase() == 'true';
  }
}