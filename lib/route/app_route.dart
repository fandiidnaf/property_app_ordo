import 'package:flutter/material.dart';
import 'package:property_app/core/bottom_navbar/widget/bottom_navbar_widget.dart';
import 'package:property_app/features/property/presentation/screens/property_screen.dart';
import 'package:property_app/route/route_name.dart';

class AppRoute {
  static Route? onGenerateRoute(RouteSettings settings) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        switch (settings.name) {
          case RouteName.HOME:
            return const PropertyScreen();
          case RouteName.BUILDING:
            return const DefaultScreen('Building');
          case RouteName.DOCUMENT:
            return const DefaultScreen('Document');
          case RouteName.CART:
            return const DefaultScreen('Cart');
          case RouteName.USER:
            return const DefaultScreen('User');
          default:
            return const Placeholder();
        }
      },
      settings: settings,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
    );
  }
}

class DefaultScreen extends StatelessWidget {
  const DefaultScreen(this.pageName, {super.key});

  final String pageName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(pageName),
      ),
      bottomNavigationBar: const BottomNavbarWidget(),
    );
  }
}
