import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:payoll/models/transaction_history_model.dart';
import '../services/services.dart';
import '../utils/state/finite_state.dart';

class TransactionHistoryProvider extends ChangeNotifier {
  final ApiService service = ApiService();

  TransactionHistoryModel? transactionHistoryModel;

  MyState myState = MyState.initial;

  Future getAllTransactionHistory() async {
    try {
      myState = MyState.loading;
      notifyListeners();
      transactionHistoryModel = await service.getTransactionHistory();
      myState = MyState.loaded;
      notifyListeners();
    }
    catch (e) {
      if (e is DioError) {
        if (kDebugMode) {
          print(e.response!.statusCode);
          print(e.response!.statusMessage);
          print(e.response!.data);
        }
      }
      myState = MyState.failed;
      notifyListeners();
    }
  }
}
