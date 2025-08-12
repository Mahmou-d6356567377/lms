import 'package:go_router/go_router.dart';
import 'package:lms/presentation/views/auth/forget_password/forget_password.dart';
import 'package:lms/presentation/views/auth/makeaccount/make_account.dart';
import 'package:lms/presentation/views/home/home.dart';

class GoRoutes {
  static const String home = '/home';
  static const String makeaccount = '/makeaccount';
  static const String forgetpassword = '/forgetpassword';


  static final GoRouter  router = GoRouter(
    initialLocation: makeaccount,
    debugLogDiagnostics: true,
        routes: [
          GoRoute(
            path: home,
            builder: (context, state) => Home(),
          ),
          GoRoute(
            path: makeaccount,
            builder: (context, state) =>  MakeAccount(),
          ),
          GoRoute(
            path: forgetpassword,
            builder: (context, state) =>  ForgetPasswordScreen(),
          ),
         
        ],
      );  
}