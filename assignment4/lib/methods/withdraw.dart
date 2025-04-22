import 'dart:io';

import 'package:assignment4/class/accounts.dart';

void withDraw(List<accounts> account) {
  int userInputs;

  bool isExsists = false;

  do {
    print('please enter your id or 0 to quit');
    isExsists = false;
    userInputs = int.parse(stdin.readLineSync()!);
    for (var e in account) {
      if (e.getId() == userInputs) {
        print('please enter amount to withdraw');
        userInputs = int.parse(stdin.readLineSync()!);
        isExsists = true;

        if (e.getBalance()! >= userInputs) {
          e.setBalance(e.getBalance()! - userInputs);
          e.setTimeNow(DateTime.now());
          e.setType('Withdraw');
          hitory[e.getId()!] =
              'Type of transaction:${e.getType()} Balance before transaction${e.getBalance()! + userInputs} Amount that withdrawing:$userInputs new Balance: ${e.getBalance()} time of transaction${e.getiTimeNow()}';
          test.add('${hitory[e.getId()!]}');
                print('the withdraw was taking');

        } else {
          print(
            'Out of range please enter a number that in range of your Balance which is ${e.getBalance()}',
          );
        }
      }
    }
    if (isExsists != true && userInputs != 0) {
      print('account doesnt exists !!!');
    }
  } while (userInputs != 0);
}
