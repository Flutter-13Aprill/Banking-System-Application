import 'dart:io';
import 'package:bank_system/create_account.dart';
import 'package:bank_system/deposit_money.dart';
import 'package:bank_system/withdraw_money.dart';
import 'package:bank_system/view_account_info.dart';
import 'package:bank_system/view_transaction_history.dart';
import 'package:bank_system/delete_account.dart';

void main() {
  bool isExit = false;
  print(DateTime.now());
  print(
    "\n---------------------------------------------------- Welcome to Alrajhi Back -----------------------------------------------------",
  );
  do {
    print("\nServices:");
    print("[1] Create Account");
    print("[2] View Account Info");
    print("[3] Deposit Money");
    print("[4] Withdraw Money");
    print("[5] View transaction history");
    print("[6] Delete account");
    print("[7] Exit");

    print("\nPlease choose what you want?");

    int? chosenOption;

    try {
      chosenOption = int.parse(stdin.readLineSync()!);
    } catch (e, s) {
      print("Error, please enter a valid number.");
      print("$s");
    }

    switch (chosenOption) {
      case 1:
        createAccount();
      case 2:
        viewAccountInfo();
      case 3:
        depositMoney();
      case 4:
        withdrawMoney();
      case 5:
        viewTransactionHistory();
      case 6:
        deleteAccount();
      case 7:
        isExit = false;
        exit(0);
      default:
        print("Wrong choice!");
    }
  } while (!isExit);
}
