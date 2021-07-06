import 'package:admin_web_portal/components/bloc/side_menu/side_menu_bloc.dart';
import 'package:admin_web_portal/components/bloc/side_menu/side_menu_event.dart';
import 'package:admin_web_portal/components/bloc/side_menu/side_menu_state.dart';
import 'package:admin_web_portal/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:admin_web_portal/router/navigator_service.dart';
import 'package:admin_web_portal/router/routes.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SideMenuBloc>(
      create: (context) => SideMenuBloc(SideMenuInitial()),
      child: Drawer(
        elevation: 0,
        child: SingleChildScrollView(
          child: BlocBuilder<SideMenuBloc, SideMenuState>(
            builder: (context, state) {
              if (state is SideMenuLoadSuccess) {
                return Column(children: [
                  SizedBox(
                    height: 30,
                  ),
                  DrawerListTile(
                    color: state.option[0].isSelected? true : false,
                    title: "Dashboard",
                    icon: Icons.dashboard,
                    press: () {
                      RepositoryProvider.of<NavigatorService>(context)
                          .navigateTo(
                        Routes.HOME_PAGE,
                      );
                      BlocProvider.of<SideMenuBloc>(context)
                          .add(OptionSelected(true, 'dashboard'));
                    },
                  ),
                  DrawerListTile(
                    color: state.option[1].isSelected? true : false,
                    title: "Roles",
                    icon: Icons.accessibility,
                    press: () {
                      RepositoryProvider.of<NavigatorService>(context)
                          .navigateTo(Routes.ROLES_PAGE);
                      BlocProvider.of<SideMenuBloc>(context)
                          .add(OptionSelected(true, 'roles'));
                    },
                  ),
                  DrawerListTile(
                    color: state.option[2].isSelected? true : false,
                    title: "Admin",
                    icon: Icons.admin_panel_settings,
                    press: () {
                      RepositoryProvider.of<NavigatorService>(context)
                          .navigateTo(Routes.ADMIN_PAGE);
                      BlocProvider.of<SideMenuBloc>(context)
                          .add(OptionSelected(true, 'admin'));
                    },
                  ),
                ]);
              } else if (state is SideMenuInitial) {
                return Column(children: [
                  SizedBox(
                    height: 30,
                  ),
                  DrawerListTile(
                    color: true,
                    title: "Dashboard",
                    icon: Icons.dashboard,
                    press: () {
                      RepositoryProvider.of<NavigatorService>(context)
                          .navigateTo(
                        Routes.HOME_PAGE,
                      );
                      BlocProvider.of<SideMenuBloc>(context)
                          .add(OptionSelected(true, 'dashboard'));
                    },
                  ),
                  DrawerListTile(
                    title: "Roles",
                    icon: Icons.accessibility,
                    press: () {
                      RepositoryProvider.of<NavigatorService>(context)
                          .navigateTo(Routes.ROLES_PAGE);
                      BlocProvider.of<SideMenuBloc>(context)
                          .add(OptionSelected(true, 'roles'));
                    },
                  ),
                  DrawerListTile(
                    title: "Admin",
                    icon: Icons.admin_panel_settings,
                    press: () {
                      RepositoryProvider.of<NavigatorService>(context)
                          .navigateTo(Routes.ADMIN_PAGE);
                      BlocProvider.of<SideMenuBloc>(context)
                          .add(OptionSelected(true, 'admin'));
                    },
                  ),
                ]);
              }
              return SizedBox();
            },
          ),
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key key,
    this.color = false,
    @required this.title,
    @required this.press,
    this.icon,
  }) : super(key: key);

  final String title;
  final VoidCallback press;
  final IconData icon;
  final bool color;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: Container(
        width: 60,
        height: 40,
        decoration: BoxDecoration(
          color: color ? Color(0xFFFFF1F6) : null,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
        ),
        child: Icon(
          icon,
          size: 20,
          color: color ? selectedColor : bodyColor,
        ),
      ),
      title: Row(children: [
        SizedBox(
          width: 20,
        ),
        Text(
          title,
          style: TextStyle(color: color ? selectedColor : bodyColor, fontWeight: FontWeight.bold),
        ),
      ]),
    );
  }
}
