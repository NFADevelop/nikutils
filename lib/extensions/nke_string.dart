extension NkeString on String {
  bool get isNullOrEmpty {
    if (this == null)
      return true;
    else if (this.length == 0)
      return true;
    else
      return false;
  }
}
