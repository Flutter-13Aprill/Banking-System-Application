import 'dart:io';
import 'package:bank_system/variable.dart';

void viewAccountInfo() {
  print("Please enter your account number:");
  int accountNumber = int.parse(stdin.readLineSync()!);

  for (int i = 0; i < objects.length; i++) {
    if (objects[i].accountNumber == accountNumber) {
      print("\n**** Bank Account Information ****");
      print("User Name: ${objects[i].userName}");
      print("Account Number: ${objects[i].accountNumber}");
      print("Balance: ${objects[i].balance}");
      objects[i].transactioHistory[DateTime.now()] = "View Account Info";
      return;
    }
  }
  print(
    "No account found with account number $accountNumber. You can create a new account now.",
  );
}
