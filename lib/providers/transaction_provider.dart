import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/transaction_model.dart';
import '../services/services.dart';
import '../utils/state/finite_state.dart';

class TransactionProvider extends ChangeNotifier {
  final ApiService service = ApiService();
  late SharedPreferences loginData;

  TransactionModel? transactionModel;

  MyState myState = MyState.initial;

  Future transaction({
    required String? customerId,
    required String? productCode,
    required String successRedirectUrl,
    required String failureRedirectUrl,
  }) async {
    try {
      myState = MyState.loading;
      notifyListeners();
      loginData = await SharedPreferences.getInstance();
      transactionModel = await service.submitTransaction(
          customerId: customerId,
          productCode: productCode,
          successRedirectUrl: successRedirectUrl,
          failureRedirectUrl: failureRedirectUrl);
      myState = MyState.loaded;
      notifyListeners();
    } catch (e) {
      if (e is DioError) {
        if (kDebugMode) {
          print(e.response!.statusCode);
          print(e.response!.statusMessage);
          print(e.response!.data);
        }
      }

      myState = MyState.failed;
      notifyListeners();
      // return null;
    }
  }
}
