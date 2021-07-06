import 'package:admin_web_portal/router/routes.dart';
import 'package:flutter/material.dart';

class NavigatorService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  String currentRoute = Routes.LOGIN_PAGE;

  Future<dynamic> navigateTo(String routeName) {
    this.currentRoute = routeName;
    return navigatorKey.currentState.pushNamed(routeName);
  }

  void goBack() {
    return navigatorKey.currentState.pop();
  }
}
