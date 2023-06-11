//import 'package:flutter/material.dart';
//import 'package:flutter_modular/flutter_modular.dart';
//
//import 'package:tanis_tci/app/models/dtos/LoginCompDto_model.dart';
//import 'package:tanis_tci/app/models/dtos/LoginDto_model.dart';
//import 'package:mercantis_flutter/network/tci_repository.dart';
//
//class TciService extends Disposable {
//  final TciRepository tciRepo;
//
//  TciService({@required this.tciRepo});
//
//  //dispose will be called automatically
//  Future<LoginDtoModel> listaLogin() async {
//    Map<String, dynamic> listLogin = await tciRepo.fetchLogin();
//    LoginDtoModel tciLogin = LoginDtoModel.fromMap(listLogin);
//    // print('Lista Login : \n ${tciLogin.toString()}');
//    return tciLogin;
//  }
//
//  Future<LoginCompDtoModel> listaLoginComp(int loginId) async {
//    Map<String, dynamic> listLoginComp = await tciRepo.fetchLoginComp(loginId);
//    LoginCompDtoModel tciLoginComp = LoginCompDtoModel.fromMap(listLoginComp);
//    //print('Lista Computadores : \n ${tciLoginComp.toString()}');
//    return tciLoginComp;
//  }
//
//  Future<LoginCompDtoModel> listaLoginEmpsis(int loginId) async {
//    Map<String, dynamic> listLoginComp = await tciRepo.fetchLoginComp(loginId);
//    LoginCompDtoModel tciLoginComp = LoginCompDtoModel.fromMap(listLoginComp);
//    //print('Lista Computadores : \n ${tciLoginComp.toString()}');
//    return tciLoginComp;
//  }
//
//  Future<LoginCompDtoModel> listaLoginEmpsisCC(
//      int loginId, int codEmpsis) async {
//    Map<String, dynamic> listLoginComp = await tciRepo.fetchLoginComp(loginId);
//    LoginCompDtoModel tciLoginComp = LoginCompDtoModel.fromMap(listLoginComp);
//    //print('Lista Computadores : \n ${tciLoginComp.toString()}');
//    return tciLoginComp;
//  }
//
//  @override
//  void dispose() {}
//}
