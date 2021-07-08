import 'package:admin_web_portal/components/input.dart';
import 'package:admin_web_portal/components/scroll_bar.dart';
import 'package:admin_web_portal/components/widget_table.dart';
import 'package:admin_web_portal/models/role/create_role.dart';
import 'package:admin_web_portal/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NewRole extends StatefulWidget {
  const NewRole({Key key}) : super(key: key);

  @override
  _NewRoleState createState() => _NewRoleState();
}

class _NewRoleState extends State<NewRole> {
  final TextEditingController _name = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  CreateRole _role;
  List<bool> listing = [true, true, true, true, true];
  List<bool> banners = [true, true, true, true, true];
  List<bool> promote = [true, true, true, true, true];
  List<bool> settings = [true, true, true, true, true];
  List<bool> users = [true, true, true, true, true];





  @override
  void initState() {
    _role = CreateRole();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> Listings = [
      Text('Listings'),
      Checkbox(value: listing[0], onChanged: (val){
        setState(() {
          listing[0] = val;
        });
      }),
      Checkbox(value: listing[1], onChanged: (val){
        setState(() {
          listing[1] = val;
        });
      }),
      Checkbox(value: listing[2], onChanged: (val){
        setState(() {
          listing[2] = val;
        });
      }),
      Checkbox(value: listing[3], onChanged: (val){
        setState(() {
          listing[3] = val;
        });
      }),
      Checkbox(value: listing[4], onChanged: (val){
        setState(() {
          listing[4] = val;
        });
      }),
    ];
    List<Widget> Banners = [
      Text('Banners'),
      Checkbox(value: banners[0], onChanged: (val){}, key: Key('BannersAll')),
      Checkbox(value: banners[1], onChanged: (val){}),
      Checkbox(value: banners[2], onChanged: (val){}),
      Checkbox(value: banners[3], onChanged: (val){}),
      Checkbox(value: banners[4], onChanged: (val){}),
    ];
    List<Widget> Promote = [
      Text('Promote'),
      Checkbox(value: promote[0], onChanged: (val){}, key: Key('PromoteAll')),
      Checkbox(value: promote[1], onChanged: (val){}),
      Checkbox(value: promote[2], onChanged: (val){}),
      Checkbox(value: promote[3], onChanged: (val){}),
      Checkbox(value: promote[4], onChanged: (val){}),
    ];
    List<Widget> Settings = [
      Text('Settings'),
      Checkbox(value: settings[0], onChanged: (val){}, key: Key('SettingsAll')),
      Checkbox(value: settings[1], onChanged: (val){}),
      Checkbox(value: settings[2], onChanged: (val){}),
      Checkbox(value: settings[3], onChanged: (val){}),
      Checkbox(value: settings[4], onChanged: (val){}),
    ];
    List<Widget> Users = [
      Text('Users'),
      Checkbox(value: users[0], onChanged: (val){}, key: Key('UsersAll')),
      Checkbox(value: users[1], onChanged: (val){}),
      Checkbox(value: users[2], onChanged: (val){}),
      Checkbox(value: users[3], onChanged: (val){}),
      Checkbox(value: users[4], onChanged: (val){}),
    ];
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
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Add New Role',
                            style: Theme.of(context).textTheme.headline4),
                        SizedBox(
                          height: 20,
                        ),
                        XInput(
                          hint: 'Enter Role Name',
                          requiredField: true,
                          controller: _name,
                          fieldName: 'Role Name',
                        ),
                        SizedBox(height: 20,),
                        Text('Permissions',style: Theme.of(context).textTheme.headline5,),
                        SizedBox(height: 10,),
                        Card(
                          color: secondaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              side: BorderSide(width: 1, color: Colors.grey.shade400)),
                          child: Container(
                            width: double.infinity,
                            child: WidgetTableWidget(
                              rowCheckBox: false,
                              columns: ['Modules', 'All', 'Create', 'Read', 'Update', 'Delete'],
                              tableData: [Listings,Banners,Promote,Settings,Users],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 40, 0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {

                        } else {
                          Fluttertoast.showToast(msg: 'Please fill the form');
                        }
                      },
                      child: Text(
                        'Add Admin',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
