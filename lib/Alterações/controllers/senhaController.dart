import '../models/senhaModel.dart';
import '../service/apiService.dart';

class SenhaController {
  final ApiService _apiService = ApiService();

  Future<SenhaModel?> validatePassword(String password) async {
    if (_isPasswordStrong(password)) {
      final response = await _apiService.validatePassword(password);
      return response;
    } else {
      return null;
    }
  }

  bool _isPasswordStrong(String password) {
    final regex = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
    );
    return regex.hasMatch(password);
  }
}
