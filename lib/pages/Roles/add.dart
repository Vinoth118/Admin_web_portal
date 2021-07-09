import 'package:admin_web_portal/bloc/roles/roles_bloc.dart';
import 'package:admin_web_portal/bloc/roles/roles_event.dart';
import 'package:admin_web_portal/components/input.dart';
import 'package:admin_web_portal/components/scroll_bar.dart';
import 'package:admin_web_portal/components/widget_table.dart';
import 'package:admin_web_portal/models/role/create_role.dart';
import 'package:admin_web_portal/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Permissions {
  bool all;
  bool read;
  bool write;
  bool update;
  bool delete;

  Permissions({this.all, this.read, this.write, this.update, this.delete});

}

class NewRole extends StatefulWidget {
  const NewRole({Key key}) : super(key: key);

  @override
  _NewRoleState createState() => _NewRoleState();
}

class _NewRoleState extends State<NewRole> {
  final TextEditingController _name = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  CreateRole _role;
  Permissions listing = Permissions(all: true, read: true, write: true, update: true, delete: true);
  Permissions banners = Permissions(all: true, read: true, write: true, update: true, delete: true);
  Permissions promote = Permissions(all: true, read: true,  write: true, update: true, delete: true);
  Permissions settings = Permissions(all: true, read: true, write: true, update: true, delete: true);
  Permissions users = Permissions(all: true, read: true, write: true, update: true, delete: true);
  Permissions blog = Permissions(all: true, read: true, write: true, update: true, delete: true);


  @override
  void initState() {
    _role = CreateRole();
    super.initState();
  }

  void all(Permissions module) {
    if(module.all) {
      module.read = true;
      module.write = true;
      module.update = true;
      module.delete = true;
    } else {
      module.read = false;
      module.write = false;
      module.update = false;
      module.delete = false;
    }
  }

  void specific(Permissions module, String type) {
    if(type == 'write') {
      if (module.write == false) {
        module.all = false;
      } else
      if (module.write && module.read && module.update && module.delete) {
        module.all = true;
      }
    } else if(type == 'read') {
      if (module.read == false) {
        module.all = false;
      } else
      if (module.write && module.read && module.update && module.delete) {
        module.all = true;
      }
    } else if(type == 'update') {
      if (module.update == false) {
        module.all = false;
      } else
      if (module.write && module.read && module.update && module.delete) {
        module.all = true;
      }
    } else if(type == 'delete') {
      if (module.delete == false) {
        module.all = false;
      } else
      if (module.write && module.read && module.update && module.delete) {
        module.all = true;
      }
    }
  }

  RoleModules createModule(String moduleName, Permissions module) {
    return RoleModules(name: moduleName, privileges: [
      if(module.read) "READ",
      if(module.write) "WRITE",
      if(module.update) "UPDATE",
      if(module.delete) "DELETE"
    ]);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> Listings = [
      Text('Listings'),
      Checkbox(value: listing.all, onChanged: (val){
        setState(() {
          listing.all = val;
          all(listing);
        });
      }),
      Checkbox(value: listing.read, onChanged: (val){
        setState(() {
          listing.read = val;
          specific(listing, 'read');
        });
      }),
      Checkbox(value: listing.write, onChanged: (val){
        setState(() {
          listing.write = val;
          specific(listing, 'write');
        });
      }),
      Checkbox(value: listing.update, onChanged: (val){
        setState(() {
          listing.update = val;
          specific(listing, 'update');
        });
      }),
      Checkbox(value: listing.delete, onChanged: (val){
        setState(() {
          listing.delete = val;
          specific(listing, 'delete');
        });
      }),
    ];
    List<Widget> Banners = [
      Text('Banners'),
      Checkbox(value: banners.all, onChanged: (val){
        setState(() {
          banners.all = val;
          all(banners);
        });
      }),
      Checkbox(value: banners.read, onChanged: (val){
        setState(() {
          banners.read = val;
          specific(banners, 'read');
        });
      }),
      Checkbox(value: banners.write, onChanged: (val){
        setState(() {
          banners.write = val;
          specific(banners, 'write');
        });
      }),
      Checkbox(value: banners.update, onChanged: (val){
        setState(() {
          banners.update = val;
          specific(banners, 'update');
        });
      }),
      Checkbox(value: banners.delete, onChanged: (val){
        setState(() {
          banners.delete = val;
          specific(banners, 'delete');
        });
      }),
    ];
    List<Widget> Promote = [
      Text('Promote'),
      Checkbox(value: promote.all, onChanged: (val){
        setState(() {
          promote.all = val;
          all(promote);
        });
      }),
      Checkbox(value: promote.read, onChanged: (val){
        setState(() {
          promote.read = val;
          specific(promote, 'read');
        });
      }),
      Checkbox(value: promote.write, onChanged: (val){
        setState(() {
          promote.write = val;
          specific(promote, 'write');
        });
      }),
      Checkbox(value: promote.update, onChanged: (val){
        setState(() {
          promote.update = val;
          specific(promote, 'update');
        });
      }),
      Checkbox(value: promote.delete, onChanged: (val){
        setState(() {
          promote.delete = val;
          specific(promote, 'delete');
        });
      }),
    ];
    List<Widget> Settings = [
      Text('Settings'),
      Checkbox(value: settings.all, onChanged: (val){
        setState(() {
          setState(() {
            settings.all = val;
            all(settings);
          });
        });
      }),
      Checkbox(value: settings.read, onChanged: (val){
        setState(() {
          settings.read = val;
          specific(settings, 'read');
        });
      }),
      Checkbox(value: settings.write, onChanged: (val){
        setState(() {
          settings.write = val;
          specific(settings, 'write');
        });
      }),
      Checkbox(value: settings.update, onChanged: (val){
        setState(() {
          settings.update = val;
          specific(settings, 'update');
        });
      }),
      Checkbox(value: settings.delete, onChanged: (val){
        setState(() {
          settings.delete = val;
          specific(settings, 'delete');
        });
      }),
    ];
    List<Widget> Users = [
      Text('Users'),
      Checkbox(value: users.all, onChanged: (val){
        setState(() {
          users.all = val;
          all(users);
        });
      }),
      Checkbox(value: users.read, onChanged: (val){
        setState(() {
          users.read = val;
          specific(users, 'read');
        });
      }),
      Checkbox(value: users.write, onChanged: (val){
        setState(() {
          users.write = val;
          specific(users, 'write');
        });
      }),
      Checkbox(value: users.update, onChanged: (val){
        setState(() {
          users.update = val;
          specific(users, 'update');
        });
      }),
      Checkbox(value: users.delete, onChanged: (val){
        setState(() {
          users.delete = val;
          specific(users, 'delete');
        });
      }),
    ];
    List<Widget> Blogs = [
      Text('Blogs'),
      Checkbox(value: blog.all, onChanged: (val){
        setState(() {
          setState(() {
            blog.all = val;
            all(blog);
          });
        });
      }),
      Checkbox(value: blog.read, onChanged: (val){
        setState(() {
          blog.read = val;
          specific(blog, 'read');
        });
      }),
      Checkbox(value: blog.write, onChanged: (val){
        setState(() {
          blog.write = val;
          specific(blog, 'write');
        });
      }),
      Checkbox(value: blog.update, onChanged: (val){
        setState(() {
          blog.update = val;
          specific(blog, 'update');
        });
      }),
      Checkbox(value: blog.delete, onChanged: (val){
        setState(() {
          blog.delete = val;
          specific(blog, 'delete');
        });
      }),
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
                              columns: ['Modules', 'All', 'Read', 'Write', 'Update', 'Delete'],
                              tableData: [Blogs, Listings],
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
                          _role.name = _name.text.toString();
                          _role.modules = [
                            if(blog.write || blog.read || blog.update || blog.delete)
                                createModule("BLOGS", blog),
                            if(listing.write || listing.read || listing.update || listing.delete)
                              createModule('LISTING', listing),
                            /*if(banners.write || banners.read || banners.update || banners.delete)
                              createModule('BANNERS', banners),
                            if(promote.write || promote.read || promote.update || promote.delete)
                              createModule('PROMOTE', promote),
                            if(settings.write || settings.read || settings.update || settings.delete)
                              createModule('SETTINGS', settings),
                            if(users.write || users.read || users.update || users.delete)
                              createModule('USERS', users)*/
                          ];
                          BlocProvider.of<RolesBloc>(context).add(RoleCreated(_role));
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
