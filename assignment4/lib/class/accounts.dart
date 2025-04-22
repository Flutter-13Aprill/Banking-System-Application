List<accounts> accountList = [];

Map<int,String> hitory = {0:'Transaction'};

List<String> test =[];
class accounts {
  int? _id;

  int? _balance;

  String? _type;
  var _timeNow;

  accounts(int? id, int? balance,String type,var timeNow) {
    this._id = id;
    this._balance = balance;
    this._type = type;
    this._timeNow = timeNow;
  }

  void setBalance(int balance) {
    this._balance = balance;
  }

  void setId(var id) {
    this._id = id;
  }
 void setTimeNow(var timeNow) {
    this._timeNow = timeNow;
  }
 void setType(var type) {
    this._type = type;
  }

  int? getId() {
    return this._id;
  }
   getiTimeNow() {
    return this._timeNow;
  }
  String? getType() {
    return this._type;
  }

  int? getBalance() {
    return this._balance;
  }
}
