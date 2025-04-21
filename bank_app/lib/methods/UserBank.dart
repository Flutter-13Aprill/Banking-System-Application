class UserBank {
  String? _id; // Private variable to store the user's ID
  double _balance; // Private variable to store the user's balance
  Map<String, dynamic> TransactionHistory =
      {}; // Map to store transaction history

  // Constructor to initialize the user's ID and balance
  UserBank(this._id, this._balance);

  // Override toString method for better readability when printing user information
  @override
  String toString() {
    return "id: $_id ,balance: $_balance"; // Return a string representation of the user
  }

  // Getter for the user's ID
  String? get id {
    return _id;
  }

  // Getter for the user's balance
  double get balance {
    return _balance; // Return the current balance
  }

  // Setter for the user's balance
  set balance(double balance) {
    this._balance = balance; // Update the balance
  }
}
