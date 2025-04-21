import 'dart:io';
import 'package:bank_system/bank_class.dart';
import 'package:bank_system/unique_account_number.dart';
import 'package:bank_system/variable.dart';

// Allows the user to open a new account, a unique account number is generated and stored
void createAccount() {
  print("Please enter your name:");
  String userName = stdin.readLineSync()!;

  for (int i = 0; i < objects.length; i++) {
    if (objects[i].userName == userName) {
      print("An account already exists for $userName.");
      return;
    }
  }
  int accountNumber = uniqueAccountNumber();
  Bank account = Bank(accountNumber, userName, 0, {
    DateTime.now(): "Account Created",
  });
  objects.add(account);
  print("Account created successfully with account number: $accountNumber");
}
