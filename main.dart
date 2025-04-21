import 'dart:io';
import 'dart:math';

String? accountnum;
int balances = 0;
List history = [];

// function to check if the user has an account if not, create a new account
void createAccount() {
  if (accountnum == null) {
    Random random = new Random();
    int randomNum = random.nextInt(100000) + 10000;
    accountnum = randomNum.toString();

    print("\n Account created: $accountnum");
    sleep(const Duration(seconds: 2));
  } else {
    print("You already have an account | account number: $accountnum ");
    sleep(const Duration(seconds: 3));
  }
}

// function take to method deposit or withdraw
void depositAndWithdraw(method) {
  while (true) {
    print("\n Enter account number:  type 0 to return ");
    String? account = stdin.readLineSync();
    // Check if the account exists
    if (account == accountnum) {
      print("Enter amount: ");
      int amount = int.parse(stdin.readLineSync()!);

      //deposit method
      if (method == "deposit") {
        balances = balances + amount;

        history.add("Deposited ${amount} SAR     time : ${DateTime.now()}");

        print("Deposit successful");

        sleep(const Duration(seconds: 2));

        main();
      }
      //withdraw method
      else if (method == "withdraw") {
        balances = balances - amount;
        history.add("withdrew ${amount} SAR    time : ${DateTime.now()}");
        print("Withdrawal successful");
        sleep(const Duration(seconds: 2));
        main();
      }
    } else if (account == "0") {
      main();
    } else {
      print("Account not found");
      sleep(const Duration(seconds: 2));
    }
  }
}

//function to Check if user has an account, then display transaction history
void transactionHistory() {
  if (accountnum == null) {
    print("You need to create an account");
    sleep(const Duration(seconds: 2));
  } else {
    print("Transaction History :\n");
    for (var element in history) {
      print(element);
    }
    print("Balance : $balances \n");
    print("Enter to return :");
    stdin.readLineSync();
  }
}

// function to delete a user account
void closeAccount() {
  accountnum = null;
  print("Logged out successfully");
  sleep(const Duration(seconds: 2));
}

void main() {
  while (true) {
    print("-----------------------------------------");
    print('Main Menu: \n');
    print('1. Create an Account');
    print('2. Deposit Money');
    print('3. Withdraw Money');
    print('4. View Transaction History');
    print('5. Close Account');
    print('6. Exit');
    print('\nEnter your choice:');
    var choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        createAccount();
        break;
      case "2":
        depositAndWithdraw("deposit");
        break;
      case "3":
        depositAndWithdraw("withdraw");
        break;
      case "4":
        transactionHistory();
        break;
      case "5":
        closeAccount();
        break;
      case "6":
        exit(0);
      default:
        print("Invalid number");
    }
  }
}
