import 'package:admin_web_portal/bloc/admin/admin_bloc.dart';
import 'package:admin_web_portal/bloc/admin/admin_state.dart';
import 'package:admin_web_portal/components/search_bar.dart';
import 'package:admin_web_portal/components/table.dart';
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
                Text('Admins',style: Theme.of(context).textTheme.headline1,),
                ElevatedButton(onPressed: (){
                  Navigator.of(context).pushNamed(Routes.NEW_ADMIN);
                }, child: Text('+ Add Admin',style: TextStyle(color: Colors.white),),)
              ],
            ),
            SizedBox(height: 20,),
            Card(
              color: secondaryColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)),side: BorderSide(width: 1,color: Colors.grey.shade400)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 20,),
                      XSearchBar(),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  BlocBuilder<AdminBloc, AdminState>(builder: (context, state) {
                    if (state is AdminLoadSuccess) {
                      final tableRow =
                      state.admin.map((e) => [e.name, e.email, e.phone,e.status, e.createdAt]).toList();
                      //print(tableRow);
                      return Container(
                        width: double.infinity,
                        child: TableWidget(
                          columns: ['Account Name', 'Email', 'Phone','Status', 'Created At'],
                          tableData: tableRow,
                        ),
                      );
                    } else if (state is AdminLoadInProgress) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is AdminLoadFailure) {
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