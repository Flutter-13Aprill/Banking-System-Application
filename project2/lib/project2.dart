import 'dart:io';
import 'functions.dart';
void main() {
  createFolders();

  while (true) {
    print('\n Welcome In Almansour Banking System');
    print('\n 1. Create Account');
    print('\n 2. Deposit Money');
    print('\n 3. Withdraw Money');
    print('\n 4. View Transaction History');
    print('\n 5. Close Account');
    print('\n 6. Exit');

    stdout.write('Enter your choice: ');
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        createAccount();
        break;
      case '2':
        depositMoney();
        break;
      case '3':
        withdrawMoney();
        break;
      case '4':
        viewTransactions();
        break;
      case '5':
        closeAccount();
        break;
      case '6':
        print('Thanks for using our system');
        return;
      default:
        print('Please select true choics and try again');
    }
  }
}
