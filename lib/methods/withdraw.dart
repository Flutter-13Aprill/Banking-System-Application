import 'dart:convert';
import 'dart:io';
import 'package:banking_system_application/models/account.dart';

void withdraw({required List<Account> accounts}){

  if(accounts.isEmpty){

    print('\n\n------------------------------- Withdraw Money -------------------------------\n\n');
    print('Oops! You must create an account before accessing this option.');
    print('\n\n-------------------------------------------------------------------------------\n\n');

    return ;
  }

  print('\n\n------------------------------- Withdraw Money -------------------------------\n\n');
  stdout.write('Enter account\'s id: ');
  String? userId = stdin.readLineSync();
    
  // Check if the account is exist in the list
  Account intendedAccount = accounts.firstWhere((account) => account.getId! == userId, orElse: () => Account(name: null));
  int index = accounts.indexOf(intendedAccount);

  // If the account not in the list quit from the function
  if(index == -1){
    print('Access denied. You must create an account with this $userId id to proceed.');
    print('\n\n-----------------------------------------------------------------------------\n\n');
    return;
  }

  if (accounts[index].getBalance == 0){

    print('\n\n------------------------------- Withdraw Money -------------------------------\n\n');
    print('Oops! It looks like your account ${accounts[index].getId} is empty. Deposit funds to use banking features.');
    print('\n\n-------------------------------------------------------------------------------\n\n');

    return;

  }else{
    
    print('\nCurrent Balance: ${accounts[index].getBalance}');

    stdout.write('Enter the amount you\'d like to Withdraw: \$');
    double? amount = double.tryParse(stdin.readLineSync() ?? '');

    do{


      if(amount == null){

        stdout.write('\nAmount must be a positive value.\nPlease re-enter: \$');
        amount = double.tryParse(stdin.readLineSync() ?? '');

      }else if(amount < 0 || amount > 5000 || amount > accounts[index].getBalance!){

        stdout.write('\nYou cannot withdraw this amount — it exceeds your current balance or goes over the withdrawal limit of 5,000.\nPlease re-enter: \$');
        amount = double.tryParse(stdin.readLineSync() ?? '');

      }

    }while(amount == null || amount < 0 || amount > 5000 || amount > accounts[index].getBalance!);

    accounts[index].addTransaction(nameOfOperation: "Withdraw", amount: amount, date: DateTime.now());
    accounts[index].setBalance = accounts[index].getBalance! - amount;

    // Reaching to existing file to write new transaction
    var filePath = '../accounts/${accounts[index].getId}.json';
    var file = File(filePath);
    
    // Converting account properties into json file
    String jsonString = jsonEncode(accounts[index].toJson());
    
    // Writing account properties into {userId}.json
    file.writeAsStringSync(jsonString);

    print('\nWithdrawal successful! The amount has been deducted from your account.');
    print('\n\n-----------------------------------------------------------------------------\n\n');
  }
}