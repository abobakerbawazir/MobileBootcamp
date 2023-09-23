import 'Birthday.dart';

class birthday_system {
  List<Birthday> listofBirthdays = [];
  

 

  addbirthday(Birthday birthdays) {
    this.listofBirthdays.add(birthdays);
  }

  removebirthday(Birthday birthdays) {
    this.listofBirthdays.remove(birthdays);
  }

  printInfoallbirthdaysandNmaes() {
    listofBirthdays.forEach((element) {
      print("name : ${element.name} , birthday : ${element.birthday} ");
    });
  }

  printInfoOnlybirthdays() {
    listofBirthdays.forEach((element) {
      print(" birthday : ${element.birthday} ");
    });
  }

  printInfoOnlyNmaes() {
    listofBirthdays.forEach((element) {
      print("name : ${element.name} ");
    });
  }

  countOfuser_IN_month(String birth) {
    int counter = 0;
    listofBirthdays.forEach((element) {
      if (element.birthday.split("/")[1] == birth.split("/")[1]) {
        counter += 1;
        print(element.birthday);
      }
    });
    print(counter);
  }

  //

  countOfuser_IN_monthbyInputMonth(String birth) {
    int counter = 0;
    listofBirthdays.forEach((element) {
      if (element.birthday.split("/")[1] == birth) {
        counter += 1;
        print(element.birthday);
      }
    });
    print(counter);
  }

  countOtMonth(Month mount) {
    Map<String, int> mounts = {};
    for (var i in listofBirthdays) {
      int curren_m = int.parse(i.birthday[1].split("/")[1]);
      mounts[Month.values[curren_m - 1].name] =
          mounts[Month.values[curren_m - 1].name] ?? 0;
    }
  }
}

enum Month { Jan, Fab, March, April, May, June, July, Aug, Sep, Oct, Nov, Dec }
