abstract class DataRepo {
  Future<Map<String, dynamic>> getData({required String source});
  Future<Map<String,dynamic>>postData(Map<String,dynamic> dataToSend,String source);
}
