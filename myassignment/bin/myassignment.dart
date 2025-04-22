import 'dart:io';

void main() {
  bool hasAccount = false;
  double balance = 0.0;

  while (true) {
    print(' القائمة الرئيسية ');
    print(' إنشاء حساب');
    print(' إيداع');
    print(' سحب');
    print( 'إغلاق الحساب');
    print(' خروج');
    stdout.write('اختر رقم: ');
    String? input = stdin.readLineSync();

    if (input == '1') {
      if (hasAccount) {
        print('يوجد حساب بالفعل.');
      } else {
        hasAccount = true;
        balance = 0.0;
        print('تم إنشاء الحساب!');
      }

    } else if (input == '2') {
      if (!hasAccount) {
        print('يجب إنشاء حساب أولاً.');
      } else {
        stdout.write('أدخل مبلغ الإيداع: ');
        double amount = double.parse(stdin.readLineSync()!);
        balance += amount;
        print('تم الإيداع. الرصيد الحالي: $balance');
      }

    } else if (input == '3') {
      if (!hasAccount) {
        print('يجب إنشاء حساب أولاً.');
      } else {
        stdout.write('أدخل مبلغ السحب: ');
        double amount = double.parse(stdin.readLineSync()!);
        if (amount > balance) {
          print('الرصيد لا يكفي.');
        } else {
          balance -= amount;
          print('تم السحب. الرصيد الحالي: $balance');
        }
      }

    } else if (input == '4') {
      if (!hasAccount) {
        print('لا يوجد حساب لإغلاقه.');
      } else {
        hasAccount = false;
        balance = 0.0;
        print('تم إغلاق الحساب.');
      }

    } else if (input == '5') {
      print('شكراً لاستخدامك للبنك .');
      break;

    } 
  }
}