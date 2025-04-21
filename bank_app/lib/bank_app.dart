// Importing necessary packages for the bank application
import 'dart:io';
import 'package:bank_app/methods/CloseAccount.dart';
import 'package:bank_app/methods/DepositMoney.dart';
import 'package:bank_app/methods/UserBank.dart';
import 'package:bank_app/methods/CreateAccount.dart';
import 'package:bank_app/methods/ViewTransactionHistory.dart';
import 'package:bank_app/methods/WithdrawMoney.dart';

// List to store users
List<UserBank> users = [];
// Main function to display the main menu
void mainMenu() {
  while (true) {
    try {
      // Displaying menu options
      print("1.Create an Account");
      print("2.Deposit Money");
      print("3.Withdraw Money");
      print("4.View Transaction History");
      print("5.Close Account");
      print("6. exit");
      String userInput = stdin.readLineSync()!;
      // Handling user input
      switch (userInput) {
        case "1":
          createAccount();// Create a new account
          break;
        case "2":
          depositMoney();// Deposit money into an account
          break;
        case "3":
          withdrawMoney();// Withdraw money from an account
          break;
        case "4":
          ViewTransactionHistory();// View all past transactions
          break;
        case "5":
          closeAccount();// Close the user's account
          break;
        case "6":
          print("goodbye "); // Exit the program
          exit(0);
        default:
          print("please enter correct choise"); // Handle invalid input
      }
    } catch (e) {
      print("error is $e");// Handle any errors
    }
  }
}
