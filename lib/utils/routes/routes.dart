import 'package:go_router/go_router.dart';
import 'package:lms/presentation/views/auth/forget_password/forget_password.dart';
import 'package:lms/presentation/views/auth/makeaccount/make_account.dart';
import 'package:lms/presentation/views/home/home.dart';
import 'package:lms/presentation/views/navBar/nav_bar.dart';

class GoRoutes {
  static const String home = '/home';
  static const String makeaccount = '/makeaccount';
  static const String forgetpassword = '/forgetpassword';
  static const String navbarscreen = '/navbarscreen';


  static final GoRouter  router = GoRouter(
    initialLocation: navbarscreen,
    debugLogDiagnostics: true,
        routes: [
          GoRoute(
            path: home,
            builder: (context, state) => HomeScreen(),
          ),
          GoRoute(
            path: makeaccount,
            builder: (context, state) =>  MakeAccount(),
          ),
          GoRoute(
            path: forgetpassword,
            builder: (context, state) =>  ForgetPasswordScreen(),
          ),
          GoRoute(
            path: navbarscreen,
            builder: (context, state) =>  NavBarScreen(),
          ),
         
        ],
      );  
}