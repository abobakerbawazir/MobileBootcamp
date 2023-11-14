import 'package:day_53/Ex_53/core/models/IncomeModel.dart';
import 'package:day_53/Ex_53/helpers/DBManager.dart';

class NotifierModel {
  DBManager dbManager = DBManager();
  List<IncomeModel> allincome = [];
  // Note? note;
  Future<List<IncomeModel>> fetchAllIncome() async {
    try {
      List<Map<String, dynamic>> fetchedData =
          await dbManager.getAllData(DBManager.TBL_INCOME_NAME);
      allincome = fetchedData.map((e) => IncomeModel.fromJSON(e)).toList();
      return allincome;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<int> saveIncome(IncomeModel income) {
    return dbManager.insertData(DBManager.TBL_INCOME_NAME, income.toJSON());
  }

  Future<int> updateIncome(IncomeModel income) async {
    return dbManager.updataeData(DBManager.TBL_INCOME_NAME, income.toJSON());
  }

  Future<int> deleteIncome(int income) async {
    return dbManager.deleteData(DBManager.TBL_INCOME_NAME, income);
  }
}
