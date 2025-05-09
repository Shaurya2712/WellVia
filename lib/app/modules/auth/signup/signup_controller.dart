import 'package:get/get.dart' as getx;
import 'package:wellvia/app/core/services/social_auth_controller.dart';
import 'package:wellvia/app/core/utils/global_widgets/otp_dialog.dart';
import 'package:wellvia/app/routes/app_routes.dart';
import 'package:wellvia/app/data/repositories/auth_repository.dart';
import 'package:wellvia/app/data/models/register_request_model.dart';
import 'package:wellvia/app/core/utils/app_colors.dart';
import 'package:wellvia/app/core/utils/snackbar_utils.dart';

class SignUpController extends getx.GetxController {
  final AuthRepository _authRepository = getx.Get.find<AuthRepository>();
  
  // Observable fields for form data
  var name = ''.obs;
  final getx.RxString countryCode = '+91'.obs;
  final getx.RxString mobileNumber = ''.obs;
  var otp = ''.obs;
  var termsAccepted = false.obs;
  var isLoading = false.obs;

  // Interaction flags
  var nameTouched = false.obs;
  var mobileTouched = false.obs;
  var otpTouched = false.obs;

  // Toggle OTP visibility
  getx.RxBool showOtp = false.obs;

  // Validations
  bool get isNameValid => name.value.isNotEmpty;
  bool get isMobileNumberValid => mobileNumber.value.length == 10;
  bool get isOtpValid => otp.value.length == 6;
  bool get isFormValid => isNameValid && isMobileNumberValid && termsAccepted.value;

  // Method to show OTP dialog
  void showOtpDialog() {
    nameTouched.value = true;
    mobileTouched.value = true;
    if (isFormValid) {
      _registerUser();
    } else {
      SnackbarUtils.showError(
        title: 'Error',
        message: 'signup_form_error'.tr,
      );
    }
  }

  // Method to handle user registration
  Future<void> _registerUser() async {
    try {
      isLoading.value = true;
      
      final request = RegisterRequestModel(
        name: name.value,
        phoneNumber: mobileNumber.value,
        userType: 2, // Default user type
      );

      final response = await _authRepository.register(request);
      
      if (response.status) {
        getx.Get.dialog(
          OtpDialog(
            onSubmit: (otpValue) {
              otp.value = otpValue;
              otpTouched.value = true;
              if (isOtpValid) {
                SnackbarUtils.showSuccess(
                  title: 'Success',
                  message: 'Registration successful!',
                );
                getx.Get.offAllNamed(AppRoutes.main);
              } else {
                SnackbarUtils.showError(
                  title: 'Error',
                  message: 'signup_error_otp'.tr,
                );
              }
            },
            themeColor: AppColors.primaryPink,
          ),
          barrierDismissible: false,
        );
      } else {
        SnackbarUtils.showError(
          title: 'Error',
          message: response.message,
        );
      }
    } catch (e) {
      SnackbarUtils.showError(
        title: 'Error',
        message: e.toString(),
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Method to handle SignUp action
  void signUp() {
    showOtpDialog();
  }

  // Method to handle social signup
  Future<void> signupWithSocial(String provider) async {
    final socialAuthController = getx.Get.find<SocialAuthController>();
    await socialAuthController.socialLogin(provider);
  }
}