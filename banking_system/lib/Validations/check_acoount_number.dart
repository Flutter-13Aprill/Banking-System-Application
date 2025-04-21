import 'package:banking_system/Collections&Classes/collections.dart';
import 'package:banking_system/Methods/create_account.dart';

// This function check if the account number generated in "create_account" is unique. If not, keep looping until a unique "newAccountNumber" is generated then return it.
int accountNumberExist (int newAccountNumber) {
  int tempNumber;
  for (var element in accountsList) {
    if (element.accountNumber == newAccountNumber) {
      tempNumber = random.nextInt(10000);
      accountNumberExist(tempNumber);
      return tempNumber;
    }
  }
  return newAccountNumber;
}

int accessAccountNumber (int accountNum) {
  for (var element in accountsList) {
    if (element.accountNumber == accountNum) {
      int accountIndex = accountsList.indexOf(element);
      return accountIndex;
    }
  }
  return -1;

}