class JsonModel {
  String? _userName;
  String? _accountNumber;

  JsonModel(this._userName, this._accountNumber);

  //Convert to JSON (json Encode)
  Map<String, dynamic> toJson() {
    return {"userName": _userName, "accountNumber": _accountNumber};
  }

  // Convert from JSON (json Decode)
  factory JsonModel.fromJson(Map<String, dynamic> json) {
    return JsonModel(json["userName"], json["accountNumber"]);
  }
}
