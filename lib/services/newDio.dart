import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/adapter.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DioConnection extends Disposable {
  Dio get dioConnection {
    Dio _dio = Dio();
    BaseOptions _dioOptions = BaseOptions();
    String csrfToken = "token";

    _dioOptions.connectTimeout = 100000;
    _dio.options = _dioOptions;

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options) async {
          // Do something before request is sent
          // print('send request：path:${options.path}，baseURL:${options.baseUrl}');

          if (csrfToken == null) {
            print("no token，request token firstly...");
            //lock the dio.
            _dio.lock();
            return _dio.get("/token").then((d) {
              options.headers["csrfToken"] =
                  csrfToken = d.data['data']['token'];
              print("request token succeed, value: " + d.data['data']['token']);
              print(
                  'continue to perform request：path:${options.path}，baseURL:${options.path}');
              return options;
            }).whenComplete(() => _dio.unlock()); // unlock the dio
          } else {
            // options.headers["csrfToken"] = csrfToken;
            return options;
          }
          //return options; //continue
          // If you want to resolve the request with some custom data，
          // you can return a `Response` object or return `dio.resolve(data)`.
          // If you want to reject the request with a error message,
          // you can return a `DioError` object or return `dio.reject(errMsg)`
        },
        onResponse: (Response response) async {
          // Do something with response data
          return response; // continue
        },
        onError: (DioError e) async {
          // Do something with response error
          print('DioError $e');
          return e; //continue
        },
      ),
    );

    _dio.interceptors.add(
      PrettyDioLogger(
          requestHeader: false,
          requestBody: false,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90),
    );

    // Para ignorar o erro de certificados self signed
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    return _dio;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
