import 'package:assignment4/class/accounts.dart';
import 'dart:io';

void viewHistory() {
  int userInputs;

  bool isExsists = false;

  do {
    print('please enter your id or 0 to quit');
    isExsists = false;
    userInputs = int.parse(stdin.readLineSync()!);
    for (final e in hitory.entries) {
      if (e.key == userInputs) {
            print('$test');
        
        isExsists = true;
      }
    }
    if (isExsists != true && userInputs != 0) {
      print('account doesnt exists !!!');
    }
  } while (userInputs != 0);
}
