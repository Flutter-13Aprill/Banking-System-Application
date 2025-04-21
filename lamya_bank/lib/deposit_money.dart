import 'dart:io' as io;
import 'package:lamya_bank/existing_account.dart' as account;

depositMoney(List<account.ExistingAccount> userAccounts) {
  int? deposit;
  int? inputBankIdDeposit;
  //If the list empty
  if (userAccounts.isEmpty) {
    print(
      "\x1B[31m⚠️ You don't have an account yet, please create one.\x1B[0m",
    );
    return;
  }

  //Get deposit
  print("How much do you want to deposit into your account?");

  try {
    deposit = int.parse(io.stdin.readLineSync()!);
  } catch (e) {
    print("\x1B[31m⚠️ Invalid input.\x1B[0m");
    return;
  }

  // Get account number
  print("Before depositing, please enter your account number:");

  try {
    inputBankIdDeposit = int.parse(io.stdin.readLineSync()!);
  } catch (e) {
    print("\x1B[31m⚠️ Invalid input.\x1B[0m");
    return;
  }
  // Check for id and add deposit to the balance
  for (var account in userAccounts) {
    if (account.bankId == inputBankIdDeposit) {
      account.balance += deposit;
      account.depositTransactions[deposit] = DateTime.now();
      print("\x1B[32m$deposit SAR deposited successfully!\x1B[0m");
      print("Your current balance: ${account.balance} SAR");
    } else {
      print(
        "\x1B[31m❌ Account not found. Please check your account number.\x1B[0m",
      );
    }
  }
}
