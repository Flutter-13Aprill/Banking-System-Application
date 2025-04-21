import 'dart:io';
import 'dart:convert';

void saveAccount(String accountNumber, Map<String, dynamic> data) {
  if (!data.containsKey('name') ||
      !data.containsKey('email') ||
      !data.containsKey('password')) {
    print('Missing user information. Account not saved.');
    return;
  }

  final file = File('accounts/$accountNumber.json');
  file.createSync(recursive: true);
  file.writeAsStringSync(jsonEncode(data));

  print('Account data for $accountNumber has been saved.');
}
