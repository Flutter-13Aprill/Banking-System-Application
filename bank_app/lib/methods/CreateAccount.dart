import 'package:bank_app/bank_app.dart';
import 'package:bank_app/methods/UserBank.dart';
import 'package:uuid/uuid.dart';

// Function to create a new account
void createAccount() {
  try {
    // Check if there are no existing users
    if (users.length == 0) {
      var uuid = Uuid(); // Create a new UUID generator
      String newId = uuid.v1(); // Generate a new unique ID
      UserBank newUser = UserBank(
        newId,
        0.0,
      ); // Create a new user with initial balance of 0.0
      users.add(newUser); // Add the new user to the list
      newUser.TransactionHistory["createAccount"] =
          "in ${DateTime.now().millisecondsSinceEpoch}"; // Log the account creation time
      print(newUser.toString());
      return; // Exit the function
    }
    // Generate a new ID for the new user
    var uuid = Uuid();
    String newId = uuid.v1();
    UserBank exitUser = users.firstWhere((user) => user.id == newId);
    // Check if a user with the same ID already exists
    if (exitUser == null) {
      // If no existing user found, create a new user
      UserBank newUser = UserBank(newId, 0.0);
      users.add(newUser);
      newUser.TransactionHistory["createAccount"] =
          DateTime.now()
              .millisecondsSinceEpoch; // Log the account creation time
      print("your id :$newId"); // Print the new user's ID
    } else {
      // If a user with the same ID exists, generate a new ID
      while (exitUser != null) {
        uuid = Uuid();
        newId = uuid.v1();
        exitUser = users.firstWhere((user) => user.id?.compareTo(newId) != 0);
        exitUser.TransactionHistory["createAccount"] =
            DateTime.now()
                .millisecondsSinceEpoch; // Log the account creation time
        if (exitUser == null) {
          // If no existing user found, create a new user
          users.add(UserBank(newId, 0.0));
          print("your id :$newId");// Print the new user's ID
        }
      }
    }
  } catch (e) {
    print(e);
  }
}
