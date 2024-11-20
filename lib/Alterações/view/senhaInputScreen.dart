import 'package:flutter/material.dart';
import '../controllers/senhaController.dart';

class SenhaInputScreen extends StatefulWidget {
  @override
  _PasswordInputScreenState createState() => _PasswordInputScreenState();
}

class _PasswordInputScreenState extends State<SenhaInputScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final SenhaController _controller = SenhaController();
  String _errorMessage = '';

  void _validatePassword() async {
    final password = _passwordController.text;
    final response = await _controller.validatePassword(password);

    if (response != null) {
      Navigator.pushNamed(
        context,
        '/success',
        arguments: response.message,
      );
    } else {
      setState(() {
        _errorMessage = 'Senha inválida ou fraca. Tente novamente.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Validação de Senha')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Insira a senha',
                errorText: _errorMessage.isNotEmpty ? _errorMessage : null,
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _validatePassword,
              child: Text('Validar'),
            ),
          ],
        ),
      ),
    );
  }
}
