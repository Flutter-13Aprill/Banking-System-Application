import 'dart:io';
import 'package:bank_system/variable.dart';

// Deletes the user account
void deleteAccount() {
  print("Please enter the account number you want to delete:");
  int accountNumber = int.parse(stdin.readLineSync()!);
  for (int i = 0; i < objects.length; i++) {
    if (objects[i].accountNumber == accountNumber) {
      print("Are you sure you want to delete this account?");
      print("Press 1 for Yes, press 0 for No:");
      int confirmDelete = int.parse(stdin.readLineSync()!);

      if (confirmDelete == 1) {
        objects.remove(objects[i]);
        print("Account with number $accountNumber deleted successfully.");
      }
      return;
    }
  }
  print(
    "No account found with account number $accountNumber. You can create a new account now.",
  );
}
