import 'package:get/get.dart' as getx;
import '../models/register_request_model.dart';
import '../models/register_response_model.dart';
import '../../core/services/dio_service.dart';

class AuthRepository {
  final DioService _dioService = getx.Get.find<DioService>();

  Future<RegisterResponseModel> register(RegisterRequestModel request) async {
    try {
      final response = await _dioService.post('/auth/register', data: request.toJson());
      return RegisterResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
} 