import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wellvia/app/core/constants/colors.dart';
import 'app/routes/app_pages.dart';
import 'app/localization/translation_service.dart';
import 'app/core/services/social_auth_service.dart';
import 'app/core/services/social_auth_controller.dart';
import 'package:wellvia/app/modules/home/home_view.dart';
import 'package:wellvia/app/core/utils/global_widgets/work_in_progress.dart';
import 'package:wellvia/app/routes/app_routes.dart';

void main() async {
  print("App: Starting initialization");
  WidgetsFlutterBinding.ensureInitialized();
  print("App: Flutter binding initialized");
  
  await initGlobalServices();
  print("App: Global services initialized");
  
  runApp(const MyApp());
  print("App: MyApp started")
}

// This function helps you organize global initializations
Future<void> initGlobalServices() async {
  print("App: Initializing global services");
  Get.put<SocialAuthService>(SocialAuthService());
  Get.put<SocialAuthController>(SocialAuthController());
  // If any service requires `await` for initialization:
  // final storageService = await Get.putAsync(() => StorageService().init());
  print("App: Global services initialized successfully");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print("App: Building MyApp widget");
    return GetMaterialApp(
      title: 'WellVia Health',
      debugShowCheckedModeBanner: false,

      // Localization
      translations: TranslationService(),
      locale: TranslationService.locale,
      fallbackLocale: TranslationService.fallbackLocale,

      // Theme
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      // Routes
      initialRoute: Routes.initial,
      getPages: AppPages.routes,
      onInit: () {
        print("App: GetMaterialApp initialized");
      },
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0; // Home tab as default

  final List<Widget> _screens = [
    const HomeView(),
    const WorkInProgressScreen(title: 'Reports'),
    const WorkInProgressScreen(title: 'Checkups'),
    const WorkInProgressScreen(title: 'Ambulance'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, -1),
            ),
          ],
        ),
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart_outlined),
              activeIcon: Icon(Icons.bar_chart),
              label: 'Reports',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.medical_services_outlined),
              activeIcon: Icon(Icons.medical_services),
              label: 'Checkups',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_hospital_outlined),
              activeIcon: Icon(Icons.local_hospital),
              label: 'Ambulance',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: AppColors.primaryPink,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
          type: BottomNavigationBarType.fixed,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}