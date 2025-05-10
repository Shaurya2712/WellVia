class RegisterResponseModel {
  final bool status;
  final dynamic errors;
  final String message;
  final dynamic data;

  RegisterResponseModel({
    required this.status,
    this.errors,
    required this.message,
    this.data,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      status: json['status'] ?? false,
      errors: json['errors'],
      message: json['message'] ?? '',
      data: json['data'],
    );
  }
} 