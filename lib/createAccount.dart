import 'dart:io';
import 'dart:convert';
import 'package:banking/generateAccountNumber.dart';

void createAccount() {
  stdout.write('Enter your name: ');
  final name = stdin.readLineSync()!;

  stdout.write('Enter your email: ');
  final email = stdin.readLineSync()!;

  stdout.write('Set a password: ');
  final password = stdin.readLineSync()!;

  final accountNumber = generateAccountNumber();
  final file = File('accounts/$accountNumber.json');
  file.createSync(recursive: true);

  final data = {
    'accountNumber': accountNumber,
    'name': name,
    'email': email,
    'password': password,
    'balance': 0.0,
    'transactions': [],
  };

  file.writeAsStringSync(jsonEncode(data));
  print('\nAccount created successfully!');
  print('Your Account Number: $accountNumber\n');
}
