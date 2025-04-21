import 'dart:io' as io;
import 'package:banking_system/Methods/close_account.dart';
import 'package:banking_system/Methods/create_account.dart';
import 'package:banking_system/Methods/deposit_money.dart';
import 'package:banking_system/Methods/exit_program.dart';
import 'package:banking_system/Methods/view_history.dart';
import 'package:banking_system/Methods/withdraw_money.dart';
import 'package:banking_system/Validations/check_int_input.dart';

// This is the home page where the user can choose what to do.
home() {
  String homeChoice;

while (true) {
  print("=== Welcome to home Page ===");
  print("\n\n Please choose and option");
  print("\n Open an account      === 1"); 
  print("\n Deposits             === 2"); 
  print("\n Withdraws            === 3"); 
  print("\n Transations history  === 4"); 
  print("\n Close an account     === 5");
  print("\n Exit Program         === 6");
  
  
    homeChoice = io.stdin.readLineSync()!;
    switch (checkIntInput(homeChoice)) {

      case 1:
        createAccount(); // Open a new account.
        break;

      case 2:
        depositMoney(); // Deposit in an account.
        break;

      case 3:
        withdrawMoney(); // Withdraw from an account.
        break;

      case 4:
        transactionHistory(); // View all the transactions of an account.
        break;

      case 5:
        closeAccount(); // Close an open account.
        break;

      case 6:
        exitProgram(); // Exit the program.
        break;

      default:
    }
  }
  
}