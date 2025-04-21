import 'package:banking/loadAccount.dart';
import 'package:banking/saveAccount.dart';
import 'dart:io';

void depositMoney() {
  stdout.write('Enter account number: ');
  final accountNumber = stdin.readLineSync()!;
  final account = loadAccount(accountNumber);
  if (account == null) return;

  stdout.write('Enter amount to deposit: ');
  final amount = double.tryParse(stdin.readLineSync()!);
  if (amount == null || amount <= 0) {
    print('Invalid amount.');
    return;
  }

  account['balance'] += amount;
  account['transactions'].add({
    'type': 'Deposit',
    'amount': amount,
    'timestamp': DateTime.now().toString(),
  });
  saveAccount(accountNumber, account);
  print('\$${amount.toStringAsFixed(2)} deposited successfully.');
}
