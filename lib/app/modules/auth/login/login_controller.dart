import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wellvia/app/core/services/social_auth_controller.dart';
import 'package:wellvia/app/core/utils/global_widgets/otp_dialog.dart';
import 'package:wellvia/app/routes/app_routes.dart';
import 'package:wellvia/app/core/utils/app_colors.dart';
import 'package:wellvia/app/core/utils/snackbar_utils.dart';

class LoginController extends GetxController {
  // Observable fields for form data
  final RxString countryCode = '+91'.obs;
  final RxString mobileNumber = ''.obs;
  var otp = ''.obs;

  // Interaction flags
  var mobileTouched = false.obs;
  var otpTouched = false.obs;

  // Toggle OTP visibility
  RxBool showOtp = false.obs;

  // Validations
  bool get isMobileValid => mobileNumber.value.length == 10; // Assumes 10-digit mobile number
  bool get isOtpValid => otp.value.length == 6; // Assumes 6-digit OTP

  // Method to handle resend OTP
  void resendOtp() {
    if (isMobileValid) {
      print("Resending OTP to ${countryCode.value}${mobileNumber.value}");
      // Implement resend OTP logic (e.g., API call)
      SnackbarUtils.showInfo(
        title: 'OTP',
        message: 'OTP resent successfully!',
      );
    } else {
      mobileTouched.value = true;
      SnackbarUtils.showError(
        title: 'Error',
        message: 'Please enter a valid mobile number',
      );
    }
  }

  // Method to show OTP dialog
  void showOtpDialog() {
    mobileTouched.value = true;
    if (isMobileValid) {
      print("Sending OTP to ${countryCode.value}${mobileNumber.value}");
      // Implement OTP sending logic (e.g., API call)
      Get.dialog(
        OtpDialog(
          onSubmit: (otpValue) {
            otp.value = otpValue;
            otpTouched.value = true;
            if (isOtpValid) {
              print("Login successful with OTP: $otpValue");
              SnackbarUtils.showSuccess(
                title: 'Success',
                message: 'Login successful!',
              );
              Get.offAllNamed(AppRoutes.main); // Redirect to home page
            } else {
              SnackbarUtils.showError(
                title: 'Error',
                message: 'login_otp_error'.tr,
              );
            }
          },
          themeColor: AppColors.primaryBlue,
        ),
        barrierDismissible: false,
      );
    } else {
      SnackbarUtils.showError(
        title: 'Error',
        message: 'login_mobile_error'.tr,
      );
    }
  }

  // Method to handle login action
  void login() async {
    showOtpDialog();
    // Save credentials in shared preferences after successful login
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('phone_number', mobileNumber.value);
    // Optionally save other credentials if available
  }

  // Method to handle social login
  Future<void> loginWithSocial(String provider) async {
    final socialAuthController = Get.find<SocialAuthController>();
    await socialAuthController.socialLogin(provider);
  }
}