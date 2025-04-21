import "dart:io" as io;
import "dart:math";

import "package:banking_system/Collections&Classes/account.dart";
import "package:banking_system/Collections&Classes/collections.dart";
import "package:banking_system/Validations/check_acoount_number.dart";
import "package:banking_system/Validations/check_int_input.dart";


// This to create a random number for the "accountNumber" attribute in the class "Account".
Random random = Random();

// This function create a new account with a unique "accountNumber" and save it on the list "accountsList".
void createAccount() {
  print("=== Welcome to Open Account Page ===");
  String userInputAccountName;
  String userInputAmount;
  while(true) {
    print("\n\n ~ Please enter name of the account ~ ");

    userInputAccountName = io.stdin.readLineSync()!;

    if(checkIsString(userInputAccountName)){

      while (true){
        print(" ~ Please enter the amount you want to deposit ~ ");
        
        userInputAmount = io.stdin.readLineSync()!;
        double moneyAmount = checkdoubleInput(userInputAmount);

        if (moneyAmount > 0) {
          Account account = Account(userInputAccountName, accountNumberExist(random.nextInt(10000)), moneyAmount, {DateTime.now() : "Account Creation with balance: $moneyAmount"});
          accountsList.add(account);
          print("\n");
          print(" <<< Account have been Opened Successfully >>> ");
          print("${"\n"}Account number:${account.accountNumber} ${"\n"}Balance: ${account.getMoney()}");
          return;
        }
        print("\n\n\x1B[33m!!! Invalid amount add, Please try again !!!\x1B[0m");
      }
    }
    print("\n\n\x1B[33m!!! The name entered is invalid, please try again !!!\x1B[0m");
  }
}