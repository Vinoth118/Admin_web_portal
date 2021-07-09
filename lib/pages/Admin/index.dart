import 'package:admin_web_portal/bloc/admin/admin_bloc.dart';
import 'package:admin_web_portal/bloc/admin/admin_state.dart';
import 'package:admin_web_portal/components/content_header.dart';
import 'package:admin_web_portal/components/table.dart';
import 'package:admin_web_portal/components/widget_table.dart';
import 'package:admin_web_portal/router/routes.dart';
import 'package:admin_web_portal/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Admins',
                  style: Theme.of(context).textTheme.headline1,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(Routes.NEW_ADMIN);
                  },
                  child: Text(
                    '+ Add Admin',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              color: secondaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  side: BorderSide(width: 1, color: Colors.grey.shade400)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  XContentHeader(
                    filterAndSort: true,
                    searchHintText: "Search Admin",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  BlocBuilder<AdminBloc, AdminState>(builder: (context, state) {
                    if (state is AdminLoadSuccess) {
                      final tableRow = state.admin
                          .map((e) => [
                                Text(e.name),
                                Text(e.email),
                                Text(e.phone),
                                Container(
                                  padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: e.status == 'ENABLED'? Color(0xFFC3FFDB) : Colors.red,
                                        borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text('${e.status.toUpperCase().substring(0,1)}${e.status.toLowerCase().substring(1)}')),
                                    Text(e.createdAt)
                              ])
                          .toList();
                      //print(tableRow);
                      return Container(
                        width: double.infinity,
                        child: WidgetTableWidget(
                          columns: [
                            'Account Name',
                            'Email',
                            'Phone',
                            'Status',
                            'Created At'
                          ],
                          tableData: tableRow,
                        ),
                      );
                    } else if (state is AdminLoadInProgress) {
                      return Center(child: Column(
                        children: [
                          SizedBox(height: 50,),
                          CircularProgressIndicator(
                            color: buttonColor,
                          ),
                          SizedBox(height: 50,)
                        ],
                      ));
                    } else if (state is AdminLoadFailure) {
                      return Column(
                          children: [
                            SizedBox(height: 50,),
                            Text('Something went wrong'),
                            SizedBox(height: 50,),
                          ]);
                    } else {
                      return SizedBox();
                    }
                  })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
