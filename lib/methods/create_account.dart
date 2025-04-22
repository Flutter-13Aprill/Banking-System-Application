import 'dart:convert';
import 'dart:io';

import 'package:banking_system_application/models/account.dart';

void createAccount({required List<Account> accounts, required Directory dir}){

  print('\n\n------------------------------- Creating Account -------------------------------\n\n');
  
  stdout.write('Enter your name: ');
  String? userName = stdin.readLineSync();

  while(userName!.trim().isEmpty){
    stdout.write('\nPlease make sure you have entered a valid name.\nEnter your name: ');
    userName = stdin.readLineSync();
  }

  final userAccount =  Account(name: userName);


  print('\nAll set, $userName! Your account has been created successfully. Welcome aboard!');
  print('Use ${userAccount.getId} as your ID for any future actions.');

  print('\n\n---------------------------------------------------------------------------------\n\n');

  // If the dir not exist create one
  // I made this because when I remove the last account in program the dir will be automatically removed
  if(!dir.existsSync()){
    dir.createSync();
  }

  accounts.add(userAccount);

  // Adding file name into accounts folder
  var filePath = '../accounts/${userAccount.getId}.json';
  var file = File(filePath);
  file.createSync();

  // Converting account properties into json file
  String jsonString = jsonEncode(userAccount.toJson());

  // Writing account properties into {userId}.json
  file.writeAsStringSync(jsonString);
  
}