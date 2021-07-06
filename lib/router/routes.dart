import 'package:admin_web_portal/components/layout.dart';
import 'package:admin_web_portal/pages/Admin/add.dart';
import 'package:admin_web_portal/pages/Admin/index.dart';
import 'package:admin_web_portal/pages/Roles/add.dart';
import 'package:admin_web_portal/pages/Roles/index.dart';
import 'package:admin_web_portal/pages/home_page.dart';
import 'package:admin_web_portal/pages/login_page.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String LOGIN_PAGE = '/';
  static const String HOME_PAGE = '/home';
  static const String ORGANINISATIONS_PAGE = '/organisations';
  static const String ORGANINISATION_DETAIL_PAGE = '/organisation_detail';
  static const String PLANS_PAGE = '/plans';
  static const String CREATE_PLAN = '/create_plan';
  static const String DASHBOARD_PAGE = '/dashboard';
  static const String ROLES_PAGE = '/roles';
  static const String NEW_ROLE = '/new_role';
  static const String ADMIN_PAGE = '/admin';
  static const String NEW_ADMIN = '/new_admin';


  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LOGIN_PAGE:
        return _getRoute(LoginPage(), settings);
        break;
      case DASHBOARD_PAGE:
        return _getRoute(LayoutTemplate(), settings);
        break;
      case HOME_PAGE:
        return _getRoute(HomePage(), settings);
        break;
      case ROLES_PAGE:
        return _getRoute(RolesPage(), settings);
        break;
      case NEW_ROLE:
        return _getRoute(NewRole(), settings);
        break;
      case ADMIN_PAGE:
        return _getRoute(AdminPage(), settings);
        break;
      case NEW_ADMIN:
        return _getRoute(NewAdmin(), settings);
        break;
    }
  }

  Route<dynamic> _getRoute<T extends Widget>(T widget, RouteSettings settings) {
    return MaterialPageRoute<BuildContext>(
        settings: settings, builder: (BuildContext context) => widget);
  }
}
