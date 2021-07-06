import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:admin_web_portal/bloc/Roles/roles_bloc.dart';
import 'package:admin_web_portal/bloc/Roles/roles_state.dart';
import 'package:admin_web_portal/bloc/admin/admin_bloc.dart';
import 'package:admin_web_portal/bloc/admin/admin_event.dart';
import 'package:admin_web_portal/bloc/admin/admin_state.dart';
import 'package:admin_web_portal/components/input.dart';
import 'package:admin_web_portal/components/scroll_bar.dart';
import 'package:admin_web_portal/models/admin.dart';
import 'package:admin_web_portal/models/role.dart';

class NewAdmin extends StatefulWidget {
  const NewAdmin({Key key}) : super(key: key);

  @override
  _NewAdminState createState() => _NewAdminState();
}

class _NewAdminState extends State<NewAdmin> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _retypePassword = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var _currentItem = '';
  Admin _admin;

  @override
  void initState() {
    _admin = Admin.defaultInstance();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminBloc, AdminState>(
      builder: (context, state) {
        if(state is AdminLoadSuccess) {
          if(state.selectedRole == null) {
            return SizedBox();
          }
          return XWebScrollBar(
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: FractionallySizedBox(
                    widthFactor: 0.7,
                    child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text('Add New Admin',
                                style: Theme.of(context).textTheme.headline2),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Text('Name',
                                  style: Theme.of(context).textTheme.headline3),
                              SizedBox(
                                width: 200,
                              ),
                              Expanded(
                                child: XInput(
                                  requiredField: true,
                                  controller: _name,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(children: [
                            Text('Role Name',
                                style: Theme.of(context).textTheme.headline3),
                            SizedBox(
                              width: 155,
                            ),
                            BlocBuilder<RolesBloc, RolesState>(
                              builder: (context, rolesState) {
                                if(rolesState is RolesLoadSuccess) {
                                  return DropdownButton<String>(
                                    icon: const Icon(Icons.arrow_downward),
                                    iconSize: 24,
                                    elevation: 16,
                                    underline: Container(
                                      height: 2,
                                      color: Colors.deepPurpleAccent,
                                    ),
                                    onChanged: (newItem){
                                      BlocProvider.of<AdminBloc>(context).add(AdminRoleChanged(newItem));
                                    },
                                    items: rolesState.roles.map<DropdownMenuItem<String>>((Role roles) {
                                      return DropdownMenuItem<String>(
                                        value: roles.sId,
                                        child: Text(roles.name),
                                      );
                                    }).toList(),
                                    value: state.selectedRole.role.name,
                                  );
                                } else {
                                  return SizedBox();
                                }
                              },
                            ),
                          ]),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Text('Email',
                                  style: Theme.of(context).textTheme.headline3),
                              SizedBox(
                                width: 205,
                              ),
                              Expanded(
                                child: XInput(
                                  requiredField: true,
                                  controller: _email,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Text('Phone',
                                  style: Theme.of(context).textTheme.headline3),
                              SizedBox(
                                width: 195,
                              ),
                              Expanded(
                                child: XInput(
                                  requiredField: true,
                                  controller: _phone,
                                  digitsOnly: true,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Text('Password',
                                  style: Theme.of(context).textTheme.headline3),
                              SizedBox(
                                width: 160,
                              ),
                              Expanded(
                                child: XInput(
                                  requiredField: true,
                                  controller: _password,
                                  obscureText: true,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Text('Retype Password',
                                  style: Theme.of(context).textTheme.headline3),
                              SizedBox(
                                width: 85,
                              ),
                              Expanded(
                                child: XInput(
                                  requiredField: true,
                                  controller: _retypePassword,
                                  obscureText: true,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Center(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 40,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(context);
                                    },
                                    child: Text(
                                      'Cancel',
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Container(
                                  height: 40,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (_formKey.currentState.validate()) {
                                        if (_password.text == _retypePassword.text) {
                                          _admin.name = _name.text.toString();
                                          _admin.email = _email.text.toString();
                                          //_admin.role = Roles(name: _currentItem);
                                          _admin.phone = _phone.text.toString();
                                          //_admin.password = _password.text.toString();
                                        } else {
                                          Fluttertoast.showToast(
                                              msg: 'Enter correct password');
                                        }
                                      } else {
                                        Fluttertoast.showToast(
                                            msg: 'Please fill the form');
                                      }
                                    },
                                    child: Text(
                                      'Save',
                                    ),
                                  ),
                                ),
                              ],
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
        } else {
         return SizedBox();
        }
      },
    );
  }
}
