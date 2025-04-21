import 'dart:io';
import 'dart:math';
 List<Map<String, dynamic>> myAccount = [];
 void main(){
while (true) {
print("Enter the number that corresponds with the sevice that you want to be provided with: ");
print("1- Create accounts");
print("2- deposit money");
print("3- withdraw money");
print("4- transaction history");
print("5- close accounts");
print("6- exit");
var choice = stdin.readLineSync();
int choiceNum = int.parse(choice!);

if (choiceNum  == 1) {
createAccount();
}
else if (choiceNum == 2) {
depositMoney();
}
else if (choiceNum == 3) {
withdrawMoney();
}
else if (choiceNum == 4) {
transactionHistory();
}
else if (choiceNum  == 5) {
closeAccounts();
}
else if (choiceNum == 6) {
exit();
}
}

}

void createAccount(){
  stdout.write('Enter account name: ');
  String? accountName = stdin.readLineSync();

  stdout.write('your account number is: ');

  int accountNumber = Random().nextInt(100); 
  print('Your account number is: $accountNumber');
 


  myAccount.add({
    'accountName': accountName,
    'accountNumber': accountNumber,
    'balance': 0,
    'lastDeposit': 0,
    'lastWithdrawal': 0,

    
  });
  }


void depositMoney(){
stdout.write('What’s your account number: ');
    String input = stdin.readLineSync()!;
  int accountNumberInput = int.parse(input);

  Map<String, dynamic>? accountNumber = myAccount.firstWhere(
    (acc) => acc['accountNumber']  == accountNumberInput,
    orElse: () => {},
  );

  if (accountNumber.isNotEmpty) {
    print(' Account found!');
  
   
    stdout.write('how much money do you want to deposit?: ');
     int deposit = int.parse(stdin.readLineSync()!);
    
     
     int index = myAccount.indexOf(accountNumber);
    myAccount[index]['balance'] = (myAccount[index]['balance'] ?? 0) + deposit;
    myAccount[index]['lastDeposit'] = deposit;


   for (var account in myAccount) {
    print('Account Name: ${account['accountName']}');
    print('Account Number: ${account['accountNumber']}');
    print('Balance: \$${account['balance']}');
    print('-------------------');
  }
    
   } else {
  print(' Sorry, account not found.');
}
  }


  void withdrawMoney(){
stdout.write('What’s your account number: ');
    String input = stdin.readLineSync()!;
    
  int accountNumberInput = int.parse(input);
  

  Map<String, dynamic>? accountNumber = myAccount.firstWhere(
    (acc) => acc['accountNumber']  == accountNumberInput,
    orElse: () => {},
  );

  if (accountNumber.isNotEmpty) {
    print(' Account found!');
  
   
    stdout.write('how much money do you want to withdraw?: ');
     int withdraw = int.parse(stdin.readLineSync()!);

      if(withdraw > 800){
      print("please lower than 800");
    
     }else{
int index = myAccount.indexOf(accountNumber);
    myAccount[index]['balance'] = (myAccount[index]['balance'] ?? 0) - withdraw ;
    myAccount[index]['lastWithdrawal'] = withdraw;

   for (var account in myAccount) {
    print('Account Name: ${account['accountName']}');
    print('Account Number: ${account['accountNumber']}');
    print('Balance: \$${account['balance']}');
    print('-------------------');
  }

     }
    
   } else {
  print(' Sorry, account not found.');
}
 


  }
void transactionHistory(){
 
  DateTime now = DateTime.now();

for (var account in myAccount) {
   
    print("Last Deposit: \$${account['lastDeposit']} - Time: ${now.toString()}");
    print("Last Withdrawal: \$${account['lastWithdrawal']}- - Time: ${now.toString()}");
    print('Balance: \$${account['balance']} - Time: ${now.toString()}');
    print('-------------------');
}
  }



void closeAccounts(){
print("if you want to delete account press 1");
int one = int.parse(stdin.readLineSync()!);

if(one == 1 ){
  print("your account will be deleted.");
myAccount.clear();
  print("press 1 to create account because currently there is no account");
  

}else {
  print("account will be deleted");
}


  }

void exit(){
print("good bye");
}