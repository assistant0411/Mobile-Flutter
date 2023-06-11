import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mercantis_flutter/models/lista_simples.dart';
import 'package:mercantis_flutter/models/lista_favorito.dart';
import 'package:mercantis_flutter/network/dio_connection.dart';
import 'package:dio/dio.dart';

class Services {
  static const String url =
      'http://api-mobile.tanis.com.br/api/mobile/v10/Clientes/Lista/Simples?CNPJ=00085822000112&CodUsuario=75';

  static const String favurl =
      'https://api-mobile.tanis.com.br/api/mobile/v10/Clientes/Lista/Favoritos?CNPJ=00085822000112&CodUsuario=5';

  static Future<List<ClienteSimples>> getUsers() async {
    Dio dio = new Dio();
    try {
      Response response = await dio.get(url);
      if (response.statusCode == 200) {
        print(response.data);
        List<ClienteSimples> list = parseUsers(response.data);
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

  static Future<List<FavoritoSimples>> getFav() async {
    Dio dio = new Dio();
    try {
      Response response = await dio.get(favurl);
      if (response.statusCode == 200) {
        List<FavoritoSimples> list = parseFav(response.data);
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

  static Future<List<ClienteSimples>> getFilterUsers(String fant) async {
    Dio dio = new Dio();
    try {
      Response response = await dio.get('$url&Fantasia=$fant');
      if (response.statusCode == 200) {
        List<ClienteSimples> list = parseUsers(response.data);
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

  static List<ClienteSimples> parseUsers(Map responseBody) {
    ListaSimples _listaSimples = ListaSimples.fromMap(responseBody);
    return _listaSimples.info.clientes;
  }

  static List<FavoritoSimples> parseFav(Map responseBody) {
    ListaFavorito _favoritoSimples = ListaFavorito.fromMap(responseBody);
    return _favoritoSimples.info.favoritos;
  }
}
