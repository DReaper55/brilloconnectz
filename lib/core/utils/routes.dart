
import 'package:brilloconnectz/features/buddies/presentation/pages/buddies.dart';
import 'package:brilloconnectz/features/discover/presentation/pages/discover.dart';
import 'package:brilloconnectz/features/homepage/presentation/pages/homepage.dart';
import 'package:brilloconnectz/features/login/presentation/pages/login.dart';
import 'package:brilloconnectz/features/profile/presentation/pages/profile.dart';
import 'package:brilloconnectz/features/register/presentation/pages/register.dart';
import 'package:brilloconnectz/features/register/presentation/pages/sport_interest.dart';
import 'package:brilloconnectz/features/settings/presentation/pages/settings.dart';
import 'package:brilloconnectz/features/startup/bottom_nav_pages.dart';
import 'package:flutter/material.dart';

class Routes {
  static const login = '/login';
  static const register = '/register';
  static const interests = '/interests';
  static const forgot = '/forgotPass';
  static const homepage = '/homepage';
  static const profile = '/profile';
  static const buddies = '/buddies';
  static const discover = '/discover';
  static const setting = '/settings';
  static const changePassword = '/changePassword';
  static const updateEmail = '/updateEmail';
  static const updateUsername = '/updateUsername';
  static const bottomNav = '/bottomNav';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case register:
        return MaterialPageRoute(builder: (_) => const Register());
      case login:
        return MaterialPageRoute(builder: (_) => const Login());
      case interests:
        return MaterialPageRoute(builder: (_) => const SportInterest());
      case bottomNav:
        return MaterialPageRoute(builder: (_) => const BottomNavPages());
      case homepage:
        return MaterialPageRoute(builder: (_) => const Homepage());
      case profile:
        return MaterialPageRoute(builder: (_) => const Profile());
      case buddies:
        return MaterialPageRoute(builder: (_) => const Buddies());
      case discover:
        return MaterialPageRoute(builder: (_) => const Discover());
      case setting:
        return MaterialPageRoute(builder: (_) => const Settings());
      case changePassword:
        return MaterialPageRoute(builder: (_) => const SizedBox());
      case updateEmail:
        return MaterialPageRoute(builder: (_) => const SizedBox());
      case updateUsername:
        return MaterialPageRoute(builder: (_) => const SizedBox());
      case forgot:
        return MaterialPageRoute(builder: (_) => const SizedBox());
      default:
        return MaterialPageRoute(builder: (_) => const SizedBox());
    }
  }
}
