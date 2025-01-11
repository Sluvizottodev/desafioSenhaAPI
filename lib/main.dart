import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:flutter/material.dart';
import 'package:mvl_desafio/alteracoes/view/senhaInputScreen.dart';
import 'package:mvl_desafio/alteracoes/view/sucessoScreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Password Validator',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => SenhaInputScreen(),
        '/success': (context) => SuccessScreen(),
      },
    );
  }
}


Future<HttpServer> run(Handler handler, InternetAddress ip, int port) {
  return serve(
    handler,
    ip,
    port,
    poweredByHeader: 'MVL + DartFrog',
  );
}
///COMEÇOU A DAR ERRO NA API "CERTIFICATE_VERIFY_FAILED: Hostname mismatch", logo o certificado SSL usado pela API não é confiável e não corresponde ao domínio solicitado.