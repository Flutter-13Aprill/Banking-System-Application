import 'dart:convert';
import 'dart:io';


// Methods
import 'package:banking_system_application/methods/create_account.dart';
import 'package:banking_system_application/methods/close_account.dart';
import 'package:banking_system_application/methods/deposit.dart';
import 'package:banking_system_application/methods/view_transactions_history.dart';
import 'package:banking_system_application/methods/withdraw.dart';

// Model
import 'package:banking_system_application/models/account.dart';



void main() {

  bool isActiveProgram = true;
  List<Account> accounts = [];

  // Reading from files
  var dirPath = '../accounts';
  var dir = Directory(dirPath);

  if(!dir.existsSync()){

    dir.createSync();

  }else if(dir.existsSync() && dir.listSync().isNotEmpty){
    
    for(final entry in dir.listSync()){  
      
      // Getting file name with its extension
      String filePath = entry.path.split('/').last;

      // Getting full path of the file 
      File file = File('$dirPath/$filePath');

      String accountDataAsJson = file.readAsStringSync();

      Map<String,dynamic> decodeAccount = jsonDecode(accountDataAsJson);
      accounts.add(Account.fromJson(decodeAccount));
    }

  }

  print('\n------------------------- Welcome to the Bank -------------------------\n');

  do {

    stdout.write("""
1 - Create an account
2 - Deposit Money
3 - Withdraw Money
4 - View Transaction History
5 - Close Account
6 - Exit
Enter a number to perform an action: """);
    String? userSelection = stdin.readLineSync();

    try {
      if (userSelection == '1') {
        createAccount(accounts: accounts, dir: dir);
      } else if (userSelection == '2') {
        deposit(accounts: accounts);
      }else if (userSelection == '3'){
        withdraw(accounts: accounts);
      }else if(userSelection == '4'){
        viewTransactionsHistory(accounts: accounts);
      }else if (userSelection == '5'){
        closeAccount(accounts: accounts, dir: dir);
      }else if (userSelection == '6'){
        isActiveProgram = false;
      }else if (RegExp(r'^[A-Z]+[a-z]+|[a-z]+[A-Z]+|[a-z]+|[A-Z]+$').hasMatch(userSelection ?? '')){
        
        String correctWord = userSelection!.length > 1 ? 'sentence' : 'letter';
        throw Exception('You have entered a $correctWord\nMake sure to enter a corresponding number to perform an action\n');

      }else{
        
        throw Exception('You have entered a wrong number or special letter\nMake sure to enter a corresponding number to perform an action\n');

      }

    } catch (error) {
      print('\n\n----------------------------- Error -----------------------------\n\n');
      print(error);
      print('\n\n-----------------------------------------------------------------\n\n');
    }
  } while (isActiveProgram);

  print('\n----------------------     See you next time     ----------------------');
  print('\n----------------------       Made with Love      ----------------------');
  print('\n----------------------       GitHub: @2Mhd6      ----------------------\n');
}
