class SenhaModel {
  final String id;
  final String message;

  SenhaModel({required this.id, required this.message});

  factory SenhaModel.fromJson(Map<String, dynamic> json) {
    return SenhaModel(
      id: json['id']as String,
      message: json['message'] as String,
    );
  }
}
