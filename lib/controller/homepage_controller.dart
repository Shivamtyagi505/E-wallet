import 'package:e_wallet/extensions/double_extension.dart';
import 'package:flutter/material.dart';

import '../model/transaction.dart';

class HomePageController extends ChangeNotifier {
  List<Transaction> transactionItems = [
    Transaction(name: 'TransferWise', paymentDate: DateTime(2012), amount: '+\$400.00', price: 400.00),
    Transaction(name: 'Xbox game-pass', paymentDate: DateTime(2013), amount: '+\$200.00', price: 200.00),
    Transaction(name: 'Paypal', paymentDate: DateTime(2015), amount: '-\$20.00', price: -20.00),
    Transaction(name: 'TransferWise', paymentDate: DateTime(2019), amount: '+\$300.00', price: 300.00),
  ];

  void addItem(Transaction item) {
    transactionItems.insert(0, item);
    notifyListeners();
  }

  double get currentBalance {
    var total = 0.0;

    for (var element in transactionItems) {
      total += element.price;
    }
    return total.toPrecision(2);
  }
}
