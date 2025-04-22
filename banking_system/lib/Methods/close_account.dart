import 'dart:io' as io;

import 'package:banking_system/Collections&Classes/collections.dart';
import 'package:banking_system/Validations/check_acoount_number.dart';
import 'package:banking_system/Validations/check_int_input.dart';

// This function close the account you enter it's number
void closeAccount () {
   print("=== Welcome to Close Account Page ===");

   // This statment check if there is any "Account" in the list "accountList".
  if (accountsList.isEmpty) {
    print("\n\nThere is not any accounts, Taking you back to === Home Page ===");
    return;
  }
  
  String accountnum;

  while (true) {
    print("\n\n ~ Please enter the account number you want to close ~ ");

    accountnum = io.stdin.readLineSync()!; 
    
    int intAccountnum = accessAccountNumber(checkIntInput(accountnum));
    if (intAccountnum == -1) {
      print("\n\n\x1B[33m!!! The account number entered is wrong, Please try again !!!\x1B[0m");
      continue;
    }

    // This section is for the confirmation of closing the account.
    String closeAccountConfirmation;
    while (true) {
      print("\n ~ Are you sure you want to close the account: ~\n\n\x1B[32mYes\x1B[0m \n\x1B[31mNo\x1B[0m");
      closeAccountConfirmation = io.stdin.readLineSync()!;
      switch (closeAccountConfirmation.toLowerCase()) {
        case "yes":
          accountsList.removeAt(intAccountnum);
          print("\n\n");
          print(" <<< account have been closed Successfully >>>");
          return;
        
        case "no":
          print("Taking you back to === Home Page ===");
          return;

        default:
        print("\n\n\x1B[33m !!! Sorry the entered input is invalid, Please try agian !!!\x1B[0m");
        continue;
      }

    }
    
}

}