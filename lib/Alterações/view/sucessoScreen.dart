import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final message = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text('Sucesso'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Animação de sucesso
          Lottie.asset(
            'lib/Alterações/animacao/Animation - 1732066924356.json', // Coloque o caminho correto para sua animação Lottie
            width: 150,
            height: 150,
            repeat: false,
          ),
          SizedBox(height: 20),
          // Mensagem de sucesso
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              message,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 30),
          // Botão para retornar à tela principal
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Voltar'),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
