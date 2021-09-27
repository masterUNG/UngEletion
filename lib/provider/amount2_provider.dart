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
    print('#### ค่า serAmountProvider ที่ได้รับมา ==>> ${amountModel.amount}');
    amount = amountModel.amount;
    notifyListeners();
  }
}
