import 'dart:io';
void createFolders() {
  Directory('accounts').createSync(recursive: true);
  Directory('transactions').createSync(recursive: true);
}

void createAccount() {
  stdout.write('Enter your name: ');
  String? name = stdin.readLineSync();

  if (name == null || name.isEmpty) {
    print('please enter true name');
    return;
  }

  String accountNumber = (DateTime.now().millisecondsSinceEpoch ~/ 1000).toString();
  File file = File('accounts/$accountNumber.txt');
  File transactionFile = File('transactions/$accountNumber.txt');

  file.createSync(recursive: true);
  file.writeAsStringSync('$name \n 0'); 

  transactionFile.createSync(recursive: true);
  transactionFile.writeAsStringSync('Account created at ${DateTime.now()}\n');

  print('Account created successfully. Account Number: $accountNumber');
}

void depositMoney() {
  stdout.write('Enter Account number: ');
  String? accNum = stdin.readLineSync();

  File file = File('accounts/$accNum.txt');
  if (!file.existsSync()) {
    print('Account not in the system check your account number');
    return;
  }

  stdout.write('Enter deposit amount: ');
  String? amountStr = stdin.readLineSync();
  double amount = double.tryParse(amountStr ?? '') ?? 0;

  if (amount <= 0) {
    print('please enter true number');
    return;
  }

  List<String> data = file.readAsLinesSync();
  double balance = double.parse(data[1]);
  balance += amount;
  data[1] = balance.toString();
  file.writeAsStringSync(data.join('\n'));

  File('transactions/$accNum.txt').writeAsStringSync(
    'Deposit: $amount at ${DateTime.now()}\n',
    mode: FileMode.append,
  );

  print('Deposit successful-New balance is: $balance');
}

void withdrawMoney() {
  stdout.write('Enter account number: ');
  String? accNum = stdin.readLineSync();

  File file = File('accounts/$accNum.txt');
  if (!file.existsSync()) {
    print('Account not in the system check your account number');
    return;
  }

  stdout.write('Enter withdrawal amount: ');
  String? amountStr = stdin.readLineSync();
  double amount = double.tryParse(amountStr ?? '') ?? 0;

  if (amount <= 0) {
    print('please enter true number');
    return;
  }

  List<String> data = file.readAsLinesSync();
  double balance = double.parse(data[1]);

  if (balance < amount) {
    print('Your balance is $balance You cannot withdraw this amount');
    return;
  }

  balance -= amount;
  data[1] = balance.toString();
  file.writeAsStringSync(data.join('\n'));

  File('transactions/$accNum.txt').writeAsStringSync(
    'Withdraw: $amount on ${DateTime.now()}\n',
    mode: FileMode.append,
  );

  print('Withdrawal successful-Remaining balance is: $balance');
}

void viewTransactions() {
  stdout.write('Enter account number: ');
  String? accNum = stdin.readLineSync();

  File transFile = File('transactions/$accNum.txt');
  if (!transFile.existsSync()) {
    print('No transactions found in our system for this account');
    return;
  }

  print('\n---------------Transaction History -------------------');
  print(transFile.readAsStringSync());
}

void closeAccount() {
  stdout.write('Enter account number: ');
  String? accNum = stdin.readLineSync();

  File file = File('accounts/$accNum.txt');
  File transFile = File('transactions/$accNum.txt');

  if (!file.existsSync()) {
    print('Account not in the system check your account number');
    return;
  }

  stdout.write('Are you sure you want to close this account? (yes/no): ');
  String? confirm = stdin.readLineSync();

  if (confirm?.toLowerCase() == 'yes') {
    file.deleteSync();
    if (transFile.existsSync()) {
      transFile.deleteSync();
    }
    print('your account closed and your transaction history deleted');
  } else {
    print('You canceled this operation');
  }
}
