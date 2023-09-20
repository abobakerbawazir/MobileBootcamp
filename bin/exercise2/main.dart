import 'birthday.dart';
import 'birthday_system.dart';

//enum month { Jan, Fab, March, April, May, June, July, Aug, Sep, Oct, Nov, Dec }

void main(List<String> args) {
  // month.values.asNameMap().keys.forEach((element) {
  //   print(element); //for loop all value  and print all them
  // });
  Birthdays b = Birthdays("ali1", "2007/1/11");
  Birthdays b1 = Birthdays("ali2", "2005/11/11");
  Birthdays b2 = Birthdays("ali3", "2004/11/11");
  birthday_system bs = birthday_system();
  bs.addbirthday(b);
  bs.addbirthday(b1);
  bs.addbirthday(b2);
  bs.printInfoallbirthdaysandNmaes();
  bs.countOfuser_IN_month("2007/11/11");
  bs.countOfuser_IN_monthbyInputMonth("1");
  
}
