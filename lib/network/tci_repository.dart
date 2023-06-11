import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:mercantis_flutter/network/dio_connection.dart';
import 'package:mercantis_flutter/network/url_endpoints.dart';

class TciRepository extends Disposable {
  final UrlEndpointsTci urlTciService;
  final DioConnection dioSrvc;

  TciRepository({@required this.urlTciService, @required this.dioSrvc});

  Future<Map<String, dynamic>> fetchLogin() async {
    final response =
        await dioSrvc.dioConnection.get(urlTciService.urlApiTciListaLogin);
    //print('Response Lista Login: {$response}');
    return response.data;
  }

  Future<Map<String, dynamic>> fetchLoginComp(int loginId) async {
    final response = await dioSrvc.dioConnection
        .get(urlTciService.urlApiTciListaLoginCompPorLogin(loginId));
    //print('Response Lista Comp: {$response}');
    return response.data;
  }

  Future<Map<String, dynamic>> fetchLoginEmpsis(int loginId) async {
    final response = await dioSrvc.dioConnection
        .get(urlTciService.urlApiTciEPListaLoginEmpSisPorLogin(loginId));
    //print('Response Lista Empsis CC: {$response}');
    return response.data;
  }

  Future<Map<String, dynamic>> fetchLoginEmpsisCC(
      int loginId, int codEmpsis) async {
    final response = await dioSrvc.dioConnection.get(
      urlTciService.urlApiTciEPListaLoginEmpSisCCPorLogin(loginId),
      queryParameters: {'CodEmpsis': codEmpsis},
    );
    //print('Response Lista CC: {$response}');
    return response.data;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
