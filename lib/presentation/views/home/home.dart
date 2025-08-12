import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lms/presentation/views/home/widgets/chart_card.dart';
import 'package:lms/presentation/views/home/widgets/nav_button.dart';
import 'package:lms/utils/consts/const_imgs.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  final List<String> navLabels = ['ORMS', 'JAVA', 'C#'];
 
  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: SvgPicture.asset(ConstImgs.banner1, fit: BoxFit.cover, ),
            ),
        
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: hight * 0.2),
                    Text(
                      'Hi, Ciar',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Lets become active!',
                      style: GoogleFonts.corben(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 16),
                        
                   chartcard(totaltasks: 30, completedtasks: 20),
                    const SizedBox(height: 16),
                        
                    // Activities Chart Placeholder
                    Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: SizedBox(
                        height: 120,
                        child: Center(child: Text('Chart Placeholder')),
                      ),
                    ),
                    const SizedBox(height: 16),
                        
                    // Navigation Button Bar
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(navLabels.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: NavButton(
                            label: navLabels[index],
                            selected: selectedIndex == index,
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                              // Add navigation logic here
                            },
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
