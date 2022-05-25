import 'package:flutter/material.dart';

class NavigationService {
  static final NavigationService _instace = NavigationService._instace;
  static NavigationService get instace => _instace;
  NavigationService.init();

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(Widget routeName) {
    return navigatorKey.currentState!.push(
      MaterialPageRoute(builder: (context) => routeName),
    );
  }
}
