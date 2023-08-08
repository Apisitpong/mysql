import 'package:flutter/material.dart';

class TransactionProvider extends ChangeNotifier {
  // List<TransModel> trans = [];
  //
  // List<TransModel> getTransModel() {
  //   return trans;
  // }
  //
  // void addTrans(TransModel model) {
  //   trans.add(model);
  //   notifyListeners();
  // }
  String host = '';

  void testLogin(String host){
    host = host;
    notifyListeners();
  }
}
