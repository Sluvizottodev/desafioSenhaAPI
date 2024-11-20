import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/senhaModel.dart';

class ApiService {
  final String baseUrl = 'https://desafioflutter-api.modelviewlabs.com';

  Future<SenhaModel?> validatePassword(String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/validate'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'password': password}),
    );

    if (response.statusCode == 202) {
      // Verifica se é Map<String, dynamic>
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse is Map<String, dynamic>) {
        return SenhaModel.fromJson(jsonResponse);
      }
    }
    return null;
  }
}
