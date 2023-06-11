import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/adapter.dart';

import 'package:flutter_modular/flutter_modular.dart';

class DioConnection extends Disposable {
  Dio get dioConnection {
    Dio _dio = Dio();

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
