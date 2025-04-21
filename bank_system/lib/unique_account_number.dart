import 'dart:math';
import 'package:bank_system/variable.dart';

// Generate unique account number
int uniqueAccountNumber() {
  int accountNumber;
  do {
    accountNumber = Random().nextInt(900000000) + 100000000;
  } while (bankAccounts.contains(accountNumber));
  bankAccounts.add(accountNumber);
  return accountNumber;
}
