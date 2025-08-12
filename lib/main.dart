import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:lms/utils/routes/routes.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(BlocProvider(
      create: (_) => AuthBloc(),
      child: const MainApp(),
    ),);
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(routerConfig: GoRoutes.router, debugShowCheckedModeBanner: false, title: 'LMS App', theme: ThemeData(
      primarySwatch: Colors.deepPurple,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    ));
  }
}
