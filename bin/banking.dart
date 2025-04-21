import 'dart:io';
import 'dart:convert';
import 'dart:math';

void main() {
  // Main menu loop
  while (true) {
    print('Welcome to Banking System');
    print('1. Create Account');
    print('2. Deposit Money');
    print('3. Withdraw Money');
    print('4. View Transaction History');
    print('5. Close Account');
    print('6. Exit');
    
    String? choice = stdin.readLineSync();
    
    // Handle user choice
    switch (choice) {
      case "1":
        CreateAccount();
        break;
      case "2":
        depositMoney();
        break;
      case "3":
        WithdrawMoney();
        break;
      case "4":
        ViewTransactionHistory();
        break;
      case "5":
        closeAccount();
        break;
      case "6":
        exitprogram();
        break;
      default:
        print("Invalid input");
    }
  }
}

// Function to create a new account
void CreateAccount() {
  stdout.write("Enter Your name: ");
  String? name = stdin.readLineSync();
  int accountNumber = generateAccountNum();

  // Create account data structure
  Map<String, dynamic> accountData = {
    "accountNumber": accountNumber,
    "name": name,
    "balance": 0,
    "transactions": []
  };

  // Create the 'accounts' directory if it doesn't exist
  Directory('accounts').createSync(recursive: true);

  // Save the account data to a JSON file
  File file = File('accounts/$accountNumber.json');
  file.writeAsStringSync(jsonEncode(accountData));

  print('Account created successfully! Your account number is: $accountNumber');
}

// Function to exit the program
void exitprogram() {
  print("Thank you for using bank System");
  exit(0);
}

// Function to generate a unique account number
int generateAccountNum() {
  var random = Random();
  int accountNumber;

  // Ensure the account number is not already used
  do {
    accountNumber = 10000 + random.nextInt(90000);
  } while (File('accounts/$accountNumber.json').existsSync());

  return accountNumber;
}

// Function to deposit money into an account
void depositMoney() {
  print("Enter account number");
  String? accInput = stdin.readLineSync();

  if (accInput == null || accInput.isEmpty) {
    print("Invalid account number.");
    return;
  }

  String filePath = 'accounts/$accInput.json';
  File file = File(filePath);

  if (!file.existsSync()) {
    print("Account not found.");
    return;
  }

  String content = file.readAsStringSync();
  Map<String, dynamic> accountData = jsonDecode(content);

  stdout.write("Enter amount to deposit: ");
  String? amountInput = stdin.readLineSync();

  if (amountInput == null || amountInput.isEmpty) {
    print("Invalid amount.");
    return;
  }

  double amount = double.tryParse(amountInput) ?? 0;
  if (amount <= 0) {
    print("Amount must be greater than 0.");
    return;
  }

  // Update balance and record the transaction
  accountData['balance'] += amount;
  accountData['transactions'].add({
    "type": "deposit",
    "amount": amount,
    "date": DateTime.now().toString()
  });

  // Save updated account data
  file.writeAsStringSync(jsonEncode(accountData));
  print("Deposit successful. New balance: ${accountData['balance']}");
}

// Function to withdraw money from an account
void WithdrawMoney() {
  print("Enter account number");
  String? accInput = stdin.readLineSync();

  if (accInput == null || accInput.isEmpty) {
    print("Invalid account number.");
    return;
  }

  String filePath = 'accounts/$accInput.json';
  File file = File(filePath);

  if (!file.existsSync()) {
    print("Account not found.");
    return;
  }

  String content = file.readAsStringSync();
  Map<String, dynamic> accountData = jsonDecode(content);

  stdout.write("Enter amount to withdraw: ");
  String? amountInput = stdin.readLineSync();

  if (amountInput == null || amountInput.isEmpty) {
    print("Invalid amount.");
    return;
  }

  double amount = double.tryParse(amountInput) ?? 0;
  if (amount <= 0) {
    print("Amount must be greater than 0.");
    return;
  }

  double currentBalance = accountData['balance'];
  if (amount > currentBalance) {
    print("Insufficient funds. Your balance is $currentBalance");
    return;
  }

  // Deduct amount and record transaction
  accountData['balance'] -= amount;
  accountData['transactions'].add({
    'type': "withdraw",
    'amount': amount,
    'date': DateTime.now().toString()
  });

  // Save updated account data
  file.writeAsStringSync(jsonEncode(accountData));
  print("Withdrawal successful. Remaining balance: ${accountData['balance']}");
}

// Function to view transaction history
void ViewTransactionHistory() {
  print("Enter account number");
  String? accInput = stdin.readLineSync();

  if (accInput == null || accInput.isEmpty) {
    print("Invalid account number.");
    return;
  }

  String filePath = 'accounts/$accInput.json';
  File file = File(filePath);
// not found
  if (!file.existsSync()) {
    print("Account not found.");
    return;
  }

  String content = file.readAsStringSync();
  Map<String, dynamic> accountData = jsonDecode(content);
  List<dynamic> transactions = accountData['transactions'];

  if (transactions.isEmpty) {
    print("No transactions found.");
    return;
  }

  // Print each transaction
  print("\nTransaction History:");
  for (var t in transactions) {
    print("- ${t['type'].toUpperCase()} | Amount: ${t['amount']} | Date: ${t['date']}");
  }
}

// Function to close (delete) an account
void closeAccount() {
  stdout.write("Enter account number: ");
  String? accInput = stdin.readLineSync();

  if (accInput == null || accInput.isEmpty) {
    print("Invalid account number.");
    return;
  }

  String filePath = 'accounts/$accInput.json';
  File file = File(filePath);

  if (!file.existsSync()) {
    print("Account not found.");
    return;
  }

  print("Are you sure you want to close this account? (yes/no):");
  String? confirm = stdin.readLineSync();

  if (confirm?.toLowerCase() == 'yes') {
    file.deleteSync();
    print("Account closed successfully");
  } else {
    print("Account closure cancelled.");
  }
}
