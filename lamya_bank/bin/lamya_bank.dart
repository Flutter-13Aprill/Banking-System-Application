import 'dart:io' as io;
import 'package:lamya_bank/close_the_accounts.dart' as close;
import 'package:lamya_bank/deposit_money.dart' as deposit;
import 'package:lamya_bank/create_account.dart' as create;
import 'package:lamya_bank/existing_account.dart' as account;
import 'package:lamya_bank/view_transaction_history.dart' as view;
import 'package:lamya_bank/withdrawt_money.dart' as withdrawt;

void main() {
  List<account.ExistingAccount> userAccounts = [];
  bool isRunning = true;
  int? choice;
  // Main Menu

  do {
    print("\n🏦 Welcome to Lamya's Bank 🏦");
    print("1. Create an Account");
    print("2. Deposit money");
    print("3. Withdrawt money");
    print("4. View transaction history");
    print("5. Close the accounts");
    print("6. Exit");
    print("\nChoose an option: ");

    // Exceptions for the users who enter a string in int fild
    try {
      choice = int.parse(io.stdin.readLineSync()!);
    } catch (e) {
      print("\x1B[31m ⚠️ Invalid input. Try again.\x1B[0m");
      continue;
    }

    switch (choice) {
      case 1:
        print("\n🏦 Welcome to Lamya's Bank\nLet's create your account 👤");
        create.createAccount(userAccounts);
        break;
      case 2:
        print("\nDeposit money");
        deposit.depositMoney(userAccounts);
        break;
      case 3:
        withdrawt.withdrawtMoney(userAccounts);
        break;
      case 4:
        view.viewTransaction(userAccounts);
        break;
      case 5:
        close.closeAccount(userAccounts);
        break;
      case 6:
        print("👋 Good bay ");
        isRunning = false;
        break;
      default:
        print("\x1B[31m\n❗ Invalid choice. Please try again.\x1B[0m");
        break;
    }
  } while (isRunning);
}
