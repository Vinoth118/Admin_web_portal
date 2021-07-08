import 'package:admin_web_portal/models/role/create_role.dart';
import 'package:admin_web_portal/models/role/role.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

abstract class RolesRepositoryI {
  Future<List<Role>> getAllRoles();
  Future<bool> createRole(CreateRole role);
}
class RolesRepository implements RolesRepositoryI {
  final Dio client;
  RolesRepository(this.client);

  Future<List<Role>> getAllRoles() async {
    try {
      final response = await this.client.get('/auth/role');
      /*final response = {
        "success": true,
        "data": [
          {
            "status": "DISABLED",
            "_id": "60e1b76d7642f02a9281b4a7",
            "name": "Manager",
            "modules": [
              {
                "privileges": [
                  "READ",
                  "WRITE"
                ],
                "_id": "60de237d3d8a211df37f5542",
                "name": "BLOGS",
                "updatedAt": "2021-07-01T20:20:13.551Z",
                "createdAt": "2021-07-01T20:20:13.551Z"
              },
              {
                "privileges": [
                  "READ",
                  "WRITE",
                  "UPDATE",
                  "DELETE"
                ],
                "_id": "60de237d3d8a211df37f5543",
                "name": "LISTING",
                "updatedAt": "2021-07-01T20:20:13.551Z",
                "createdAt": "2021-07-01T20:20:13.551Z"
              }
            ],
            "createdAt": "2021-07-01T20:18:13.231Z",
            "updatedAt": "2021-07-01T20:20:13.551Z",
            "__v": 0
          },{
            "status": "ENABLED",
            "_id": "12345",
            "name": "Analyst",
            "modules": [
              {
                "privileges": [
                  "READ",
                  "WRITE"
                ],
                "_id": "60de237d3d8a211df37f5",
                "name": "BLOGS",
                "updatedAt": "2021-07-01T20:20:13.551Z",
                "createdAt": "2021-07-01T20:20:13.551Z"
              },
              {
                "privileges": [
                  "READ",
                  "WRITE",
                  "UPDATE",
                  "DELETE"
                ],
                "_id": "60de237d3d8a211df37f5",
                "name": "LISTING",
                "updatedAt": "2021-07-01T20:20:13.551Z",
                "createdAt": "2021-07-01T20:20:13.551Z"
              }
            ],
            "createdAt": "2021-07-01T20:18:13.231Z",
            "updatedAt": "2021-07-01T20:20:13.551Z",
            "__v": 0
          }
        ]
      };*/
      if (response?.data != null && response?.data['success'] == true) {
        return (response?.data['data'] as List)
            .map((e) => Role.fromJson(e))
            .toList();
      } else {
        return null;
      }
    } catch (e) {}

  }


  Future<bool> createRole(CreateRole role) async {
    try {
      final response =
      await this.client.post('/auth/role', data: role.toJson());
      if (response?.data != null && response?.data['success'] == true) {
        print("Role Created");
        return response?.data['success'];
      } else if (response?.data != null && response?.data['success'] == false) {
        if (response?.data['statusCode'] != null) {
          final String msg =
          response?.data['statusCode'] == "RECORD_ALREADY_EXISTS"
              ? "Someone Already Registered with your Email"
              : response?.data['statusCode'];
          Fluttertoast.showToast(msg: msg);
        }
      }
    } catch (e) {}
    return false;
  }
}