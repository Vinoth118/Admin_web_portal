import 'package:admin_web_portal/bloc/authentication/authentication_bloc.dart';
import 'package:admin_web_portal/bloc/authentication/authentication_event.dart';
import 'package:admin_web_portal/bloc/authentication/authentication_state.dart';
import 'package:admin_web_portal/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameTextController, passwordTextController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    usernameTextController = TextEditingController(text: 'vijay');
    passwordTextController = TextEditingController(text: '12345');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          final currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus && currentFocus.hasFocus) {
            FocusManager.instance.primaryFocus.unfocus();
          }
        },
        child: BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            if (state is AuthenticationLoadSuccess) {
              Navigator.of(context).pushNamed(Routes.DASHBOARD_PAGE);
            }
          },
          child: Container(
            height: double.infinity,
            width: double.infinity,
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.3,
                margin: EdgeInsets.all(100),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 50),
                    Text(
                      'Owner Portal Login',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 40),
                    Form(
                      key: _formKey,
                      child: Container(
                        margin: EdgeInsets.only(left: 40, right: 40),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: usernameTextController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Username',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter valid username';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: passwordTextController,
                              obscureText: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Password',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter password';
                                }
                                return null;
                              },
                            ),
                            Container(
                              height: 40,
                              width: 100,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 30),
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    final username =
                                        usernameTextController.text;
                                    final password =
                                        passwordTextController.text;
                                    BlocProvider.of<AuthenticationBloc>(context)
                                        .add(AuthenticationLoginAttempted(
                                            username, password));
                                  }
                                },
                                child: Text('Login',style: TextStyle(color: Colors.white),),
                              ),
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
