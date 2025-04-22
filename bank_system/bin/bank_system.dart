import 'dart:io';
import 'dart:math';

List<int> idAccount = [];
Map<String, int> dataAccount = {};
double price = 10;
void main() {
  print('------ Welcome _____');

  createAccount();
  print('Your ID: $dataAccount');
  depositMoney();
  withdrawMoney();
}

withdrawMoney() {
  stdout.write('Enter your ID: ');
  int? id = int.parse(stdin.readLineSync()!);

  if (id != null && idAccount.contains(id)) {
    print('Your current balance is: $price');

    stdout.write('Enter amount to withdraw: ');
    double? amount = double.parse(stdin.readLineSync()!);
    if (amount <= price) {
      price -= amount;
      print('Your balance after withdrawal: $price');
    } else {
      print('Invalid withdrawal amount.');
    }
  } else {
    print('ID wrong');
  }
}

depositMoney() {
  stdout.write('Enter your ID: ');
  int? id = int.parse(stdin.readLineSync()!);

  if (id != null && idAccount.contains(id)) {
    print('Your current balance is: $price');

    stdout.write('Enter amount to deposit: ');
    double? priceDeposit = double.parse(stdin.readLineSync()!);
    price += priceDeposit;
    print("Your balance after the deposit: $price");
  } else {
    print('Id wrong');
  }
}

createAccount() {
  var random = Random();
  int id;
  stdout.write('Enter your name: ');
  String? name = stdin.readLineSync()!;
  do {
    id = 10000 + random.nextInt(90000);
  } while (idAccount.contains(id));
  idAccount.add(id);
  dataAccount[name] = id;
  return id;
}
