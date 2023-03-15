import 'package:dio/dio.dart';
import 'package:pennywise_app/app/models/login_data.dart';
import 'package:pennywise_app/app/models/register_data.dart';
import 'package:pennywise_app/app/models/transfer_data.dart';

class DioRequest {
  static final _dio = Dio(
    BaseOptions(
      baseUrl: 'https://a220-136-158-28-59.ap.ngrok.io/api',
      receiveDataWhenStatusError: true,
    ),
  );

  static Future register(RegisterData data) async {
    var response = await _dio.post(
      '/auth/register',
      data: data.toJson(),
    );

    if (response.statusCode == 201) {
      print('SUCCESSFULLY REGISTERED');
      return null;
    } else {
      var error = response.data['errors'];

      print(error);
      return error;
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
    } on Exception catch (e) {
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
      print(e.response);
      return false;
    }
  }
}
