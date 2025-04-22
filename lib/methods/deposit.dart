import 'dart:convert';
import 'dart:io';
import 'package:banking_system_application/models/account.dart';


void deposit({required List<Account> accounts}){

  if(accounts.isEmpty){

    print('\n\n------------------------------- Deposit Money -------------------------------\n\n');
    print('Oops! You must create an account before accessing this option.');
    print('\n\n-----------------------------------------------------------------------------\n\n');
    return ;

  }else{

    print('\n\n------------------------------- Deposit Money -------------------------------\n\n');

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
    }else{
      
      print('\nCurrent Balance: ${accounts[index].getBalance}');
      stdout.write('Enter the amount you\'d like to deposit: \$');
      double? balance = double.tryParse(stdin.readLineSync() ?? '');

      while(balance == null || balance < 0){
        stdout.write('\nAmount must be a positive value.\nPlease re-enter: \$');
        balance = double.tryParse(stdin.readLineSync() ?? '');
      }
      
      accounts[index].addTransaction(nameOfOperation: "Deposit", amount: balance, date: DateTime.now());
      accounts[index].setBalance = accounts[index].getBalance! + balance;

    print('Deposit successful! Your funds have been added to the account with ID: ${accounts[index].getId}.');
    print('\n\n-----------------------------------------------------------------------------\n\n');
    
    // Reaching to existing file to write new transaction
    var filePath = '../accounts/${accounts[index].getId}.json';
    var file = File(filePath);
    
    // Converting account properties into json file
    String jsonString = jsonEncode(accounts[index].toJson());
    
    // Writing account properties into {userId}.json
    file.writeAsStringSync(jsonString);

    }
  }
}