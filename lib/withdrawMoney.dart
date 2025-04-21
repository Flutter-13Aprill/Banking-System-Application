import 'dart:io';
import 'package:banking/saveAccount.dart';
import 'package:banking/loadAccount.dart';

void withdrawMoney() {
  stdout.write('Enter account number: ');
  final accountNumber = stdin.readLineSync()!;
  final account = loadAccount(accountNumber);
  if (account == null) return;

  stdout.write('Enter amount to withdraw: ');
  final amount = double.tryParse(stdin.readLineSync()!);
  if (amount == null || amount <= 0) {
    print('Invalid amount.');
    return;
  }

  if (amount > account['balance']) {
    print('Insufficient balance.');
    return;
  }

  account['balance'] -= amount;
  account['transactions'].add({
    'type': 'Withdraw',
    'amount': amount,
    'timestamp': DateTime.now().toString(),
  });
  saveAccount(accountNumber, account);
  print('\$${amount.toStringAsFixed(2)} withdrawn successfully.');
}
