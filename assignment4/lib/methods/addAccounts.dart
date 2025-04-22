import 'package:assignment4/class/accounts.dart';
import 'dart:io';

void addAccount(List<accounts> account) {
  accounts newAccount = accounts(0, 0,'','');

  int userInputs;
  bool isExsists = false;

  do {
    print('please enter your id to deposite or 0 to quit');
    isExsists = false;
    userInputs = int.parse(stdin.readLineSync()!);
    for (var e in account) {
      if (e.getId() == userInputs) {
        isExsists = true;
      }
    }
    if (isExsists != true && userInputs!=0) {
      newAccount.setId(userInputs);
      account.add(newAccount);
      print('the account was added');
      return;
    } else {
      print('account already exists !!!');
    }
  } while (userInputs != 0);
}
