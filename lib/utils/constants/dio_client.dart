import 'package:dio/dio.dart';
import 'package:wingman/utils/constants/constant.dart';

class DioClient {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: Constants.apiurlupdate,
      connectTimeout: const Duration(seconds: 50000),
      receiveTimeout: const Duration(seconds: 30000),
    ),
  );



  Future<Response> post(String path,
      {required Map<String, dynamic> data}) async {
    return await dio.post(path,
        data: data,
        options: Options(
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
          },
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
        ));
  }

    Future<Response> postToken(String path,
      {required Map<String, dynamic> data,required String token}) async {
    return await dio.post(path,
        data: data,
        options: Options(
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
            'Token': token
          },
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
        ));
  }
}
