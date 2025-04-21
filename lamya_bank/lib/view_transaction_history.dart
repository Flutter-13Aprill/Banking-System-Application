import 'dart:io' as io;
import 'package:lamya_bank/existing_account.dart' as account;

viewTransaction(List<account.ExistingAccount> userAccounts) {
  int? inputBankIdView;
  //If the list empty
  if (userAccounts.isEmpty) {
    print(
      "\x1B[31m⚠️ You don't have an account yet, please create one.\x1B[0m",
    );
    return;
  }

  // Get account number
  print("Please enter your account number to view transaction:");

  try {
    inputBankIdView = int.parse(io.stdin.readLineSync()!);
  } catch (e) {
    print("\x1B[31m⚠️ Invalid input.\x1B[0m");
    return;
  }
  //display the Transaction History for Account
  for (var account in userAccounts) {
    if (account.bankId == inputBankIdView) {
      print("\n📋 Transaction History for Account: ${account.bankId}");
      print("---------------------------------------");

      // Display deposit transactions
      if (account.depositTransactions.isNotEmpty) {
        print("💵 Deposit Transactions:");
        for (var entry in account.depositTransactions.entries) {
          print(
            "  - Deposited ${entry.key} SAR on ${entry.value.day}/${entry.value.month}/${entry.value.year}",
          );
        }
      } else {
        print("No deposit transactions found.");
      }

      // Display withdrawt transactions
      if (account.withdrawtransactions.isNotEmpty) {
        print("💵 Withdrawt Transactions:");
        for (var entry in account.withdrawtransactions.entries) {
          print(
            "  - Withdrawt ${entry.key} SAR on ${entry.value.day}/${entry.value.month}/${entry.value.year}",
          );
        }
      } else {
        print("No withdrawt transactions found.");
      }
    } else {
      print(
        "\x1B[31m❌ Account not found. Please check your account number.\x1B[0m",
      );
    }
  }
}
