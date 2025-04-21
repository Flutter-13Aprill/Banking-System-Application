import 'dart:io'; // library input user
import 'dart:math'; //library random number
class acount{ //class to creat object for every clint 
  int ?id; 
  String?userName; 
  double totalBalance=0; 
}

Map<int,acount>acounts={}; // map have the id acount and object when create map 
List<Map<String,dynamic>> history=[]; //list the value it's map to describe operation use to print history

void createAcount() { // create acount and here create object for evry user  
  acount a = acount(); 
  stdout.write("user name : ");
  a.userName = stdin.readLineSync()!;
  a.id = Random().nextInt(1000); //use random 
  print("ID : ${a.id}");
  print("totalBalance : ${a.totalBalance}");
  acounts[a.id!] = a; //add to list evry time create acount add this acount to map id as key the value all the object you enter value 
  print("createAcount it's done ");
}




void viewacount(int id) { //choose the id you want to see his acount 
  if (acounts.containsKey(id)) {
    var account = acounts[id];//varible take the value of acounts[id] and the value is the address for object you create
    print('User Name: ${account!.userName}');
    print('Total Balance: ${account.totalBalance}');
  } else {
    print("Account not found.");
  }
}



void deposit(int id, double amount) { //to depost money on the acount take two parameter the id you want to add and the amount of depost 
  if (acounts.containsKey(id)) {
    var acount = acounts[id]!;
    acount.totalBalance += amount; //sum 
    history.add({
      'type': 'deposit',
      'id': id,
      'amount': amount,
      'time': DateTime.now()// datetime for the time you depost  
    });
    print("deposit it's done");
  } else {
    print("Account not found.");
  }
}




void withdraw(int id, double amount) {//to withdraw money on the acount take two parameter the id you want to subtract and the amount of withdraw 
  if (acounts.containsKey(id)) {
    var acount = acounts[id]!;
    acount.totalBalance -= amount;//subtract
    history.add({
      'type': 'withdraw',
      'id': id,
      'amount': amount,
      'time': DateTime.now()
    });
    print("withdraw it's done");
  } else {
    print("Account not found.");
  }
}



void closeAcount(int id) { // function to delete the acount 
  if (acounts.containsKey(id)) {
    acounts.remove(id);//delete from map
    history.removeWhere((a) => a['id'] == id);//delete all the operation user do 
    print("remove account");
  }
}




void transactionhistory() {//function to see all the operation user do 
  if (history.isEmpty) {
    print("No transactions yet.");
  } else {
    history.forEach((a) { // to print evere elemnt on map
      print("type:${a['type']}  id:${a['id']} amount:${a['amount']} time:${a['time']}");
    });
  }
}





void main(){//main function 
  bool toExit=true; //varible use for loop 
do{// start loop 
print(" welcom to tweq bank ");
print(" "); 
print("1- Create accounts");
print("2- Deposit ");
print("3- Withdraw Money");
print("4- View transaction history");
print("5- Close account");
print("6- View acount");
print("7- Exit");
stdout.write("which opthion you choose  ");

String?option=stdin.readLineSync()!;
int?choose;
try{ // try catch to be sure the user enter number 
choose=int.parse(option); 
}catch(e){
print("enter only number from 1 to 7 $e"); 
}
if(choose==1){//Create accounts
print("Create accounts"); 
createAcount(); //call function 
}

else if(choose==2 ){//Deposit
print("Deposit"); 
stdout.write(" to ID:");//input from user id amount to Deposit
int?toId=int.parse(stdin.readLineSync()!); 
stdout.write(" amount:");
double?toAmount=double.parse(stdin.readLineSync()!); 
deposit(toId,toAmount); //call function

}
else if(choose==3){//Withdraw Money
  print("Withdraw Money"); 
  stdout.write(" to ID:");//call function
  int?toId=int.parse(stdin.readLineSync()!);
  stdout.write(" amount:");
double?toAmount=double.parse(stdin.readLineSync()!); 
withdraw(toId,toAmount); //call function

} else if(choose==4){//View transaction history
print("View transaction history"); 
transactionhistory(); //call function


}else if(choose==5){ 
print("Close account"); 
stdout.write(" to ID:");//input from user id to close this acount 
int?toId=int.parse(stdin.readLineSync()!);
 closeAcount(toId); //call function


}else if(choose==6){//Enter the ID acount from user to view
  stdout.write("Enter the ID acount to view"); 
  int?idAcount=int.tryParse(stdin.readLineSync()!);
  viewacount(idAcount!); //call function

}
else if(choose==7){
  print("goodbye");
  toExit=false ; //toExit the program 
} 
else{
   toExit=false ;//to end the loop
}
}while(toExit); //end loop 
}