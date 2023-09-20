import 'dart:io';

import 'birthday.dart';

class birthday_system {
  List<Birthdays> listofBirthdays = [];
  addbirthday(Birthdays birthdays) {
    this.listofBirthdays.add(birthdays);
  }

  removebirthday(Birthdays birthdays) {
    this.listofBirthdays.remove(birthdays);
  }

  printInfoallbirthdaysandNmaes() {
    listofBirthdays.forEach((element) {
      print("name : ${element.Nmae} birthday : ${element.Birthday} ");
    });
  }

  printInfoOnlybirthdays() {
    listofBirthdays.forEach((element) {
      print(" birthday : ${element.Birthday} ");
    });
  }

  printInfoOnlyNmaes() {
    listofBirthdays.forEach((element) {
      print("name : ${element.Nmae} ");
    });
  }

  countOfuser_IN_month(String birth) {
    // List<Birthdays> xx = listofBirthdays;
    // for (var i in xx) {
    //   int current_month = int.parse(i.Birthday[1].split("/")[1]);
    //   xx[current_month - 1] = xx[current_month - 1];
    //   print(current_month);
    // }
    int c = 0;
    listofBirthdays.forEach((element) {
      if (element.Birthday.split("/")[1] == birth.split("/")[1]) {
        c += 1;
        print(element.Birthday);
      }
    });
    print(c);
  }

  //

  countOfuser_IN_monthbyInputMonth(String birth) {
    int c = 0;
    listofBirthdays.forEach((element) {
      if (element.Birthday.split("/")[1] == birth) {
        c += 1;
        print(element.Birthday);
      }
    });
    print(c);
  }

  countOtMonth(Month x) {
    Map<String, int> xx = {};
    for (var i in listofBirthdays) {
      int curren_m = int.parse(i.Birthday[1].split("/")[1]);
      xx[Month.values[curren_m - 1].name] =
          xx[Month.values[curren_m - 1].name] ?? 0;
    }
  }
}

enum Month { Jan, Fab, March, April, May, June, July, Aug, Sep, Oct, Nov, Dec }
