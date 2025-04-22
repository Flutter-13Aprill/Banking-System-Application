import 'dart:io';

import 'package:assignment4/class/accounts.dart';

void deposite(List<accounts> account) {
  int userInputs;

  bool isExsists = false;

  do {
    print('please enter your id or 0 to quit');
    isExsists = false;
    userInputs = int.parse(stdin.readLineSync()!);
    for (var e in account) {
      if (e.getId() == userInputs) {
        print('please enter amount to deposite');
        userInputs = int.parse(stdin.readLineSync()!);

        e.setBalance(userInputs + e.getBalance()!);
        e.setTimeNow(DateTime.now());
        e.setType('Deposite');
        hitory[e.getId()!] =
            'Type of transaction:${e.getType()} Balance before transaction${e.getBalance()! - userInputs} Amount that deposited:$userInputs new Balance: ${e.getBalance()} time of transaction${e.getiTimeNow()}';
        test.add('${hitory[e.getId()!]}');
        isExsists = true;
        print('the deopsite was added');
      }
    }
    if (isExsists != true && userInputs != 0) {
      print('account doesnt exists !!!');
    }
  } while (userInputs != 0);
}
