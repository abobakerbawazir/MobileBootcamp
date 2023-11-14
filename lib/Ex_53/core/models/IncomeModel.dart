// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:day_53/Ex_53/helpers/DBManager.dart';

class IncomeModel {
  int? id;
  String? opreator;
  late int amount;
  IncomeModel({
    this.id,
    required this.opreator,
    required this.amount,
  });
  IncomeModel.fromJSON(Map<String, dynamic> row) {
    try {
       opreator = row['opreator']??"+" ;
    amount = row['amount']??0 ;
    id = row['id'] ?? null;

    
    } catch (e) {
      print(e);
    }
  }
  Map<String, dynamic> toJSON() {
    return {
      DBManager.COL_ID_NAME: id,
      DBManager.COL_OPERATOR_NAME: opreator,
      DBManager.COL_AMOUNT_NAME: amount,
    };
  }
}
