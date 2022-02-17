import 'package:flutter_oauth_example/constants/route_name.dart';
import 'package:flutter_oauth_example/ui/views/login_view.dart';
import 'package:flutter_oauth_example/ui/views/home_view.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginViewRoute:
      return _pageRoute(
        routeName: LoginViewRoute,
        viewToShow: LoginView(),
      );
    case HomeViewRoute:
      return _pageRoute(
        routeName: HomeViewRoute,
        viewToShow: HomeView(),
      );

    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text(
              'No route defined for ${settings.name}',
            ),
          ),
        ),
      );
  }
}

PageRoute _pageRoute({required String routeName, required Widget viewToShow}) {
  return MaterialPageRoute(
    settings: RouteSettings(
      name: routeName,
    ),
    builder: (_) => viewToShow,
  );
}