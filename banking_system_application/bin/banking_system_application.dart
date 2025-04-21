
import 'package:banking_system_application/Helper.dart';
import 'package:banking_system_application/classes/Account.dart';
import 'package:banking_system_application/classes/Bank.dart';
import 'dart:io'as io;
void main() {
  Bank bankAlbilad=Bank("Albilad");
  // create 2 account for test perpes
  bankAlbilad.createAcount(Account(0, false));
  bankAlbilad.createAcount(Account(0, false));
  Account userAccount;
  bool isExit=false;
  int userInput=int.parse(Helper.validateInput("int", "enter 1 to create account or 2 if you already have account or 3 to exit  :"));
  try{
    switch(userInput){
      case 1:
        Account account=Account(0, false); 
        userAccount=account;
        print("great your account id is : ${account.getAccountId()}");
        mnue2(userAccount,isExit);
      break;
      case 2:
        int userInput=int.parse(Helper.validateInput("int", "enter account id "));
        userAccount=bankAlbilad.getAccount(userInput);
        mnue2(userAccount,isExit);
      case 3:
        print("go out ***");
      break;
      default:
        print("please enter 1 to create account or 2 if you already have account: ");
      break;
    }
  }catch(e){
    print(e);
  }
  
}
mnue2(Account userAccount,bool isExit){
  while(!isExit){
    int userInput=int.parse(Helper.validateInput("int", " 1 for Deposit 2 for  Withdraw 3 for View Transactions 4 Close Account 5 for exit :"));
    switch(userInput){
      case 1:
        int value=int.parse(Helper.validateInput("int", "enter value: "));
        userAccount.depost(value);
      break;
      case 2:
        int value=int.parse(Helper.validateInput("int", "enter value: "));
        userAccount.withdraw(value); 
      case 3:
        userAccount.showTransactions(); 
      case 4:
        userAccount.closeAccount(); 
        isExit=true;
        print("go out  ***");
      break;
      case 5:
        isExit=true;
        print("go out  ***");
      break;
      default:
        print("please enter 1 for Deposit 2 for  Withdraw 3 for View Transactions 4 Close Account 5 for exit : ");
      break;
    }
  }
}