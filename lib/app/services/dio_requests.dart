import 'package:dio/dio.dart';
import 'package:pennywise_app/app/models/register_data.dart';
import 'package:pennywise_app/app/models/register_errors.dart';

class DioRequest {
  static final _dio = Dio(
    BaseOptions(
      baseUrl: 'https://678a-110-93-82-74.ap.ngrok.io/api/auth',
      receiveDataWhenStatusError: true,
    ),
  );

  static Future register(RegisterData data) async {
    var response = await _dio.post(
      '/register',
      data: data.toJson(),
    );

    // print(response.data);

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
