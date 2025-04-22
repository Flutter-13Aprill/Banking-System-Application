import 'dart:io';

import 'package:assignment4/class/accounts.dart';

void deleteAccount(List<accounts> account) {

    print('please enter your id or 0 to quit');
  int? accountRemove = int.parse(stdin.readLineSync()!);

  int itrationNum = 0;
  bool founded = false;

  for (var item in account) {
    itrationNum++;
    if (item.getId() == accountRemove) {
      print('type 121 to validate that you want to delete the account permenantly');
      int validate = int.parse(stdin.readLineSync()!);
      if(validate == 121){
      account.removeAt(itrationNum - 1);
      
      print('The account ${item.getId()} Have been removed');
      
            break;
      }
      founded = true;

    }
  }

  if (founded == false) {
    print('Account not founded');
  
  }
  
  
  }

