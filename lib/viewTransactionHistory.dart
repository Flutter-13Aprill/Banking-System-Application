import 'dart:io';
import 'package:banking/loadAccount.dart';

void viewTransactionHistory() {
  stdout.write('Enter account number: ');
  final accountNumber = stdin.readLineSync()!;
  final account = loadAccount(accountNumber);
  if (account == null) return;

  final name = account['name'] ?? 'Unknown';

  print('\nTransaction History');
  print('User Name: $name');
  print('Account Number: $accountNumber\n');

  final transactions = account['transactions'] as List<dynamic>;
  if (transactions.isEmpty) {
    print('No transactions yet.');
    return;
  }

  for (var t in transactions) {
    final type = t['type'];
    final amount = t['amount'];
    final timestamp = t['timestamp'];
    print('$timestamp - $type: \$${amount.toStringAsFixed(2)}');
  }
}
