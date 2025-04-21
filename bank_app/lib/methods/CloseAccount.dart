// Importing necessary packages for the bank application
import 'dart:io';
import 'package:bank_app/bank_app.dart';
import 'package:bank_app/methods/UserBank.dart';

// Function to close a user's account
void closeAccount() {
  // Check if there are any users
  if (users.length == 0) {
    print("you dont have account");
    return; // Exit if no accounts exist
  }
  try {
    // Prompting the user to enter their account number
    print("Enter your account number:");
    String accountNumber = stdin.readLineSync()!.trim();
    // Finding the user with the matching account number
    UserBank? user = users.firstWhere((user) => user.id == accountNumber);
    if (user != null) {
      // Asking for confirmation to close the account
      print("Are you sure you want to close your account? yes or no");
      String ConfirmDeletion = stdin.readLineSync()!.trim();
      // Remove the user from the list if confirmed
      ConfirmDeletion == "yes" ? users.remove(user) : "";
    }
  } catch (e) {
    // Handling any errors that may occur
    print(e);
  }
}
