
import 'Course.dart';

class CorurseCon {
  static List<Corurse> listCorurse = [];

  addNewCorurse(
      {required String name, required int noHouers, required double fees}) {
    if (name.length > 3)
      listCorurse.add(Corurse(name: name, noHouers: noHouers, fees: fees));
    else
      print("The name length less than 4 charcter");
  }

  updateCorurse({required Corurse corurse, required String name}) {
    int index = listCorurse.indexWhere((element) => element.name == name);
    if (index != -1)
      listCorurse[index] = corurse;
    else
      print("Not found");
  }

  deleteCorurse({required String name}) {
    int index = listCorurse.indexWhere((element) => element.name == name);
    if (index != -1)
      listCorurse.removeAt(index);
    else
      print("Not found");
  }

  showOneCorurseInfo({required String name}) {
    int index = listCorurse.indexWhere((element) => element.name == name);
    if (index != -1)
      print(listCorurse[index].toString());
    else
      print("Not found");
  }

  showCorurseInfo() {
    print("${"-" * 20}Corurses${"-" * 20}");
    listCorurse.forEach((element) {
      print(
          "course name : ${element.name} NoHouers : ${element.noHouers} Fees : ${element.fees} ");
    });
    print("${"-" * 20}  End   ${"-" * 20}");
  }
}
