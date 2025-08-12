import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lms/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:lms/presentation/views/auth/makeaccount/widgets/custom_button.dart';
import 'package:lms/presentation/views/auth/makeaccount/widgets/custom_password_field.dart';
import 'package:lms/presentation/views/auth/makeaccount/widgets/forget_password.dart';
import 'package:lms/presentation/views/auth/makeaccount/widgets/logo_header.dart';
import 'package:lms/utils/consts/const_imgs.dart';
import 'package:lms/utils/routes/routes.dart';
import 'package:lms/widgets/custom_text_field.dart';

class MakeAccount extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void showCustomSnackBar(
    BuildContext context,
    String message, {
    Color backgroundColor = Colors.red,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: backgroundColor),
    );
  }

  bool verifyEmailAndPasswordFields(
    BuildContext context,
    TextEditingController emailController,
    TextEditingController passwordController,
  ) {
    final email = emailController.text.trim();
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      showCustomSnackBar(context, 'Please fill in all fields');
      return false;
    }

    // Simple email validation
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email)) {
      showCustomSnackBar(context, 'Please enter a valid email');
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(bottom: 0, child: SvgPicture.asset(ConstImgs.banner1)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthSuccess) {
                  showCustomSnackBar(context, 'Account created!', backgroundColor: Colors.green);
                  GoRouter.of(context).go(GoRoutes.home);
                } else if (state is AuthFailure) {
                  showCustomSnackBar(context, state.message);
                }
                // Optionally handle AuthLoading for a loading indicator
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const LogoHeader(),
                  const SizedBox(height: 90),
                  Text(
                    'Login',
                    style: GoogleFonts.capriola(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomEmailField(controller: emailController),
                  const SizedBox(height: 20),
                  CustomPasswordField(controller: passwordController),
                  const SizedBox(height: 30),
                  CustomButton(
                    text: 'Make account',
                    onPressed: () {
                      if (verifyEmailAndPasswordFields(
                        context,
                        emailController,
                        passwordController,
                      )) {
                        context.read<AuthBloc>().add(
                          AuthSignUpRequested(
                            emailController.text.trim(),
                            passwordController.text,
                          ),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  ForgotPasswordLink(
                    onTap: () {
                      GoRouter.of(context).push(GoRoutes.forgetpassword);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}