import 'dart:io';
import 'dart:math';

Map <String , dynamic> accounts = {};
Map <String, List <String>> transactions = {};


void main(){

  while (true) {
    print('\nBanking System');
    print('1. Create Account');
    print('2. Deposit Money');
    print('3. Withdraw Money');
    print('4. View Transaction History');
    print('5. Close Account');
    print('6. Exit');
    print ('Choose an option: ');
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        createAccount();
        break;
      case '2':
        depositMoney();
        break;
      case '3':
        withdrawMoney();
        break;
      case '4':
        viewTransactions();
        break;
      case '5':
        closeAccount();
        break;
      case '6':
        print('Thank you for using the system.');
        exit(0);
      default:
        print('Invalid option. Please try again.');
    }
  }
}

void createAccount() {
  print (' Enter your name: ');
  String? name = stdin.readLineSync();
  String accountNumber = Random().nextInt(1000000).toString().padLeft(6, '0');
  accounts[accountNumber] = {
    'name': name,
    'balance': 0.0,
  };
  transactions[accountNumber] = [];
  print('Account created successfully! Account Number: $accountNumber');
}

void depositMoney() {
  print ('Enter account number: ');
  String? acc = stdin.readLineSync();
  if (!accounts.containsKey(acc)) {
    print(' Account not found!');
    return;
  }
  print (' Enter amount to deposit: ');
  double? amount = double.tryParse(stdin.readLineSync()!);
  if (amount == null || amount <= 0) {
    print('Invalid amount');
    return;
  }
  accounts[acc]!['balance'] += amount;
  transactions[acc]!.add('Deposit: +\$${amount.toStringAsFixed(2)} on ${DateTime.now()}');
  print(' Deposit successful! Current balance: \$${accounts[acc]!['balance']}');
}

void withdrawMoney() {
  print ('Enter account number: ');
  String? acc = stdin.readLineSync();
  if (!accounts.containsKey(acc)) {
    print('Account not found!');
    return;
  }
  print ('Enter amount to withdraw: ');
  double? amount = double.tryParse(stdin.readLineSync()!);
  if (amount == null || amount <= 0) {
    print('Invalid amount');
    return;
  }
  double balance = accounts[acc]!['balance'];
  if (balance < amount) {
    print('Insufficient balance. Current balance: \$${balance}');
    return;
  }
  accounts[acc]!['balance'] -= amount;
  transactions[acc]!.add('Withdrawal: -\$${amount.toStringAsFixed(2)} on ${DateTime.now()}');
  print('Withdrawal successful! Current balance: \$${accounts[acc]!['balance']}');
}

void viewTransactions() {
  print (' Enter account number: ');
  String? acc = stdin.readLineSync();
  if (!accounts.containsKey(acc)) {
    print(' Account not found!');
    return;
  }
  print(' Transaction history for account $acc:');
  for (var t in transactions[acc]!) {
    print(t);
  }
}

void closeAccount() {
  print (' Enter account number to close: ');
  String? acc = stdin.readLineSync();
  if (!accounts.containsKey(acc)) {
    print('Account not found!');
    return;
  }
  print ('Are you sure you want to delete this account? (yes/no): ');
  String? confirm = stdin.readLineSync();
  if (confirm?.toLowerCase() == 'yes') {
    accounts.remove(acc);
    transactions.remove(acc);
    print(' Account deleted successfully.');
  } else {
    print('Account deletion canceled.');
  }
}