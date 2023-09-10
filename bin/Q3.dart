void main() {
  Map<String, int> name_of_phone = {
    "Ali": 771235465,
    "Khalid": 735641234,
    "Amal": 779540037,
    "Abass": 771277465,
    "Abobaker": 775630183
  };
  List<String> ke_4 =
      name_of_phone.keys.where((element) => element.length == 4).toList();
  print("key of length 4 : $ke_4");
}
