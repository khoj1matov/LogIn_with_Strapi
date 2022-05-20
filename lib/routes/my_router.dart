import 'package:flutter/material.dart';
import 'package:loginstrapi/views/home/home_view.dart';

class MyRoutes {
  static final MyRoutes _instace = MyRoutes.init();
  static MyRoutes get instance => _instace;
  MyRoutes.init();

  Route? onGenerateRoute(RouteSettings s) {
    var args = s.arguments;

    switch (s.name) {
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomeView());
    }
  }
}
