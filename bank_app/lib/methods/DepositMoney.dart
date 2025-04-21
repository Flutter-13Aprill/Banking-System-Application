// Importing necessary packages for the bank application
import 'dart:io';
import 'package:bank_app/bank_app.dart';
import 'package:bank_app/methods/UserBank.dart';

// Function to deposit money into a user's account
void depositMoney() {
  // Check if there are any users
  if (users.isEmpty) {
    print(
      "There are no users. Please create an account first.",
    ); // Prompt to create an account if none exist
    return; // Exit the function
  }

  try {
    // Prompting the user to enter their account number
    print("Enter your account number:");
    String accountNumber = stdin.readLineSync()!.trim();
    // Finding the user with the matching account number
    UserBank? user = users.firstWhere((user) => user.id == accountNumber);

    if (user != null) {
      // If user is found, prompt for the amount to deposit
      print("Enter the amount you want to deposit:");
      double addFunds = double.parse(stdin.readLineSync()!);
      // Update the user's balance
      user.balance += addFunds;
      // Log the deposit transaction with the current timestamp
      user.TransactionHistory["depositMoney"] =
          " $addFunds in ${DateTime.now().millisecondsSinceEpoch}";
      // Display the new balance
      print("The new balance is: ${user.balance}");
    } else {
      print(
        "You don't have an account.",
      ); // Inform the user if the account is not found
    }
  } catch (e) {
    // Handle any errors that may occur during the process
    print("Error: $e");
  }
}
