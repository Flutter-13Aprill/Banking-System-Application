import 'dart:io' as io;

import 'package:banking_system/Collections&Classes/collections.dart';
import 'package:banking_system/Validations/check_acoount_number.dart';
import 'package:banking_system/Validations/check_int_input.dart';
import 'package:banking_system/home.dart';

void withdrawMoney () {
  
  print("=== Welcome to Withdraw Page ===");

  String accountnum;

  while (true) {
    print(" ~ Please enter your account number to access the withdraw menu ~ ");

    accountnum = io.stdin.readLineSync()!;
    
    int intAccountnum = accessAccountNumber(checkIntInput(accountnum));
    if (intAccountnum == -1) {
      print("\n\n\x1B[33m!!! The account number entered is wrong, Please try again !!!\x1B[0m");
      continue;
    }

    while (true) {
      String withdrawAmountString;
      print(" ~ Please enter how much do want to withdraw: ~");

      withdrawAmountString = io.stdin.readLineSync()!;

      int withdrawAmount = checkIntInput(withdrawAmountString);
      if (withdrawAmount > 0) {
        if (withdrawAmount <= accountsList[intAccountnum].getMoney()) {
          accountsList[intAccountnum].setMoney(accountsList[intAccountnum].getMoney() - withdrawAmount);
          accountsList[intAccountnum].transactionHistory.addAll({DateTime.now() : "Withdraw: $withdrawAmount SAR"});
          print("\n\n");
          print(" <<< The Money have been Withdrawn successfully  >>>");
          home();
        }
        print("");
        print("\n\n\x1B[33m!!! You are trying to withdraw more than your account have, Please try again !!!\x1B[0m");
        continue;
        
      }
      print("\n\n\x1B[33m!!! Sorry the amount to withdraw is invalid, Please try again !!!\x1B[0m");
    }
  }
  
}