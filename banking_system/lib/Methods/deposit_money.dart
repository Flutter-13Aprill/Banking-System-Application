import 'dart:io' as io;

import 'package:banking_system/Collections&Classes/collections.dart';
import 'package:banking_system/Validations/check_acoount_number.dart';
import 'package:banking_system/Validations/check_int_input.dart';
import 'package:banking_system/home.dart';

// This function is to deposit an amount of money on a specific account.
void depositMoney () {
  
  print("=== Welcome to Deposit Page ===");

  String accountnum;

  while (true) {
    print("~ Please enter your account number to access the deposit menu ~");

    accountnum = io.stdin.readLineSync()!;
    
    int intAccountnum = accessAccountNumber(checkIntInput(accountnum));
    if (intAccountnum == -1) {
      print("\n\n\x1B[33m!!! The account number entered is wrong, Please try again !!!\x1B[0m");
      continue;
    }

    while (true) {
      String depositAmountString;
      print("~ Please enter how much do want to deposit: ~");

      depositAmountString = io.stdin.readLineSync()!;

      int depositAmount = checkIntInput(depositAmountString);
      if (depositAmount > 0) {
        accountsList[intAccountnum].setMoney(accountsList[intAccountnum].getMoney() + depositAmount);
        accountsList[intAccountnum].transactionHistory.addAll({DateTime.now() : "deposit: $depositAmount SAR"});
        print("\n\n");
        print(" <<< The Money have been deposited successfully  >>>");
        home();
      }
      print("\n\n\x1B[33m!!! Sorry the amount to deposit is invalid, Please try again !!!\x1B[0m");
    }
  }

}