import 'dart:io';
import 'package:bank_system/variable.dart';

// Users can deposit money into their account by entering the account number and amount
void depositMoney() {
  print("Please enter your account number:");
  int accountNumber = int.parse(stdin.readLineSync()!);

  for (int i = 0; i < objects.length; i++) {
    if (objects[i].accountNumber == accountNumber) {
      print("Enter the amount you want to deposit:");
      double money = double.parse(stdin.readLineSync()!);
      objects[i].balance += money;
      objects[i].transactioHistory[DateTime.now()] = "Deposit: +$money";

      print("Deposit successful. Your new balance is: ${objects[i].balance}");
      return;
    }
  }
  print(
    "No account found with account number $accountNumber. You can create a new account now.",
  );
}
