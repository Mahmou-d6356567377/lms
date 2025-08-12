import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lms/presentation/views/auth/makeaccount/widgets/custom_button.dart';
import 'package:lms/presentation/views/auth/makeaccount/widgets/custom_password_field.dart';
import 'package:lms/presentation/views/auth/makeaccount/widgets/logo_header.dart';
import 'package:lms/utils/consts/const_imgs.dart';

class ForgetPasswordScreen extends StatelessWidget {
  final TextEditingController confirmpasswordController =
      TextEditingController();
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

  bool verifyPasswordFields(
    BuildContext context,
    TextEditingController passwordController,
    TextEditingController confirmpasswordController,
  ) {
    if (passwordController.text.isEmpty ||
        confirmpasswordController.text.isEmpty) {
      showCustomSnackBar(context, 'Please fill in all fields');
      return false;
    }
    if (passwordController.text != confirmpasswordController.text) {
      showCustomSnackBar(context, 'Passwords do not match');
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(bottom: 0, child: SvgPicture.asset(ConstImgs.banner1)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const LogoHeader(),
                const SizedBox(height: 90),
                Text(
                  'Forget Password ?',
                  style: GoogleFonts.capriola(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20),
                CustomPasswordField(controller: passwordController),
                const SizedBox(height: 20),
                CustomPasswordField(controller: confirmpasswordController),
                const SizedBox(height: 30),
                CustomButton(
                  text: 'confirm',
                  onPressed: () {
                    verifyPasswordFields(
                      context,
                      passwordController,
                      confirmpasswordController,
                    );
                    GoRouter.of(context).pop();
                    print('Email: ${confirmpasswordController.text}');
                    print('Password: ${passwordController.text}');
                  },
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
