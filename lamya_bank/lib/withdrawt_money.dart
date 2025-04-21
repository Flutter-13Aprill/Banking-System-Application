import 'dart:io' as io;
import 'package:lamya_bank/existing_account.dart' as account;

withdrawtMoney(List<account.ExistingAccount> userAccounts) {
  int? withdraw;
  int? inputBankIdWithdraw;
  //If the list empty
  if (userAccounts.isEmpty) {
    print(
      "\x1B[31m⚠️ You don't have an account yet, please create one.\x1B[0m",
    );
    return;
  }
  // Get withdraw
  print("How much do you want to withdraw from your account?");

  try {
    withdraw = int.parse(io.stdin.readLineSync()!);
  } catch (e) {
    print("\x1B[31m⚠️ Invalid input.\x1B[0m");
    return;
  }

  // Get account number
  print("Before depositing, please enter your account number:");

  try {
    inputBankIdWithdraw = int.parse(io.stdin.readLineSync()!);
  } catch (e) {
    print("\x1B[31m⚠️ Invalid input.\x1B[0m");
    return;
  }
  // Check for id and remove withdraw from the balance
  for (var account in userAccounts) {
    if (account.bankId == inputBankIdWithdraw) {
      if (withdraw > account.balance) {
        print("\x1B[31m💰Insufficient balance\x1B[0m");
        print("Your current balance: ${account.balance} SAR");
        return;
      }
      account.balance -= withdraw;
      account.withdrawtransactions[withdraw] = DateTime.now();
      print("\x1B[32m$withdraw SAR withdraw successfully!\x1B[0m");
      print("Your current balance: ${account.balance} SAR");
    } else {
      print(
        "\x1B[31m❌ Account not found. Please check your account number.\x1B[0m",
      );
    }
  }
}
