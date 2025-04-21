import 'dart:io';
import 'package:banking/createAccount.dart';
import 'package:banking/depositMoney.dart';
import 'package:banking/withdrawMoney.dart';
import 'package:banking/viewTransactionHistory.dart';
import 'package:banking/closeAccount.dart';
void main() {
  while (true) {
    print('\n Banking System');
    print('1. Create an Account');
    print('2. Deposit Money');
    print('3. Withdraw Money');
    print('4. View Transaction History');
    print('5. Close Account');
    print('6. Exit');
    stdout.write('Choose Yor Option Please: ');
    final int ? option = int.parse(stdin.readLineSync()!);

    switch (option) {
      case 1:
        createAccount();
        break;
      case 2:
        depositMoney();
        break;
      case 3:
        withdrawMoney();
        break;
      case 4:
        viewTransactionHistory();
        break;
      case 5:
        closeAccount();
        break;
      case 6:
        print(' Goodbye!');
        return;
      default:
        print('Invalid Option. Please try again and select correct option.');
    }
  }
}






