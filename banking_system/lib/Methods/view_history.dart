import 'dart:io' as io;
import 'package:banking_system/Collections&Classes/collections.dart';
import 'package:banking_system/Validations/check_int_input.dart';

void transactionHistory() {

  print("=== Welcome to Transaction History Page ===");

  // This statment check if there is any "Account" in the list "accountList".
  if (accountsList.isEmpty) {
    print("\n\nThere is not any accounts, Taking you back to === Home Page ===");
    return;
  }

  String accountNumberString;
  int accountNumber;
  while (true) {

    print("~ Please enter the account number you want to display it's transaction history ~");
    accountNumberString = io.stdin.readLineSync()!;

    accountNumber = checkIntInput(accountNumberString);

    for (var element in accountsList) {
      if (element.accountNumber == accountNumber) {
        print("\n\n\x1B[32 The account transactions history have been acquierd Successfully\x1B[0m");
        print(element.transactionHistory);
        return;
      }
    }

    print("\n\n\x1B[33m!!! The account number entered is wrong, Please try again !!!\x1B[0m");
  }
}
  