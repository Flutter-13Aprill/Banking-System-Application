import 'package:banking_system_application/models/account.dart';
import 'dart:io';


void viewTransactionsHistory({required List<Account> accounts}){

  if(accounts.isEmpty){
    print('\n\n----------------------------- View Transactions History -----------------------------\n\n');
    print('Oops! You must create an account before accessing this option.');
    print('\n\n------------------------------------------------------------------------------------\n\n');
    return;
  }

  print('\n\n----------------------------- View Transactions History -----------------------------\n\n');
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
  

  
  if(accounts[index].getTransactionHistory!.isEmpty){
    
    print('\n\n----------------------------- View Transactions History -----------------------------------------------------------------\n\n');
    print('Looks like you haven’t made any transactions yet for account ID ${accounts[index].getId}. Once you do, they’ll appear here!');
    print('\n\n-------------------------------------------------------------------------------------------------------------------------\n\n');
    return;
  }




  print('Account\'s ID: ${accounts[index].getId}');
  print('Current Balance: \$${accounts[index].getBalance}\n');
  for(final transaction in accounts[index].getTransactionHistory!){
    print('Name of operation: ${transaction.getNameOfOperation}');
    print('Amount: \$${transaction.getAmount}');
    print('Date: ${transaction.formatDate}');
    print('');
  }
  print('\n\n------------------------------------------------------------------------------------\n\n');

}