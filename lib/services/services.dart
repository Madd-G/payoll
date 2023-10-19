import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:payoll/models/password_model.dart';
import 'package:payoll/models/product_model.dart';
import 'package:payoll/models/transaction_history_model.dart';
import 'package:payoll/models/transaction_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/sign_in_model.dart';
import '../models/sign_up_model.dart';
import '../models/user_model.dart';

class ApiService {
  late SharedPreferences loginData;

  ApiService() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioError e, handler) {
          if (e.response!.statusCode == 401) {
            if (kDebugMode) {
              print(e.message);
            }
          } else {}
          return handler.next(e);
        },
      ),
    );
  }

  Dio dio = Dio();
  final String _baseUrl = 'https://payoll-api.nyakit.in/api/v1/';

  Future<SignUpModel> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final response = await dio.post(
        '${_baseUrl}user/register',
        data: {
          'email': email,
          'password': password,
          'name': name,
        },
      );

      return SignUpModel.fromJson(response.data);
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<SignInModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        '${_baseUrl}user/login',
        data: {
          'email': email,
          'password': password,
        },
      );
      return SignInModel.fromJson(response.data);
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<UserModel> fetchUsers() async {
    loginData = await SharedPreferences.getInstance();
    try {
      final response = await dio.get('${_baseUrl}user/profile',
          options: Options(
            headers: {
              "Authorization": "Bearer ${loginData.getString('login')}"
            },
          ));
      return UserModel.fromJson(response.data);
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<UserModel> updateProfile({
    required String name,
    required String email,
  }) async {
    loginData = await SharedPreferences.getInstance();
    try {
      final response = await dio.put('${_baseUrl}user/profile',
          data: {
            'name': name,
            'email': email,
          },
          options: Options(
            headers: {
              "Authorization": "Bearer ${loginData.getString('login')}"
            },
          ));
      return UserModel.fromJson(response.data);
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<PasswordModel> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    loginData = await SharedPreferences.getInstance();
    try {
      final response = await dio.put('${_baseUrl}user/update-password',
          data: {
            'old_password': oldPassword,
            'new_password': newPassword,
          },
          options: Options(
            headers: {
              "Authorization": "Bearer ${loginData.getString('login')}"
            },
          ));
      return PasswordModel.fromJson(response.data);
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<ProductModel> getProductByCategory(String? category) async {
    loginData = await SharedPreferences.getInstance();
    try {
      final response = await dio.get('${_baseUrl}product/by_category/$category',
          options: Options(
            headers: {
              "Authorization": "Bearer ${loginData.getString('login')}"
            },
          ));
      return ProductModel.fromJson(response.data);
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<TransactionModel> submitTransaction({
    required String? customerId,
    required String? productCode,
    required String successRedirectUrl,
    required String failureRedirectUrl,
  }) async {
    loginData = await SharedPreferences.getInstance();
    try {
      final response = await dio.post('${_baseUrl}transaction/submit',
          data: {
            'customer_id': customerId,
            'product_code': productCode,
            'success_redirect_url': successRedirectUrl,
            'failure_redirect_url': failureRedirectUrl,
          },
          options: Options(
            headers: {
              "Authorization": "Bearer ${loginData.getString('login')}"
            },
          ));
      return TransactionModel.fromJson(response.data);
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<TransactionHistoryModel> getTransactionHistory() async {
    loginData = await SharedPreferences.getInstance();
    try {
      final response = await dio.get('${_baseUrl}transaction/history',
          options: Options(
            headers: {
              "Authorization": "Bearer ${loginData.getString('login')}"
            },
          ));
      return TransactionHistoryModel.fromJson(response.data);
    } on DioError catch (_) {
      rethrow;
    }
  }
}
