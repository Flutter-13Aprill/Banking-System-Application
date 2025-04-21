import 'dart:io';
import 'package:bank_system/variable.dart';

// Users can withdraw money while adhering to balance checks and withdrawal limits
void withdrawMoney() {
  print("Please enter your account number:");
  int accountNumber = int.parse(stdin.readLineSync()!);

  for (int i = 0; i < objects.length; i++) {
    if (objects[i].accountNumber == accountNumber) {
      print("Enter the amount you want to withdraw:");
      double money = double.parse(stdin.readLineSync()!);
      if (objects[i].balance < money) {
        print("Insufficient balance.");
        return;
      } else if (withdrawalLimits < money) {
        print(
          "Withdrawal amount exceeds the withdrawal limit of $withdrawalLimits",
        );
        return;
      }
      objects[i].balance -= money;
      objects[i].transactioHistory[DateTime.now()] = "Withdrawal: -$money";
      print(
        "Withdrawal successful. Your new balance is: ${objects[i].balance}",
      );
      return;
    }
  }
  print(
    "No account found with account number $accountNumber. You can create a new account now.",
  );
}
