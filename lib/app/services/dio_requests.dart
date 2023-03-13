import 'package:dio/dio.dart';
import 'package:pennywise_app/app/models/register_data.dart';

class DioRequest {
  static final _dio = Dio(
    BaseOptions(
      baseUrl: 'https://0c4f-136-158-28-135.ap.ngrok.io/api/auth',
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
}
