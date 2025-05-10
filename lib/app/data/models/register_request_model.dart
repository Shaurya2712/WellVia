class RegisterRequestModel {
  final String name;
  final String phoneNumber;
  final int userType;

  RegisterRequestModel({
    required this.name,
    required this.phoneNumber,
    required this.userType,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
      'userType': userType,
    };
  }
} 