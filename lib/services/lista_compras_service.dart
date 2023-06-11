import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:mercantis_flutter/models/lista_compras.dart';
import 'package:mercantis_flutter/services/newDio.dart';

class Services {
  static const String url =
      // 'https://192.168.25.239:8080/api/mobile/v10/Compras/Pedido/NaoAutorizados?CNPJ=00085822000112'
      'http://api-mobile.tanis.com.br/api/mobile/v10/Compras/Pedido/NaoAutorizados?CNPJ=00085822000112';
  static DioConnection dioSrvc = DioConnection();
  static Future<List<Compras>> getCompras() async {
    try {
      Response response = await dioSrvc.dioConnection.get(url);
      if (response.statusCode == 200) {
        //print(response.data);
        List<Compras> list = parseCompras(response.data);
        return list;
      } else {
        throw Exception("Error");
      }
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response.data);
        print(e.response.headers);
        print(e.response.request);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.request);
        print(e.message);
      }
    }
  }

  static List<Compras> parseCompras(Map responseBody) {
    ListaCompras _listaCompras = ListaCompras.fromMap(responseBody);
    print(_listaCompras.info.compras);
    return _listaCompras.info.compras;
  }
}
