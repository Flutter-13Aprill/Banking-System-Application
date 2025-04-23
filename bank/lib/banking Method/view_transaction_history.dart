// import 'dart:io' as io;
import 'dart:io' as io;

import 'package:bancking/bank.dart';
import 'package:colorful_print/colorful_print.dart';

Future<void> viewTransactionHistory() async {
  List<Map<String, dynamic>> transactions = await Bank().jsonReader(
    "transaction.json",
  );

  io.stdout.write("Enter your account number: ");
  String? accountNumber = io.stdin.readLineSync();

  printColor("\n--- View Transaction History ---\n", textColor: TextColor.blue);

  final userTransactions =
      transactions
          .where((trans) => trans["accountNumber"].toString() == accountNumber)
          .toList();

  for (var transData in userTransactions) {
    print(
      "Account: ${transData["accountNumber"]}\n"
      "Type: ${transData["type"]}\n"
      "Amount: ${transData["amount"]}\n"
      "Balance: ${transData["accountBalnce"]}\n"
      "Time: ${transData["timestamp"]}\n"
      "-------------------------------",
    );
  }
}
