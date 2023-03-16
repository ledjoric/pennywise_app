import 'package:dio/dio.dart';
import 'package:pennywise_app/app/models/login_data.dart';
import 'package:pennywise_app/app/models/register_data.dart';
import 'package:pennywise_app/app/models/transfer_data.dart';

class DioRequest {
  static final _dio = Dio(
    BaseOptions(
      baseUrl: 'https://23fc-110-93-82-74.ap.ngrok.io/api/auth',
    ),
  );

  static Future register(RegisterData data) async {
    try {
      var response = await _dio.post(
      '/auth/register',
      data: data.toJson(),
    );

      if (response.statusCode == 201) {
        print('SUCCESSFULLY REGISTERED');
        return null;
      }
    } on DioError catch (e) {
      var errorResponse = e.response!.data['errors'];
      return errorResponse;
    }
  }

  static Future login(LoginData data) async {
    try {
      var response = await _dio.post(
        '/auth/login',
        data: data.toJson(),
      );

      if (response.statusCode == 200) {
        print('LOGGED IN');
        return true;
      } else {
        return false;
      }
    } on DioError catch (e) {
      print(e);
      return false;
    }
  }

  static Future transfer(int userId, TransferData data) async {
    try {
      var response = await _dio.post(
        '/user/transfer',
        queryParameters: {'user': userId},
        data: data.toJson(),
      );

      if (response.statusCode == 201) {
        print('TRANSFER SUCCESS');
        return true;
      }
    } on DioError catch (e) {
      if (e.response!.statusCode == 403) {
        print('YOU ARE NOT VERIFIED');
      } else if (e.response!.statusCode == 401) {
        print('NOT ENOUGH BALANCE');
      } else {
        print(e.response);
      }
      return false;
    }
  }
}
