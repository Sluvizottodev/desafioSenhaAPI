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
      appBar: AppBar(
        title: Text(
          'Validação de Senha',
          style: TextStyle(color: Colors.white), // Título em branco
        ),
        centerTitle: false,
        backgroundColor: Color(0xFF572884), // Cor roxa para a AppBar
      ),
      body: SingleChildScrollView( // Permite rolar a tela se o teclado aparecer
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1), // Espaço superior dinâmico
              Icon(Icons.lock, size: 80, color: Colors.black), // Ícone preto para contraste
              SizedBox(height: 16),
              Text(
                'Digite sua senha',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Texto em preto
                ),
              ),
              SizedBox(height: 24),
              // Campo de senha com fundo claro
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Insira a senha',
                  labelStyle: TextStyle(color: Colors.black), // Cor do rótulo em preto
                  hintText: 'Digite sua senha aqui',
                  hintStyle: TextStyle(color: Colors.black54), // Cor do hintText em preto suave
                  errorText: _errorMessage.isNotEmpty ? _errorMessage : null,
                  filled: true,
                  fillColor: Color(0xFFF2F2F2), // Fundo claro para o campo de texto
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 24),
              // Botão de validação com cor roxa
              SizedBox(
                width: double.infinity, // Ocupa toda a largura disponível
                child: ElevatedButton(
                  onPressed: _validatePassword,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    child: Text(
                      'Validar',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, // Cor branca para o texto do botão
                    backgroundColor: Color(0xFF572884), // Cor roxa para o botão
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
