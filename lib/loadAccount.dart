import "dart:io";
import 'dart:convert';

Map<String, dynamic>? loadAccount(String accountNumber) {
  final file = File('accounts/$accountNumber.json');
  if (!file.existsSync()) {
    print('Account not found.');
    return null;
  }
  final content = file.readAsStringSync();
  return jsonDecode(content);
}
