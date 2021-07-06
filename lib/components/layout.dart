import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:admin_web_portal/components/header.dart';
import 'package:admin_web_portal/components/side_menu.dart';
import 'package:admin_web_portal/responsive.dart';
import 'package:admin_web_portal/router/navigator_service.dart';
import 'package:admin_web_portal/router/routes.dart';
import 'package:admin_web_portal/utils/constants.dart';

class LayoutTemplate extends StatelessWidget {
  LayoutTemplate({Key key, this.child}) : super(key: key);

  final Widget child;
  final Routes routes = Routes();

  @override
  Widget build(BuildContext context) {
    final navigatorService = RepositoryProvider.of<NavigatorService>(context);

    return Scaffold(
      drawer: SideMenu(),
      body: SafeArea(
        child: Column(
          children: [
            Header(),
            SizedBox(height: 3,),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (Responsive.isDesktop(context))
                    Expanded(
                      child: SideMenu(),
                    ),
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: EdgeInsets.all(defaultPadding),
                      child: Column(
                        children: [
                          Expanded(
                            child: Navigator(
                              key: navigatorService.navigatorKey,
                              onGenerateRoute: routes.generateRoute,
                              initialRoute: Routes.HOME_PAGE,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
