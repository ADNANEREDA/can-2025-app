// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'core/constants.dart';
import 'screens/onboarding_screen.dart';

void main() {
  runApp(const MyCANApp());
}
class MyCANApp extends StatelessWidget {
  const MyCANApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CAN 2025 Mobile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kMarocDark,
        primaryColor: kMarocRed,
        colorScheme: const ColorScheme.dark(
          primary: kMarocRed,
          secondary: kMarocGreen,
          surface: kMarocDark,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage("assets/images/spalsh_image.png"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(
                    0.3, 
                  ),
                  BlendMode.darken,
                ),
              ),
            ),
          )
              .animate() 
              .scale(
                begin: const Offset(1.1, 1.1),
                end: const Offset(1.0, 1.0),
                duration: 3.seconds,
                curve: Curves.easeOut,
              ), 
          
         
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24.0, 60.0, 24.0, 60.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end, 
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                   Text(
                     " AFCON 2025 Morocco! ",
                     textAlign: TextAlign.center,
                     style: TextStyle(
                       color: const Color(0xFFFFD700), 
                       fontSize: 20, 
                       fontWeight: FontWeight.bold,
                       letterSpacing: 1.2,
                       shadows: [
                         Shadow(
                           blurRadius: 10, 
                           color: Colors.black.withOpacity(0.8), 
                           offset: const Offset(0, 2)
                         )
                       ],
                     ),
                   ).animate().fade(delay: 800.ms, duration: 600.ms),

                   const SizedBox(height: 16),
                   Text(
                     "YOUR GUIDE IS READY.",
                     textAlign: TextAlign.center,
                     style: TextStyle(
                       color: Colors.white.withOpacity(0.9),
                       fontSize: 16,
                       fontWeight: FontWeight.w600,
                       letterSpacing: 1.5,
                     ),
                   ).animate().fade(delay: 1000.ms, duration: 600.ms),
    
                   const SizedBox(height: 30),
                   Container(
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(50),
                       gradient: const LinearGradient(
                         begin: Alignment.topLeft,
                         end: Alignment.bottomRight,
                         colors: [
                           Color(0xFFE52D36), 
                           Color(0xFF8A0006), 
                         ],
                       ),
                       boxShadow: [
                         BoxShadow(
                           color: const Color(0xFFE52D36).withOpacity(0.5),
                           blurRadius: 20,
                           offset: const Offset(0, 5),
                           spreadRadius: 2,
                         ),
                       ],
                     ),
                     child: ElevatedButton(
                        onPressed: () {
                          // Navigation vers OnboardingScreen
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (c, a1, a2) => const OnboardingScreen(),
                              transitionsBuilder: (c, a1, a2, child) =>
                                  FadeTransition(opacity: a1, child: child),
                              transitionDuration: const Duration(
                                milliseconds: 800,
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent, 
                          shadowColor: Colors.transparent,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40.0,
                            vertical: 18.0,
                          ),
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                        // Contenu du bouton avec Icône
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text(
                              "Let's go!",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w800, 
                                letterSpacing: 1.0,
                              ),
                            ),
                            SizedBox(width: 10),
                            Icon(Icons.sports_soccer, size: 26, color: Colors.white),
                          ],
                        ),
                      ),
                   )
                   .animate() // Animation du bouton
                   .fade(delay: 1200.ms, duration: 600.ms)
                   .scale(
                     begin: const Offset(0.8, 0.8),
                     end: const Offset(1.0, 1.0),
                     delay: 1200.ms,
                     duration: 600.ms,
                     curve: Curves.elasticOut,
                   ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}