import 'dart:core';

import 'package:flutter_modular/flutter_modular.dart';

class UrlEndpointsTci extends Disposable {
  // Url Base
  final String _urlApiTciBase = 'https://tanissrv.ddns.net:8081/api/';
  final String _urlApiTciVersao = '';
  final String _urlApiTciResource = 'TanisCostumerInfoRelatorioAPI/';
  // EndPoints
  final String _urlApiTciEPListaLogin = 'ListaLogin';
  final String _urlApiTciEPListaLoginCompPorLogin = 'ListaLoginCompPorLogin';
  final String _urlApiTciEPListaLoginEmpSisPorLogin = 'ListaLoginEmpsisPorLogin';
  final String _urlApiTciEPListaLoginEmpSisCCPorLogin = 'ListaLoginEmpsisCCPorLogin';

  String get urlApiTciListaLogin => '$_urlApiTciBase$_urlApiTciVersao$_urlApiTciResource$_urlApiTciEPListaLogin';
  String urlApiTciListaLoginCompPorLogin(int loginID) =>
      '$_urlApiTciBase$_urlApiTciVersao$_urlApiTciResource$_urlApiTciEPListaLoginCompPorLogin/$loginID';
  String urlApiTciEPListaLoginEmpSisPorLogin(int loginID) =>
      '$_urlApiTciBase$_urlApiTciVersao$_urlApiTciResource$_urlApiTciEPListaLoginEmpSisPorLogin/$loginID';
  String urlApiTciEPListaLoginEmpSisCCPorLogin(int loginID) =>
      '$_urlApiTciBase$_urlApiTciVersao$_urlApiTciResource$_urlApiTciEPListaLoginEmpSisCCPorLogin/$loginID';

  //dispose will be called automatically
  @override
  void dispose() {}
}
