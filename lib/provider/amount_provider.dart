import 'package:flutter/foundation.dart';
import 'package:ungelection/model/amount_model.dart';

class AmountProvider with ChangeNotifier {
  // Data
  List<AmountModel> amountModels = [];

  // Get Data
  List<AmountModel> getAmountProvider() {
    return amountModels;
  }

  // Clear Provider
  void clearAmountProvider() {
    amountModels.clear();
    notifyListeners();
  }

  // Add Data
  void addAmountProvider(AmountModel amountModel) {
    if (amountModels.length != 0) {
  amountModels.clear();
}
    amountModels.add(amountModel);
    notifyListeners();
  }
}
