import 'dart:ffi';
import 'dart:math';
import 'package:assignment4/assignment4.dart' as assignment4;
import 'dart:io' as io;

int? money;
int? accountNum;
String? name;
Map<int?, int> storeData = {}; //map to store account info
void main() {
  print('Hello, Enter your name please:');
  name = io.stdin.readLineSync();

  print("\nWelcome $name, What do you want to do?:\n");

  print('1.Create an account'); //program options
  print('2.Deposit Money.');
  print('3.Withdraw Money.');
  print('4.Close an account.');
  print('5.Exit');

  String? options = io.stdin.readLineSync();

  switch (options) {
    //case to implement the options
    case '1': //create account option
      createAccount();

      while (options != '5') {
        //while loop to reshow the options until the user enter 5 to exit
        print('\n\nDo you want another service?\n');

        print('1.Create an account');
        print('2.Deposit Money.');
        print('3.Withdraw Money.');
        print('4.View Transaction History.');
        print('5.Close an account.');
        print('6.Exit');
        options = io.stdin.readLineSync();

        if (options == '2') {
          //option deposit money
          deposit(); //call a function
        } else if (options == '3') {
          //option withdraw money
          print('How much money do you want to withdraw?');

          print(
            withdrowFunction(io.stdin.readLineSync() as int),
          ); //call a function
        } else if (options == '4') {
          //option close account
          closeAcccount(); //call a function
        }
      }
  }
  print("Thank you, Goodbye"); //goodbye message
}

createAccount() {
  //function to create an account
  accountNum = Random().nextInt(2000) as int?;

  storeData[accountNum] = 0;

  print("\nHello $name, your account number is:\n");

  print(storeData.toString());
}

deposit() {
  //function to deposit the money
  print("can you provide me with your account number?");

  int? num = int.parse(io.stdin.readLineSync()!) as int?;

  if (num == accountNum) {
    print("Enter the amount of money you want to deposit:");

    money = int.parse(io.stdin.readLineSync()!) as int?;

    storeData[accountNum] = money as int;

    print('\nYour money has deposited  successfully:\n');

    print(storeData.toString());
  } else {
    print('invalid account number');
  }
}

int? withdrowFunction(int withdraw) {
  //function to withdraw money
  print('What is your account number?');

  accountNum = io.stdin.readLineSync() as int?;

  int? result = money! - withdraw;

  return storeData[accountNum] = result;
}

closeAcccount() {
  //function to close an account
  print(storeData);

  storeData.remove(accountNum);

  print("your account has been closed successfully:");

  print(storeData);
}
