import 'dart:io';
import 'dart:math';
import 'dart:convert';

void closeAccount() {
  stdout.write('Enter account number to close: ');
  final accountNumber = stdin.readLineSync()!;
  final file = File('accounts/$accountNumber.json');

  if (!file.existsSync()) {
    print('Account not found.');
    return;
  }

  final accountData = jsonDecode(file.readAsStringSync());

  print('\nAccount Information:');
  print('Name: ${accountData['name']}');
  print('Email: ${accountData['email']}');
  print('Balance: \$${accountData['balance']}');

  final random = Random();
  final verificationCode = (1000 + random.nextInt(9000)).toString();

  print('\nVerification Code: $verificationCode');
  stdout.write('Enter the verification code to continue: ');
  final enteredCode = stdin.readLineSync();

  if (enteredCode != verificationCode) {
    print('Incorrect verification code.');
    return;
  }
  stdout.write('Are you sure you want to close this account? (yes/no): ');
  final confirm = stdin.readLineSync();
  if (confirm?.toLowerCase() == 'yes') {
    file.deleteSync();
    print('Account $accountNumber has been closed.');
  } else {
    print('Account  cancelled.');
  }
}
