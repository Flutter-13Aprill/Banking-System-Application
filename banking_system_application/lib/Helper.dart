import 'dart:io' as io;
class Helper {
  // return user input 
  static dynamic getUserInput(String displayMessage){
  print(displayMessage);
  return io.stdin.readLineSync();
}
// return type input 
static String getUserInputType(var userInput){
  if(userInput.isEmpty==true) return "empty";
  else if(int.tryParse(userInput)!=null) return "int";  
  else return "string";
  
} 
// validate user input.
static String validateInput(String type,String displayMessage){
  while(true){
    String userInput= getUserInput(displayMessage);
    String inputType=getUserInputType(userInput);
    if(type==inputType) return userInput;
  
     print("The input type must match the field type:");
  }
}

}