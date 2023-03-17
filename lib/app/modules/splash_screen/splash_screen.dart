import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pennywise_app/app/modules/login/login_view.dart';
import 'package:pennywise_app/app/routes/route_names.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashIconSize: 120,
      splash: "assets/images/splashscreen.png",
      nextScreen: const LoginView(),
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
