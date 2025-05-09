import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SocialUser {
  final String name;
  final String email;
  final String profilePicture;
  final String provider;

  SocialUser({
    required this.name,
    required this.email,
    required this.profilePicture,
    required this.provider,
  });
}

class SocialAuthService extends GetxService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  static const String _isLoggedInKey = 'is_logged_in';

  /// Check if user is logged in
  Future<bool> isUserLoggedIn() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getBool(_isLoggedInKey) ?? false;
    } catch (e) {
      debugPrint('Error checking login status: $e');
      return false;
    }
  }

  /// Set login status
  Future<void> setLoginStatus(bool isLoggedIn) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_isLoggedInKey, isLoggedIn);
    } catch (e) {
      debugPrint('Error setting login status: $e');
    }
  }

  /// Sign in with Google
  Future<SocialUser?> loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      await setLoginStatus(true);

      return SocialUser(
        name: googleUser.displayName ?? '',
        email: googleUser.email,
        profilePicture: googleUser.photoUrl ?? '',
        provider: 'google',
      );
    } catch (e) {
      debugPrint('Google Sign-In Error: $e');
      Get.snackbar('Google Sign-In Failed', e.toString(), backgroundColor: Colors.redAccent, colorText: Colors.white);
      return null;
    }
  }

  /// Sign in with Facebook
  Future<SocialUser?> loginWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();

      if (result.status == LoginStatus.success) {
        final userData = await FacebookAuth.instance.getUserData(
          fields: "name,email,picture.width(200)",
        );
        await setLoginStatus(true);

        return SocialUser(
          name: userData['name'] ?? '',
          email: userData['email'] ?? '',
          profilePicture: userData['picture']['data']['url'] ?? '',
          provider: 'facebook',
        );
      } else {
        Get.snackbar('Facebook Sign-In Failed', result.message ?? 'Unknown error',
            backgroundColor: Colors.redAccent, colorText: Colors.white);
        return null;
      }
    } catch (e) {
      debugPrint('Facebook Sign-In Error: $e');
      Get.snackbar('Facebook Sign-In Error', e.toString(), backgroundColor: Colors.redAccent, colorText: Colors.white);
      return null;
    }
  }

  /// Optional: Sign out from both
  Future<void> logout() async {
    await _googleSignIn.signOut();
    await FacebookAuth.instance.logOut();
    await setLoginStatus(false);
  }
}
