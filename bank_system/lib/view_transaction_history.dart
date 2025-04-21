import 'dart:io';
import 'package:bank_system/variable.dart';

// Displays all past transactions with datetime
void viewTransactionHistory() {
  print("Please enter your account number:");
  int accountNumber = int.parse(stdin.readLineSync()!);

  for (int i = 0; i < objects.length; i++) {
    if (objects[i].accountNumber == accountNumber) {
      print("\nTransaction History");
      for (var date in objects[i].transactioHistory.keys) {
        print("$date : ${objects[i].transactioHistory[date]}");
      }
      return;
    }
  }
  print(
    "No account found with account number $accountNumber. You can create a new account now.",
  );
}
