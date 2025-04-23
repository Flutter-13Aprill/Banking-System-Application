class TransactionModel {
  String? _accountNumber;
  String? _type; // "deposit" or "withdraw"
  int? _amount;
  num? _accountBalnce;
  String? _timestamp;

  TransactionModel(
    this._accountNumber,
    this._type,
    this._amount,
    this._accountBalnce,
    this._timestamp,
  );
  //Convert to JSON (json Encode)
  Map<String, dynamic> toJson() {
    return {
      "accountNumber": _accountNumber,
      "type": _type,
      "amount": _amount,
      "accountBalnce": _accountBalnce,
      "timestamp": _timestamp,
    };
  }

  // Convert from JSON (json Decode)
  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      json["accountNumber"],
      json["type"],
      json["amount"],
      json["accountBalnce"],
      json["timestamp"],
    );
  }
}
