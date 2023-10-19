import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../models/user_model.dart';
import '../services/services.dart';
import '../utils/state/finite_state.dart';

class UpdateProfileProvider extends ChangeNotifier {
  final ApiService service = ApiService();

  UserModel? users;

  MyState myState = MyState.initial;

  Future updateProfile({
    required String email,
    required String name,
  }) async {
    try {
      // myState = MyState.loading;
      // notifyListeners();
      users = await service.updateProfile(
        name: name,
        email: email,
      );
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
    }
  }
}
