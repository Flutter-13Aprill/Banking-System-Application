import 'dart:io' as io;
import 'package:lamya_bank/existing_account.dart' as account;

closeAccount(List<account.ExistingAccount> userAccounts) {
  int? inputBankIdClose;
  //If the list empty
  if (userAccounts.isEmpty) {
    print(
      "\x1B[31m⚠️ You don't have an account yet, please create one.\x1B[0m",
    );
    return;
  }

  // Get account number
  print("Please enter your account number to delete the account:");

  try {
    inputBankIdClose = int.parse(io.stdin.readLineSync()!);
  } catch (e) {
    print("\x1B[31m⚠️ Invalid input.\x1B[0m");
    return;
  }
  // Deleting the account with confirmation message
  String? choice;
  for (int i = userAccounts.length - 1; i >= 0; i--) {
    if (userAccounts[i].bankId == inputBankIdClose) {
      print(
        "\x1B[33m⚠️ Confirm close account #$inputBankIdClose? (y/n)\x1B[0m",
      );
      choice = io.stdin.readLineSync();
      if (choice?.toLowerCase() == 'y') {
        userAccounts.removeAt(i);
        print("\x1B[32mAccount closed\x1B[0m");
      } else {
        print("\x1B[34mCancelled\x1B[0m");
      }
    }
  }
}
