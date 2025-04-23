import 'dart:io' as io;

import 'package:bancking/bank.dart';
import 'package:bancking/transaction_model.dart';
import 'package:colorful_print/colorful_print.dart';

//This Method responsible to deposit Or Withdraw operation and save it in Json file(transaction.json)
Future<void> depositOrWithdraw(String fileName) async {
  String? accountNumber;
  int deposit;
  int withdraw;
  String? transactionType;
  int? amount;
  num accountBalnce = 0;
  String timestamp = DateTime.now().toString();
  bool isFound = false;

  do {
    //user enter account number
    io.stdout.write("Enter your account number : ");
    accountNumber = io.stdin.readLineSync()!;

    //read account.json to cheek if accountNumber is exist or not
    List<Map<String, dynamic>> userAccount = await Bank().jsonReader(
      "account.json",
    );

    isFound = userAccount.any(
      (account) => account['accountNumber'] == accountNumber,
    );
    if (!isFound) {
      printColor(
        "Account number not found. Please try again.\n",
        textColor: TextColor.red,
      );
    } else {
      printColor(
        "Account number has been verified.You can complete the transfer operations.\n",
        textColor: TextColor.green,
      );
    }
    //read file
    List<Map<String, dynamic>> transactionsData = await Bank().jsonReader(
      fileName,
    );

    accountBalnce =
        transactionsData.lastWhere(
          (balance) => balance['accountNumber'] == accountNumber,
          orElse: () => {'accountBalnce': 0},
        )['accountBalnce'];

  

    //transaction operation (Deposit or Withdraw )
    printColor("\nChoose a transaction type:\n");
    print("1.Deposit");
    print("2.Withdraw");
    io.stdout.write('\x1B[33mEnter your choice: \x1B[0m');
    int choice = int.parse(io.stdin.readLineSync()!);

    switch (choice) {
      //Deposit
      case 1:
        io.stdout.write("\nEnter deposit amount: ");
        deposit = int.parse(io.stdin.readLineSync()!);
        printColor("Depositing $deposit into account $accountNumber");

        transactionType = "deposit";
        amount = deposit;
      accountBalnce += deposit;
        printColor("Current balance: $accountBalnce");

      //Withdraw
      case 2:

        //Users can withdraw money while adhering to balance checks and withdrawal limits.
        print("\nEnter withdraw amount: ");
        withdraw = int.parse(io.stdin.readLineSync()!);

        printColor("Withdrawing $withdraw from account $accountNumber");
        transactionType = "withdraw";
        amount = withdraw;
        accountBalnce -= withdraw;
        printColor("Current balance: $accountBalnce");

      default:
        printColor(
          "Invalid input.Please Choose 1 or 2 \n",
          textColor: TextColor.red,
        );
    }

    //save data to Json file named (transaction.json)

    Bank.transactionInfo = TransactionModel(
      accountNumber,
      transactionType,
      amount,
      accountBalnce,
      timestamp,
    );
    // Add user transaction data as JSON to the transactionsData list
    transactionsData.add(Bank.transactionInfo.toJson());
    //write to the file
    Bank().jsonWriter(fileName, transactionsData);
  } while (!isFound);
}
