import 'dart:io' as io;

import 'package:bancking/bank.dart';
import 'package:colorful_print/colorful_print.dart';

//This Method responsible to delete an account to the user from all files
Future<void> closeAccount() async {
  io.stdout.write("Enter the account number to delete: ");
  String? accountNumber = io.stdin.readLineSync();

  List<Map<String, dynamic>> accounts = await Bank().jsonReader("account.json");
  List<Map<String, dynamic>> transaction = await Bank().jsonReader(
    "transaction.json",
  );
  printColor(
    "Are you sure you want to delete this account? (y/n)",
    textColor: TextColor.orange,
  );
  String? confirmation = io.stdin.readLineSync();

  if (confirmation?.toLowerCase() == 'y') {
    accounts.removeWhere(
      (account) => account["accountNumber"].toString() == accountNumber,
    );
    transaction.removeWhere(
      (trans) => trans["accountNumber"].toString() == accountNumber,
    );
    await Bank().jsonWriter("account.json", accounts);
    await Bank().jsonWriter("transaction.json", transaction);
    printColor(
      "Account and associated transactions deleted successfully.\n",
      textColor: TextColor.green,
    );
  } else if (confirmation?.toLowerCase() == 'n') {
    printColor("Account deletion canceled.\n", textColor: TextColor.red);
  } else {
    printColor(
      "Invalid input. Please enter 'y' or 'n'.\n",
      textColor: TextColor.red,
    );
  }
}
