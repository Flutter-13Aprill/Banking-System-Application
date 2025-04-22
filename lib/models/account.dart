import 'package:uuid/uuid.dart';

// Model 
import 'package:banking_system_application/models/transaction.dart';

class Account {

  Account({required String? name}){
    _id = Uuid().v4();
    _name = name;
    _balance = 0;
    _transactionsHistory = [];
  }

  Account.fromJson(dynamic json){
    final transactionsHistoryList = json['transactions_history'] as List;


    _id = json['id'];
    _name = json['name'];
    _balance = json['balance'];
    _transactionsHistory = transactionsHistoryList.map((transaction) => Transaction.fromJson(transaction)).toList();
  }

  String? _id; 
  String? _name;
  double? _balance;
  List<Transaction>? _transactionsHistory;


  // Getters
  String? get getId => _id;
  String? get getName => _name;
  double? get getBalance => _balance;
  List<Transaction>? get getTransactionHistory => _transactionsHistory;

  // Setters
  set setId(String? id){
    _id = id;
  }

  set setName(String? name){
    _name = name;
  }

  set setBalance(double? balance){
    _balance = balance;
  }

  set setTransactionHistory(List<Transaction>? transactionHistory){
    _transactionsHistory = transactionHistory;
  }

  void addTransaction({required String nameOfOperation, required double amount, required DateTime date}){
    _transactionsHistory?.add(Transaction(nameOfOperation: nameOfOperation, amount: amount));
  }

  Map<String, dynamic> toJson() => {
    'id': _id,
    'name': _name,
    'balance': _balance,
    'transactions_history': _transactionsHistory?.map((transaction) => transaction.toJson()).toList()
  };
}