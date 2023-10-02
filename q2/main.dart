import 'dart:convert';
import 'dart:io';

import 'ApiProcess.dart';
import 'api_response.dart';

void main(List<String> args) {


  List<Map<String, dynamic>> ApiListofmap = [];
  Api1 api1 = Api1(2, "name", 2);
  api1.loadapi();
  api1.saveapi(ApiListofmap);
  api1.viewbookstore(ApiListofmap);
  final Listfile = loadapi();
  ApiProcess apiProcess = ApiProcess();
  var adaptedApi = apiProcess.prossecapi(ApiListofmap);

  for (var api in ApiListofmap) {
    print('id: ${api.getId}');
    print('title: ${api.getTitle()}');
    print('fees: ${api.getFees()}');
    print('=================================================');
  }
  // saveapi(Listfile);
  // viewbookstore(Listfile);
}

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
      print("[${i + 1}] (${task['id']}) - ${task['name']} - ${task['fees']} ]");
    }
  }
}
