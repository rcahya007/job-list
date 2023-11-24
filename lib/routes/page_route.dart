import 'package:get/get.dart';
import 'package:sanberappflutter/screens/home/index_home_screen.dart';
import 'package:sanberappflutter/screens/logres_screen/index_logres_screen.dart';
import 'package:sanberappflutter/screens/logres_screen/sign_in_logres_screen.dart';
import 'package:sanberappflutter/screens/logres_screen/sign_up_logres_screen.dart';
import 'package:sanberappflutter/screens/profile_user/profile_user.dart';
import 'package:sanberappflutter/screens/splash_screen/intro_page1.dart';
import 'package:sanberappflutter/screens/splash_screen/intro_page2.dart';
import 'package:sanberappflutter/screens/splash_screen/intro_page3.dart';
import 'package:sanberappflutter/screens/splash_screen/splash_screen.dart';
import 'route_name.dart';

class AppRoute {
  static final pages = [
    GetPage(
      name: RouteName.splashScreen,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: RouteName.intro1Screen,
      page: () => const IntroPageOne(),
    ),
    GetPage(
      name: RouteName.intro2Screen,
      page: () => const IntroPageTwo(),
    ),
    GetPage(
      name: RouteName.intro3Screen,
      page: () => const IntroPageThree(),
    ),
    GetPage(
      name: RouteName.indexLogregScreen,
      page: () => const IndexLogresScreen(),
    ),
    GetPage(
      name: RouteName.signIn,
      page: () => const SignInScreen(),
    ),
    GetPage(
      name: RouteName.signUp,
      page: () => const SignUpScreen(),
    ),
    GetPage(
      name: RouteName.home,
      page: () => const IndexHomeScreen(),
    ),
    GetPage(
      name: RouteName.profile,
      page: () => ProfileUser(),
    ),
  ];
}
