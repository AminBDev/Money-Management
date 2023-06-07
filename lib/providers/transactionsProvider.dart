import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:money_management/models/money.dart';
import 'package:money_management/models/response_model.dart';
import 'package:money_management/ui/screens/transactions_screen.dart';

class TransactionProvider extends ChangeNotifier {
  late ResponseModel<List<Money>> state =
      ResponseModel.loading("is loading....");
  List<Money> moneys = [];

  searchTransactions(String text) {
    state = ResponseModel.loading("is loading....");
    notifyListeners();

    Box<Money> hiveBox = Hive.box<Money>("MoneyBox");


    moneys = hiveBox.values.where((value) =>
    value.titel.contains(text) ||
        value.price.contains(text))
        .toList();


    state = ResponseModel.completed(moneys);
    notifyListeners();
  }

  getTransactions() {
    state = ResponseModel.loading("is loading....");
    notifyListeners();

    Box<Money> hiveBox = Hive.box<Money>("MoneyBox");
    moneys.clear();
    for (var value in hiveBox.values) {
      moneys.add(value);
    }
    state = ResponseModel.completed(moneys);
    notifyListeners();
  }


  removeItem(index) {
    Box<Money> hiveBox = Hive.box<Money>("MoneyBox");
    hiveBox.deleteAt(index);
    moneys.removeAt(index);
    state = ResponseModel.completed(moneys);
    notifyListeners();
  }

  eitItem(index) {
    Box<Money> hiveBox = Hive.box<Money>("MoneyBox");
    Money item = Money(
      Random().nextInt(9999),
      TransactionsScreen.priceController.text,
      TransactionsScreen.descriptionController.text,
      "1401/01/01",
      TransactionsScreen.groupId == 1 ? false : true,
    );


    hiveBox.putAt(index, item );

    state = ResponseModel.completed(moneys);
    notifyListeners();
  }
}
