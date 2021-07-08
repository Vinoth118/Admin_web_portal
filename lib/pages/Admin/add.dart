import 'package:admin_web_portal/components/drop_down_button.dart';
import 'package:admin_web_portal/models/admin/create_admin.dart';
import 'package:admin_web_portal/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:admin_web_portal/bloc/roles/roles_bloc.dart';
import 'package:admin_web_portal/bloc/roles/roles_state.dart';
import 'package:admin_web_portal/bloc/admin/admin_bloc.dart';
import 'package:admin_web_portal/bloc/admin/admin_event.dart';
import 'package:admin_web_portal/components/input.dart';
import 'package:admin_web_portal/components/scroll_bar.dart';
import 'package:admin_web_portal/models/role/role.dart';

class NewAdmin extends StatefulWidget {
  const NewAdmin({Key key}) : super(key: key);

  @override
  _NewAdminState createState() => _NewAdminState();
}

class _NewAdminState extends State<NewAdmin> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _countryCode = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _retypePassword = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  CreateAdmin _admin;
  String currentItem;

  @override
  void initState() {
    _admin = CreateAdmin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return XWebScrollBar(
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Add New Admin',
                            style: Theme.of(context).textTheme.headline4),
                        SizedBox(
                          height: 20,
                        ),
                        XInput(
                          hint: 'Enter Admin Name',
                          requiredField: true,
                          controller: _name,
                          fieldName: 'Admin Name',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        XInput(
                          hint: 'Enter Email',
                          requiredField: true,
                          controller: _email,
                          fieldName: 'Email',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: XInput(
                                hint: 'Enter CountryCode (e.g. 91)',
                                digitsOnly: true,
                                requiredField: true,
                                fieldName: 'Country Code',
                                controller: _countryCode,
                              ),
                            ),
                            SizedBox(width: 20,),
                            Expanded(
                              child: XInput(
                                hint: 'Enter Phone No',
                                digitsOnly: true,
                                requiredField: true,
                                controller: _phone,
                                fieldName: 'Phone',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        XInput(
                          hint: 'Enter Password',
                          requiredField: true,
                          controller: _password,
                          fieldName: 'Password',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        XInput(
                          hint: 'Re-Enter Password',
                          requiredField: true,
                          controller: _retypePassword,
                          fieldName: 'Retype Password',
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Column(children: [
                      SizedBox(height: 70),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width * 0.35,
                        child: Card(
                          elevation: 0,
                          color: secondaryColor,
                          child: BlocBuilder<RolesBloc, RolesState>(
                            builder: (context, rolesState) {
                              if (rolesState is RolesLoadSuccess) {
                                return Container(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Role',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      XDropDownButton(hint: ' e.g. Manager', currentItem: currentItem, list: rolesState.roles, model: Role,),
                                    ],
                                  ),
                                );
                              } else {
                                return SizedBox();
                              }
                            },
                          ),
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.72,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          if (_password.text == _retypePassword.text) {
                            if(currentItem != null) {
                              _admin.name = _name.text.toString();
                              _admin.email = _email.text.toString();
                              _admin.role = currentItem;
                              _admin.countryCode = _countryCode.text.toString();
                              _admin.phone = _phone.text.toString();
                              _admin.password = _password.text.toString();
                              BlocProvider.of<AdminBloc>(context)
                                  .add(AdminCreated(_admin));
                            } else {
                              Fluttertoast.showToast(
                                  msg: 'Please Select Role');
                            }
                          } else {
                            Fluttertoast.showToast(
                                msg: 'Enter correct password');
                          }
                        } else {
                          Fluttertoast.showToast(msg: 'Please fill the form');
                        }
                      },
                      child: Text(
                        'Add Admin',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
