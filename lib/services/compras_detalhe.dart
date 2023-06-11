import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:mercantis_flutter/models/compras_detalhe.dart';
import 'package:mercantis_flutter/services/newDio.dart';

class Services {
  static const String url =
      'http://api-mobile.tanis.com.br/api/mobile/v10/Compras/Pedido/';
  // 'https://api-mobile.tanis.com.br/api/mobile/v10/Compras/Pedido/';
  static const String urlEND = '?CNPJ=00085822000112';
  static DioConnection dioSrvc = DioConnection();
  static Future<PedidoCompra> getComp(int codCompra) async {
    try {
      Response response =
          await dioSrvc.dioConnection.get('$url$codCompra$urlEND');
      if (response.statusCode == 200) {
        PedidoCompra list = parseComp(response.data);
        print(list);
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

  static PedidoCompra parseComp(Map responseBody) {
    ComprasDetalhe _listaComp = ComprasDetalhe.fromMap(responseBody);
    print(_listaComp.info.pedidoCompra);
    return _listaComp.info.pedidoCompra;
  }
}
