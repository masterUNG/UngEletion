import 'package:flutter/foundation.dart';
import 'package:ungelection/model/amount_model.dart';

class Amount2Provider with ChangeNotifier {
  // data
  int amount;

  // get data
  int getAmountProvider() {
    return amount;
  }

  // set data
  void setAmountProvider(AmountModel amountModel) {
    amount = amountModel.amount;
    notifyListeners();
  }
}
