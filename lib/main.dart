import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:flutter/material.dart';
import 'package:mvl_desafio/Altera%C3%A7%C3%B5es/view/senhaInputScreen.dart';
import 'package:mvl_desafio/Altera%C3%A7%C3%B5es/view/sucessoScreen.dart';


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
