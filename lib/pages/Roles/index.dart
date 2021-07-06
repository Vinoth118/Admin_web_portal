import 'package:admin_web_portal/bloc/Roles/roles_bloc.dart';
import 'package:admin_web_portal/bloc/Roles/roles_state.dart';
import 'package:admin_web_portal/components/search_bar.dart';
import 'package:admin_web_portal/components/table.dart';
import 'package:admin_web_portal/router/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class RolesPage extends StatelessWidget {
  const RolesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('View Roles', style: TextStyle(fontSize: 25),),
            XSearchBar(),
            Container(
              height: 40,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(Routes.NEW_ROLE);
                },
                child: Text('Add New Role'),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        BlocBuilder<RolesBloc, RolesState>(builder: (context, state) {
          if (state is RolesLoadSuccess) {
            final tableRow =
            state.roles.map((e) => [e.name, e.status]).toList();
            print(tableRow);
            return Container(
              width: double.infinity,
              child: TableWidget(
                columns: ['Role name', 'Status'],
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
    );
  }
}
