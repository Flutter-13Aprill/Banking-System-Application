String generateAccountNumber() {
  final timeStamp = DateTime.now().millisecondsSinceEpoch;
  return '$timeStamp';
}
