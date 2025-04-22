import 'dart:io';

// Model 
import 'package:banking_system_application/models/account.dart';

void closeAccount({required List<Account> accounts, required Directory dir}){

  if(accounts.isEmpty){
    print('\n\n----------------------------------- Close account -----------------------------------\n\n');
    print('Oops! You must create an account before accessing this option.');
    print('\n\n----------------------------------------------------------------------------------------\n\n');
    return;
  }
  
  print('\n\n----------------------------------- Close account -----------------------------------\n\n');
  stdout.write('Enter account\'s id: ');
  String? userId = stdin.readLineSync();
    
  // Check if the account is exist in the list
  Account intendedAccount = accounts.firstWhere((account) => account.getId! == userId, orElse: () => Account(name: null));
  int index = accounts.indexOf(intendedAccount);

  // If the account not in the list quit from the function
  if(index == -1){
    print('\n\n------------------------------- Close account -------------------------------\n\n');
    print('Oops! It looks like the account with ID $userId doesn\'t exist. ');
    print('\n\n-----------------------------------------------------------------------------\n\n');
    return;
  }

  stdout.write('Are you sure you want to delete ${accounts[index].getId} account (yes/no):');
  String? userDecision = stdin.readLineSync();

  if(userDecision!.toLowerCase().startsWith('y')){
    
    final removedAccount = accounts.removeAt(index);
    print('\nThis account with ID ${removedAccount.getId} has been successfully deleted.');

    // Deleting the file of specific id
    var filePath = '../accounts/${removedAccount.getId}.json';
    var file = File(filePath);
    file.deleteSync();

  }else{
    print('\nNo worries — your account information with ID ${accounts[index].getId} remains safe and hasn’t been deleted.');
  }
  print('\n\n----------------------------------------------------------------------------------------\n\n');

  // If you deleted last account the dir will be automatically removed
  if(accounts.isEmpty){
    dir.deleteSync();
  }
  return;
}