
import 'dart:io';

import 'package:assignment4/class/accounts.dart';
import 'package:assignment4/methods/addAccounts.dart';
import 'package:assignment4/methods/deleteAccount.dart';
import 'package:assignment4/methods/deposite.dart';
import 'package:assignment4/methods/printers.dart';
import 'package:assignment4/methods/viewAccount.dart';
import 'package:assignment4/methods/withdraw.dart';

void main() {

String? userInput;

do {
  printer();


userInput = stdin.readLineSync();



switch(userInput){


case '1':{

addAccount(accountList);


}


case '2':{

deposite(accountList);


}

case '3':

withDraw(accountList);



case '4':

{

viewHistory();

}




case '5':{

deleteAccount(accountList);

}

case '6':{
  exit(0);
}

 default:

{

  print('Please enter a valid number\n\n');
}



}




} while (userInput!=5);






}
