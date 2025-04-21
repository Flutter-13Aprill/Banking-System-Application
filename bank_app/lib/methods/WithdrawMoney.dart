// Importing necessary packages for the bank application
import 'dart:io';
import 'package:bank_app/bank_app.dart';
import 'package:bank_app/methods/UserBank.dart';

// Function to withdraw money from a user's account
void withdrawMoney() {
  // Check if there are any users
  if (users.isEmpty) {
    print("you dont have account"); // Inform user if no accounts exist
    return; // Exit the function
  }

  try {
    // Prompting the user to enter their account number
    print("enter your account number");
    String acountNumber = stdin.readLineSync()!;
    // Finding the user with the matching account number
    UserBank exitUser = users.firstWhere((user) => user.id == acountNumber);
    // If user is found, prompt for the amount to withdraw
    if (exitUser != null) {
      print("enter your  money that you want to withdraw ");
      // Deduct the amount from the user's balance
      double withdrawmoney = double.parse(stdin.readLineSync()!);
      if (exitUser.balance >= withdrawmoney) {
        exitUser.balance = exitUser.balance - withdrawmoney;
        // Log the withdrawal transaction with the current timestamp
        exitUser.TransactionHistory["withdrawMoney"] =
            " in  $withdrawmoney in ${DateTime.now().millisecondsSinceEpoch}";
        // Display the new balance
        print("new balance is: ${exitUser.balance}");
      } else {
        print("your balance is less than the money you want to withdraw");// Inform user if insufficient funds
      }
    } else {
      print("you must enter acount Number correctly "); // Inform user if the account number is incorrect
    }
  } catch (e) {
    print(e);    // Handle any errors that may occur during the process

  }
}
