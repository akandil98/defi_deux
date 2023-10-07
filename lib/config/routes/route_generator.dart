import 'package:defi_deux/config/routes/routes.dart';
import 'package:defi_deux/core/utils/utils.dart';
import 'package:defi_deux/features/post_details/presentation/screens/post_details_screen.dart';
import 'package:defi_deux/features/splash/presentation/splash/splash_screen.dart';
import 'package:flutter/material.dart';

final class RouteGenerator {
  RouteGenerator._();
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
// ignore: unused_local_variable
    final args = routeSettings.arguments;
    switch (routeSettings.name) {
      case AppRoutes.initialRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SplashScreen(),
        );

      case AppRoutes.postDetailsScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const PostDetailsScreen(),
        );

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(
          child: Text(
            AppStrings.undefinedRoute,
          ),
        ),
      ),
    );
  }
}
