import 'package:defi_deux/config/routes/routes.dart';
import 'package:defi_deux/core/utils/utils.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _gotToLandingScreen();
  }

  void _gotToLandingScreen() async {
    await Future.delayed(
      const Duration(seconds: AppConstants.splashDelay),
      () => _goToLogin(),
    );
  }

  void _goToLogin() {
    AppNavigator.navigateNamedReplace(
      context,
      AppRoutes.postDetailsScreen,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(AppStrings.helloWorld),
      ),
    );
  }
}
