import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:mercantis_flutter/models/clientes_detalhe.dart';

class Services {
  static const String url =
      'http://api-mobile.tanis.com.br/api/mobile/v10/Clientes/';
  static const String urlEND = '?CNPJ=00085822000112';

  static Future<Cliente> getCliente(int codCliente) async {
    Dio dio = new Dio();
    try {
      Response response = await dio.get('$url$codCliente$urlEND');
      if (response.statusCode == 200) {
        Cliente list = parseCliente(response.data);
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

  static Cliente parseCliente(Map responseBody) {
    ClienteDetalhe _listaCliente = ClienteDetalhe.fromMap(responseBody);
    print(_listaCliente.info.cliente);
    return _listaCliente.info.cliente;
  }
}
