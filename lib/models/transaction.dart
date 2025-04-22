import 'package:intl/intl.dart';


class Transaction {

  Transaction({required String? nameOfOperation, required double? amount,}){
    _nameOfOperation = nameOfOperation;
    _amount = amount;
    _date = formatDate;
  }

  Transaction.fromJson(dynamic json){
    _nameOfOperation = json['name_of_operation'];
    _amount = json['amount'];
    _date = json['date'];
  }

  String? _nameOfOperation;
  double? _amount;
  String? _date;

  get formatDate{
    final formattedDate = DateFormat.yMMMMd().format(DateTime.now());
    final formattedTime = DateFormat('jm').format(DateTime.now());

    return 'Date: $formattedDate Time: $formattedTime';
  }

  // Getters
  String? get getNameOfOperation => _nameOfOperation;
  double? get getAmount => _amount;
  String? get getDate => _date;

  // Setters
  set setNameOfOperation(String? nameOfOperation) {
    _nameOfOperation = nameOfOperation;
  }

  set setAmount(double? amount) {
    _amount = amount;
  }

  set setDate(String? date) {
    _date = date;
  }

    Map<String, dynamic> toJson() => {
    'name_of_operation': _nameOfOperation,
    'amount': _amount,
    'date': formatDate
  };
}
