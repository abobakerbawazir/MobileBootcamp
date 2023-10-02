import 'abstract_api_response.dart';
import 'api_response.dart';

class ApiProcess {
  List<abstracApiresponse> prossecapi(List<Map<String, dynamic>> api_1) {
    List<abstracApiresponse> adaptedApi = [];
    for (var api in api_1) {
      var adapter = Api1(api['id'], api['name'], api['fees']);
      adaptedApi.add(adapter);
    }
    return adaptedApi;
  }
}

