import 'dart:convert';
import 'dart:io';

import 'abstract_api_response.dart';

class Api1 implements abstracApiresponse {
  late int id;
  late String name;
  late int fees;
  Api1(this.id, this.name, this.fees);

  @override
  int getFees() {
    return fees;
  }

  @override
  int getId() {
    return id;
  }

  @override
  String getTitle() {
    return name;
  }


  //mrthod
  
List<Map<String, dynamic>> loadapi() {
  try {
    final file = File('programs_info.json');
    if (file.existsSync()) {
      final contents = file.readAsStringSync();
      return jsonDecode(contents).cast<Map<String, dynamic>>();
    }
  } catch (e) {
    print(e);
  }
  return [];
}


void saveapi(List<Map<String, dynamic>> ListapiData) {
  try {
    final file = File('programs_info.json');
    final contents = jsonEncode(ListapiData);
    file.writeAsStringSync(contents);
  } catch (e) {
    print(e);
  }
}

//view
void viewbookstore(List<Map<String, dynamic>> Listfile) {
  if (Listfile.isEmpty) {
    print('Task is Empty');
  } else {
    for (var i = 0; i < Listfile.length; i++) {
      final task = Listfile[i].cast();
      print(
          "[${i + 1}] (${task['id']}) - ${task['name']} - ${task['fees']} ]");
    }
  }
}
}
