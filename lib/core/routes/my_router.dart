import 'package:flutter/material.dart';
import 'package:tascom/core/routes/my_routes.dart';

class MyRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MyRoutes.onboarding:
        return MaterialPageRoute(
          builder: (context) =>
              const Scaffold(body: Center(child: Text('Onboarding Screen'))),
        );

      default:
        return null;
    }
  }
}
