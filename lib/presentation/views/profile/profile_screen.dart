import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lms/presentation/views/profile/widgets/info_container.dart';
import 'package:lms/presentation/views/profile/widgets/profile_image.dart';
import 'package:lms/presentation/views/profile/widgets/progress_container.dart';
import 'package:lms/utils/consts/const_colors.dart';
import 'package:lms/widgets/custom_background.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ConstColors.safeareacolor,
        child: SafeArea(
          child: Stack(
            children: [
              CustomBackground(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        'Profile',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ProfileImage(),
                      const SizedBox(height: 20),
                      Text(
                        ' John Doe',
                        style: GoogleFonts.cambay(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[400],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Mm1x0b3@example.com',
                        style: GoogleFonts.cambay(
                          fontSize: 20,
                          color: Colors.grey[400],
                        ),
                      ),
                      const SizedBox(height: 20),
                      InfoContainer(),
                      ProgressContainer()
                              ],
                            ),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
