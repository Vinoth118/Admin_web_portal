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
      print(role.toJson().toString());
      final response =
      await this.client.post('/auth/role', data: role.toJson());
      if (response?.data != null && response?.data['success'] == true) {
        print("Role Created");
        return response?.data['success'];
      } else if (response?.data != null && response?.data['success'] == false) {
        if (response?.data['statusCode'] != null) {
          Fluttertoast.showToast(msg: response?.data['statusCode']);
        }
      }
    } catch (e) {}
    return false;
  }
}