import '../models/senhaModel.dart';
import '../service/apiService.dart';

class SenhaController {
  final ApiService _apiService = ApiService();

  Future<SenhaModel?> validatePassword(String password) async {
    print('Iniciando a validação da senha: $password');  // Log para verificar o valor da senha recebida
    if (password!= null) {
      print('Senha forte, enviando para a API...');
      final response = await _apiService.validatePassword(password);
      print('Resposta da API: ${response?.message}');  // Log para verificar a resposta da API
      return response;
    } else {
      print('Senha fraca detectada.');
      return null;
    }
  }
  ///A senha '#eforTe1' está dando erro na API
  // bool _isPasswordStrong(String password) {
  //   final regex = RegExp(
  //     r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{7,}$',
  //   );
  //   final isValid = regex.hasMatch(password);
  //   print('Senha valida: $isValid');  // Log para verificar se a senha corresponde ao padrão
  //   return isValid;
  // }
}
