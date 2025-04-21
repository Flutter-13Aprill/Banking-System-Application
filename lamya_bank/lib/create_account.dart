import 'dart:io' as io;
import 'dart:math' as math;
import 'package:lamya_bank/existing_account.dart' as account;

createAccount(List<account.ExistingAccount> userAccounts) {
  // Checking in the a list if user have account already
  if (userAccounts.isNotEmpty) {
    print("\x1B[31m\n⚠️ You already have an account.\x1B[0m");
    print("---------------------------------");
    print("👤 User Name: ${userAccounts.first.name}");
    print("🪪 Bank ID: ${userAccounts.first.bankId}");
    print("💰 Balance: ${userAccounts.first.balance} SAR");
    print("---------------------------------");
    return;
  }
  // Name enter
  print("\nPleas enter your Name:");
  String? inputName = io.stdin.readLineSync();
  if (inputName!.isEmpty) {
    print("\x1B[31m⚠️ Invalid name.\x1B[0m");
    return;
  }

  // Generate random number for id
  math.Random random = math.Random();
  int id = 100000 + random.nextInt(899999);
  int carrentBalance = 0;

  //Add to the list
  account.ExistingAccount newAccount = account.ExistingAccount(
    inputName,
    id,
    carrentBalance,
  );
  userAccounts.add(newAccount);
  //Display the info
  print("\x1B[32m\nyour account has been created successfully\x1B[0m");
  print("---------------------------------");
  print("👤 User Name: ${newAccount.name}");
  print("🪪 Bank ID: ${newAccount.bankId}");
  print("💰 Balance: ${newAccount.balance}SAR");
  print("---------------------------------");
}
