import 'package:get/get.dart';

class SignUpController extends GetxController {
  // Observable fields for form data
  var name = ''.obs;
  var mobileNumber = ''.obs;
  var otp = ''.obs;
  var termsAccepted = false.obs;

  // Interaction flags
  var nameTouched = false.obs;
  var mobileTouched = false.obs;
  var otpTouched = false.obs;

  // Toggle OTP visibility
  RxBool showOtp = false.obs;

  // Validations with interaction check
  bool get isNameValid => name.value.isNotEmpty;
  bool get isMobileNumberValid => mobileNumber.value.length == 10;
  bool get isOtpValid => otp.value.isNotEmpty;
  bool get isFormValid =>
      isNameValid && isMobileNumberValid && isOtpValid && termsAccepted.value;

  // Method to handle SignUp action
  void signUp() {
    nameTouched.value = true;
    mobileTouched.value = true;
    otpTouched.value = true;

    if (isFormValid) {
      print("SignUp successful!");
    } else {
      print("Form is not valid!");
    }
  }
}

