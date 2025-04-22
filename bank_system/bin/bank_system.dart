import 'dart:io' as io;
import 'dart:math'; // this to generate randome number for account
Map<String, Map<String, dynamic>> accounts = {};
const double withdrawalLimit = 500.0; //with drawing limit

void main() {
  bool run = true;
  while (run) {
    print("1 - Create an Account");
    print("2 - Deposit Money");
    print("3 - Withdraw Money");
    print("4 - View Transaction History");
    print("5 - Close Account");
    print("0 - Exit");

    int choice = -1;
    while (choice < 0 || choice > 5) {
      print('\x1B[34mPlease choose a service from the list:\x1B[0m'); // Blue color

      try {
        String? input = io.stdin.readLineSync();
        if (input == null || input.trim().isEmpty) {
          throw FormatException();
        }
        choice = int.parse(input);
        if (choice < 0 || choice > 5) {
          print('\x1B[31m============= Please enter a number between 0-5 =============\x1B[0m');
        }
      } catch (e) {
        print('\x1B[31m========== Invalid input - please enter a number between 0-5 ============\x1B[0m');
        choice = -1;
      }
    }

    switch (choice) {
      case 1:
        createAccount();
        break;
      case 2:
        depositMoney();
        break;
      case 3:
        withdrawMoney();
        break;
      case 4:
        viewTransactionHistory();
        break;
      case 5:
        closeAccount();
        break;
      case 0:
        print("Thank you for visiting, goodbye 👋");
        run = false;
        break;
    }
    print(""); // Add an empty line for better readability
  }
}




// This function creates an account
void createAccount() {
  print("Enter your name:");
  String? name = io.stdin.readLineSync();

  if (name == null || name.trim().isEmpty) {
    print('\x1B[31mName cannot be empty. Account not created.\x1B[0m');  // validation
    return;
  }

  // Generate a unique account number from 6 digit (you not specefy how many digit in redmy)
  String accountNumber;
  do {
    accountNumber = (100000 + Random().nextInt(900000)).toString();
  } while (accounts.containsKey(accountNumber)); // Ensure uniqueness

  // Save account details
  accounts[accountNumber] = { // add this account to mapp, and lit its balance = 0 as strting
    'name': name.trim(),
    'balance': 0.0,       
    'transactions': <String>[] // i tought if you want to see all acount, maybe i will make it as class give it 3 objects, but finally i crate it as map inside map
  };

  print('\x1B[32mAccount successfully created!\x1B[0m');
  print('Name: $name');
  print('Account Number: $accountNumber');
}


void depositMoney() {
  print("Enter your account number:");
  String? accNumber = io.stdin.readLineSync();

  if (accNumber == null || !accounts.containsKey(accNumber)) {
    print('\x1B[31mAccount not found. Please check the number.\x1B[0m');
    return;
  } // as always check validation

  print("Enter amount to deposit:");
  String? amountInput = io.stdin.readLineSync();
  double? amount;

  try {
    if (amountInput == null || amountInput.trim().isEmpty) throw FormatException();
    amount = double.parse(amountInput);
    if (amount <= 0) throw FormatException();
  } catch (e) {
    print('\x1B[31mInvalid amount. Please enter a positive number.\x1B[0m');
    return;
  } // check validation for amout mony input

  // Add to balance
  accounts[accNumber]!['balance'] += amount; // couse it map inside map

  // Record transaction
  String timestamp = DateTime.now().toString(); // i will use it also in transaction history
  accounts[accNumber]!['transactions'].add("Deposited \$${amount.toStringAsFixed(2)} at $timestamp");

  print('\x1B[32mDeposit successful!\x1B[0m');
  print("New Balance: \$${accounts[accNumber]!['balance'].toStringAsFixed(2)}");
}


void withdrawMoney() {
  print("Enter your account number:");
  String? accNumber = io.stdin.readLineSync();

  if (accNumber == null || !accounts.containsKey(accNumber)) {
    print('\x1B[31mAccount not found. Please check the number.\x1B[0m');
    return;
  }

  print("Enter amount to withdraw (max \$${withdrawalLimit.toStringAsFixed(2)}):");
  String? amountInput = io.stdin.readLineSync();
  double? amount;

  try {
    if (amountInput == null || amountInput.trim().isEmpty) throw FormatException();
    amount = double.parse(amountInput);
    if (amount <= 0 || amount > withdrawalLimit) throw FormatException();
  } catch (e) {
    print('\x1B[31mInvalid amount. Must be a positive number not exceeding \$${withdrawalLimit.toStringAsFixed(2)}.\x1B[0m');
    return;
  }
  // all above in this function to check validation

  double currentBalance = accounts[accNumber]!['balance']; // this corrent balance to decrese amount from it

  if (amount > currentBalance) { // you cant pay more then mony you have
    print('\x1B[31mInsufficient balance. Your current balance is \$${currentBalance.toStringAsFixed(2)}\x1B[0m');
    return;
  }

  // check from balance
  accounts[accNumber]!['balance'] -= amount; // if you have tihs amount from mony, and its not more then 500, will do it

  // Log transaction
  String timestamp = DateTime.now().toString();// for transaction history
  accounts[accNumber]!['transactions'].add("Withdrew \$${amount.toStringAsFixed(2)} at $timestamp");

  print('\x1B[32mWithdrawal successful!\x1B[0m');
  print("Remaining Balance: \$${accounts[accNumber]!['balance'].toStringAsFixed(2)}");
}


void viewTransactionHistory() {
  print("Enter your account number:");
  String? accNumber = io.stdin.readLineSync();

  if (accNumber == null || !accounts.containsKey(accNumber)) {
    print('\x1B[31mAccount not found. Please check the number.\x1B[0m');
    return;
  }// check validation for you account number, in every operation

  List<String> history = List<String>.from(accounts[accNumber]!['transactions']);

  print('\x1B[36m=== Transaction History for Account $accNumber ===\x1B[0m');

  if (history.isEmpty) {
    print("No transactions found.");
  } else {
    for (var entry in history) {
      print("- $entry");
    }
  } // this form transaction list in side the map, evry time with every operatin the system add the transaction to the list
}


void closeAccount() {
  print("Enter your account number:");
  String? accNumber = io.stdin.readLineSync();

  if (accNumber == null || !accounts.containsKey(accNumber)) {
    print('\x1B[31mAccount not found. Please check the number.\x1B[0m');
    return;
  }// check validation

  print("Are you sure you want to close this account? This action is irreversible. (yes/no):");
  String? confirm = io.stdin.readLineSync();

  if (confirm != null && confirm.trim().toLowerCase() == 'yes') {
    accounts.remove(accNumber);// after validation and suring you want remove it, just will remove it using (.remove())
    print('\x1B[32mAccount $accNumber has been successfully closed.\x1B[0m');
  } else {
    print('\x1B[33mAction cancelled. Account was not closed.\x1B[0m');
  }
}

//finish