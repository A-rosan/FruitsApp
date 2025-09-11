class CustomExceptions implements Exception {
  final String eMsg;

  CustomExceptions({required this.eMsg});
  @override
  String toString() {
    // TODO: implement toString
    return eMsg;
  }
}
