import 'package:admin_web_portal/bloc/authentication/authentication_bloc.dart';
import 'package:admin_web_portal/bloc/authentication/authentication_state.dart';
import 'package:admin_web_portal/responsive.dart';
import 'package:admin_web_portal/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Header extends StatelessWidget {
  const Header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: secondaryColor,
      padding: EdgeInsets.all(defaultPadding / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (!Responsive.isDesktop(context))
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
            ),
          if (!Responsive.isMobile(context))
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Row(
                children: [
                  CircleAvatar(),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Logo',
                    style: Theme.of(context).textTheme.headline3,
                  )
                ],
              ),
            ),
          if (!Responsive.isMobile(context)) SearchField(),
          //Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: Row(
              children: [
                IconButton(onPressed: () {}, splashColor: selectedColor ,icon: Icon(Icons.notifications_outlined,)),
                ProfileCard()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationLoadSuccess) {
            return Row(
              children: [
                CircleAvatar(child: Text(state.profile.name.substring(0,1).toUpperCase())),
                SizedBox(width: 10,),
                Text(state.profile.name)
              ],
            );
          } else {
            return SizedBox();
          }
        }),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 40,
      child: TextField(
        style: TextStyle(color: Colors.black),
        cursorColor: Colors.black,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(defaultPadding / 2),
          hintText: "Search",
          fillColor: bgColor,
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
