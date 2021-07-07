import 'package:admin_web_portal/bloc/Roles/roles_bloc.dart';
import 'package:admin_web_portal/bloc/Roles/roles_state.dart';
import 'package:admin_web_portal/components/content_header.dart';
import 'package:admin_web_portal/components/widget_table.dart';
import 'package:admin_web_portal/router/routes.dart';
import 'package:admin_web_portal/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RolesPage extends StatelessWidget {
  const RolesPage({Key key}) : super(key: key);

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
                  'Roles',
                  style: Theme.of(context).textTheme.headline1,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(Routes.NEW_ROLE);
                  },
                  child: Text(
                    '+ Add Role',
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
                    searchHintText: "Search Role",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  BlocBuilder<RolesBloc, RolesState>(builder: (context, state) {
                    if (state is RolesLoadSuccess) {
                      final tableRow = state.roles
                          .map((e) => [
                                Text(e.name),
                                Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: e.status == 'ENABLED'
                                          ? Color(0xFFC3FFDB)
                                          : Colors.red.shade300,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      '${e.status.toUpperCase().substring(0,1)}${e.status.toLowerCase().substring(1)}',
                                    )),
                                Text(e.iV.toString()),
                                Text(e.createdAt),
                                Text(e.updatedAt)
                              ])
                          .toList();
                      print(tableRow);
                      return Container(
                        width: double.infinity,
                        child: WidgetTableWidget(
                          columns: [
                            'Role name',
                            'Status',
                            'No. Of Users',
                            'CreatedAt',
                            'UpdatedAt'
                          ],
                          tableData: tableRow,
                        ),
                      );
                    } else if (state is RolesLoadInProgress) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is RolesLoadFailure) {
                      return Text('Something went wrong');
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
