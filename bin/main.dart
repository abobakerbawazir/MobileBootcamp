import 'Birthday.dart';
import 'birthday_system.dart';

void main(List<String> args) {
  
  Birthday birth1 = Birthday(name: "Ali", birthday: "2007/1/11");
  Birthday birth2 = Birthday(name: "Ahmed", birthday: "2009/9/21");
  Birthday birth3 = Birthday(name: "Abobaker", birthday: "2017/1/31");
  Birthday birth4 = Birthday(name: "Saeed", birthday: "1992/4/20");
  Birthday birth5 = Birthday(name: "Salem", birthday: "1950/2/11");
  birthday_system systems = birthday_system();

  systems.addbirthday(birth1);
  systems.addbirthday(birth2);
  systems.addbirthday(birth3);
  systems.addbirthday(birth4);
  systems.addbirthday(birth5);
  
  systems.printInfoallbirthdaysandNmaes();
}
