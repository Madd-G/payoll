import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../models/user_model.dart';
import '../services/services.dart';
import '../utils/state/finite_state.dart';

class UserProvider extends ChangeNotifier {
  final ApiService service = ApiService();

  UserModel? profileModel;

  MyState myState = MyState.initial;
  Future fetchProfile() async {
    try {
      myState = MyState.loading;
      notifyListeners();

      profileModel = await service.fetchUsers();

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