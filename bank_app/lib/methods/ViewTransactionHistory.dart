// Importing necessary packages for the bank application

import 'dart:io';
import 'package:bank_app/bank_app.dart';
import 'package:bank_app/methods/UserBank.dart';

// Function to view the transaction history of a user's account
void ViewTransactionHistory() {
  try {
    // Prompting the user to enter their account number
    print("Enter your account number:");
    String acountNumber = stdin.readLineSync()!.trim();
    // Finding the user with the matching account number
    UserBank user = users.firstWhere((user) => user.id == acountNumber);
    if (user != null) {
      // If user is found, iterate through their transaction history
      for (var element in user.TransactionHistory.entries) {
        // Print each transaction type and its details
        print("${element.key}    ${element.value}");
      }
    }
  } catch (e) {
    // Handle any errors, such as if the account number is not found
    print(e);
  }
}
