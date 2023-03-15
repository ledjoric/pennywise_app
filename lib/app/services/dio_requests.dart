import 'package:dio/dio.dart';
import 'package:pennywise_app/app/models/login_data.dart';
import 'package:pennywise_app/app/models/register_data.dart';

class DioRequest {
  static final _dio = Dio(
    BaseOptions(
      baseUrl: 'https://23fc-110-93-82-74.ap.ngrok.io/api/auth',
      receiveDataWhenStatusError: true,
    ),
  );

  static Future register(RegisterData data) async {
    var response = await _dio.post(
      '/register',
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
        '/login',
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
}
