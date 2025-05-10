import 'package:get/get.dart';
import '../modules/splash_initial/splash_initial_binding.dart';
import '../modules/splash_initial/splash_initial_view.dart';
import '../modules/splash/splash_binding.dart';
import '../modules/splash/splash_view.dart';
import '../modules/home/home_binding.dart';
import '../modules/home/home_view.dart';
import '../modules/auth/select_auth/select_auth_binding.dart';
import '../modules/auth/select_auth/select_auth_view.dart';
import '../modules/auth/signup/signup_binding.dart';
import '../modules/auth/signup/singup_view.dart';
import '../modules/auth/login/login_binding.dart';
import '../modules/auth/login/login_view.dart';
import 'app_routes.dart';
import 'package:wellvia/app/core/utils/global_widgets/work_in_progress.dart';
import 'package:wellvia/main.dart';
import '../modules/doctor_consultation/doctor_consultation_binding.dart';
import '../modules/doctor_consultation/doctor_consultation_view.dart';
import '../modules/lab_test/lab_test_binding.dart';
import '../modules/lab_test/lab_test_view.dart';
import '../modules/book_consultation/book_consultation_binding.dart';
import '../modules/book_consultation/book_consultation_view.dart';
import '../modules/book_appointment/book_appointment_binding.dart';
import '../modules/book_appointment/book_appointment_view.dart';
import '../modules/book_payment/book_payment_binding.dart';
import '../modules/book_payment/book_payment_view.dart';
import '../modules/payment_summary/payment_summary_binding.dart';
import '../modules/payment_summary/payment_summary_view.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.initial,
      page: () => const SplashInitialView(),
      binding: SplashInitialBinding(),
      transition: Transition.fade,
    ),
    GetPage(
      name: Routes.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
      transition: Transition.fade,
    ),
    GetPage(
      name: Routes.main,
      page: () => const MainScreen(),
      binding: HomeBinding(),
      transition: Transition.fade,
    ),
    GetPage(
      name: Routes.selectAuth,
      page: () => const SelectAuthView(),
      binding: SelectAuthBinding(),
      transition: Transition.fade,
    ),
    GetPage(
      name: Routes.signup,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
      transition: Transition.fade,
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
      transition: Transition.fade,
    ),
    GetPage(
      name: '/doctor-consultation',
      page: () => const DoctorConsultationView(),
      binding: DoctorConsultationBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: '/lab-test',
      page: () => const LabTestView(),
      binding: LabTestBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: '/book-consultation',
      page: () => const BookConsultationView(),
      binding: BookConsultationBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: '/book-appointment',
      page: () => const BookAppointmentView(),
      binding: BookAppointmentBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: '/book-payment',
      page: () => const BookPaymentView(),
      binding: BookPaymentBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: '/payment-summary',
      page: () => const PaymentSummaryView(),
      binding: PaymentSummaryBinding(),
      transition: Transition.rightToLeft,
    ),
  ];
}