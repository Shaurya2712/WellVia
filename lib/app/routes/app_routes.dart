abstract class Routes {
  static const initial = '/splash-initial';
  static const splash = '/splash';
  static const splashInitial = '/splash-initial';
  static const main = '/main';
  static const selectAuth = '/select-auth';
  static const signup = '/signup';
  static const login = '/login';
}

abstract class AppRoutes {
  static const initial = Routes.splashInitial;
  static const splash = Routes.splash;
  static const main = Routes.main;
  static const selectAuth = Routes.selectAuth;
  static const signup = Routes.signup;
  static const login = Routes.login;
}