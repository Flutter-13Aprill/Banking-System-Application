import 'dart:io';

//make class that have all the account info
class Account {
  String? userName;
  double balance = 0.0;
  String accountNumber;
  List<String> transactionHistory = [];
  var time;

  Account(this.balance, this.userName, this.accountNumber) {
    time = DateTime.now();
    //add the time
    transactionHistory.add("[$time] - Account created for $userName");
  }
  //function for display
  void display() {
    print("Account name : $userName");
    print("Account number : $accountNumber");
    print("Balance : $balance");
  }

//function for deposit
  void deposit(double amount) {
    balance += amount;
    var time = DateTime.now();
    transactionHistory.add("$time - Deposited: $amount");
    print("[$time] Money added. New balance: $balance");
  }

//function for withdraw
  void withdraw(double amount) {
    var time = DateTime.now();
    if (balance < amount) {
      print("[$time] Insufficient balance.");
      transactionHistory.add("[$time] - There is not enough balance");
    } else {
      balance -= amount;
      transactionHistory.add("[$time] - Withdrawn: $amount");
      print("[$time] Withdraw done  New balance: $balance");
    }
  }

  void viewTransactionHistory() {
    if (transactionHistory.isEmpty) {
      print(" there is no transactions ");
    } else {
      print("Transaction History for $userName:");
      for (var entry in transactionHistory) {
        print(entry);
      }
    }
  }
}

// Create new account
Account createAccount() {
  double balance = 0.0;
  stdout.write("Enter your name to create an account: ");
  String? userName = stdin.readLineSync();

  String accountNumber = DateTime.now().microsecondsSinceEpoch.toString();
  print("Your account number is: $accountNumber");

  return Account(balance, userName, accountNumber);
}

// Deposit function
void depositMoney(List<Account> usersAccount) {
  stdout.write("Enter your account number: ");
  String inputAccount = stdin.readLineSync()!;
  Account? foundAccount = findAccountByNumber(usersAccount, inputAccount);

  if (foundAccount != null) {
    stdout.write("Enter amount to deposit: ");
    double amount = double.parse(stdin.readLineSync()!);
    foundAccount.deposit(amount);
  } else {
    print("There is no account with this number.");
  }
}

// Withdraw function
void withdrawMoney(List<Account> usersAccount) {
  stdout.write("Enter your account number: ");
  String inputAccount = stdin.readLineSync()!;
  Account? foundAccount = findAccountByNumber(usersAccount, inputAccount);

  if (foundAccount != null) {
    stdout.write("Enter amount to withdraw: ");
    double amount = double.parse(stdin.readLineSync()!);
    foundAccount.withdraw(amount);
  } else {
    print("There is no account with this number.");
  }
}

// View transaction history
void viewTransactionHistory(List<Account> usersAccount) {
  stdout.write("Enter your account number: ");
  String inputAccount = stdin.readLineSync()!;
  Account? foundAccount = findAccountByNumber(usersAccount, inputAccount);

  if (foundAccount != null) {
    foundAccount.viewTransactionHistory();
  } else {
    print("There is no account with this number.");
  }
}

// Close account function
void closeAccount(List<Account> usersAccount) {
  stdout.write("Enter your account number: ");
  String inputAccount = stdin.readLineSync()!;
  Account? foundAccount = findAccountByNumber(usersAccount, inputAccount);

  if (foundAccount != null) {
    usersAccount.remove(foundAccount);
    print("Account deleted successfully.");
  } else {
    print("There is no account with this number.");
  }
}

//find account by number that can be easy
Account? findAccountByNumber(List<Account> usersAccount, String number) {
  for (var account in usersAccount) {
    if (account.accountNumber == number) {
      return account;
    }
  }
  return null;
}

// Main
void main() {
  List<Account> usersAccount = [];
  int? option;

  do {
    print("""
-------- Welcome to Lojain Bank --------
1 - Create Account
2 - Deposit Money
3 - Withdraw Money
4 - View Transaction History
5 - Close Account
6 - Exit.
""");

    stdout.write("Choose an option: ");
    option = int.parse(stdin.readLineSync()!);

    switch (option) {
      case 1:
        Account newAccount = createAccount();
        usersAccount.add(newAccount);
        break;

      case 2:
        depositMoney(usersAccount);
        break;

      case 3:
        withdrawMoney(usersAccount);
        break;

      case 4:
        viewTransactionHistory(usersAccount);
        break;

      case 5:
        closeAccount(usersAccount);
        break;

      case 6:
        print("Thank you for using Lojain Bank. Goodbye.");
        break;

      default:
        print("Invalid option, try again.");
    }
  } while (option != 6);
}
