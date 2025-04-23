import 'dart:io' as io;

import 'package:colorful_print/colorful_print.dart';
import 'package:uuid/uuid.dart';

import '../bank.dart';
import '../json_model.dart';

//This Method responsible to create an account to the user and save it in Json file(account.json)
Future<String> createAccount(String fileName) async {
  String userName;
  String accountNumber = '';
  var uuid = Uuid();

  printColor("Creating account with number:\n", textColor: TextColor.blue);

  //user name
  io.stdout.write("Enter Your Name: ");
  userName = io.stdin.readLineSync()!;

  //Generate a uniq account number for the user by using UUID package
  //in while ensuring it contains only digits & the length is exactly 21
  while (accountNumber.length < 21) {
    accountNumber += uuid.v4().replaceAll(RegExp(r'\D'), '');
  }
  accountNumber = accountNumber.substring(0, 21);

  print("Your Account Number is : $accountNumber\n");

  printColor("Account created successfully.\n", textColor: TextColor.green);

  //save data to Json file named (account.json)
  //read the file
  List<Map<String, dynamic>> existingAccounts = await Bank().jsonReader(
    fileName,
  );

  Bank.userInfo = JsonModel(userName, accountNumber);
  // Add user account data as JSON to the existingAccounts list
  existingAccounts.add(Bank.userInfo.toJson());
  //write to the file
  await Bank().jsonWriter(fileName, existingAccounts);

  return fileName;
}
