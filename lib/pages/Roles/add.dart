import 'package:admin_web_portal/components/input.dart';
import 'package:admin_web_portal/components/scroll_bar.dart';
import 'package:admin_web_portal/components/widget_table.dart';
import 'package:flutter/material.dart';

class NewRole extends StatefulWidget {
  const NewRole({Key key}) : super(key: key);

  @override
  _NewRoleState createState() => _NewRoleState();
}

class _NewRoleState extends State<NewRole> {
  final TextEditingController _name = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool value = false;
  final _status = ['ENABLED', 'DISABLED'];
  var _currentItem = 'ENABLED';

  @override
  Widget build(BuildContext context) {
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
                      child: Text('Add New Role',
                          style: Theme.of(context).textTheme.headline2),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text('Role Name',
                            style: Theme.of(context).textTheme.headline3),
                        SizedBox(
                          width: 30,
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
                    Row(
                      children: [
                        Text('Status',
                            style: Theme.of(context).textTheme.headline3),
                        SizedBox(
                          width: 80,
                        ),
                        DropdownButton<String>(
                          items: _status.map((String dropDownStringItem) {
                            return DropdownMenuItem<String>(
                              value: dropDownStringItem,
                              child: Text(dropDownStringItem),
                            );
                          }).toList(),
                          onChanged: (String newValueSelected) {
                            setState(() {
                              this._currentItem = newValueSelected;
                            });
                          },
                          value: _currentItem,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text('Permission',
                        style: Theme.of(context).textTheme.headline3),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.all(40),
                      child: Center(
                        child: WidgetTableWidget(
                          columns: ['Module', 'All', 'Read', 'Write', 'Update', 'Delete'],
                          tableData: [],
                        ),
                      ),
                    ),
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
