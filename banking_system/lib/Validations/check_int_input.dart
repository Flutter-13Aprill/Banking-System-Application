import 'package:banking_system/home.dart';

bool checkIsString(String userInput) {

  try {
    double.parse(userInput);
    return false;
    
  } catch (e) {
    return true;
  }
}

int checkIntInput (String userInput) {
  try {
    int intInput = int.parse(userInput); 
  return intInput;

  } catch (e) {
    print('\x1B[31mSorry invalid input, Taking you back to === Home Page ===\x1B[0m');
    home();
    return -1;
  }
}


double checkdoubleInput (String userInput) {
  try {
    double doubleInput = double.parse(userInput); 
  return doubleInput;

  } catch (e) {
    
    print('\x1B[31mSorry invalid input, Taking you back to === Home Page ===\x1B[0m');
    home();
    return -1;
  }
}

