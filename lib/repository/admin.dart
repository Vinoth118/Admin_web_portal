import 'package:admin_web_portal/models/admin.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

abstract class AdminRepositoryI {
  Future<List<Admin>> getAllAdmin();
  Future<bool> createAdmin(Admin admin);
}
class AdminRepository implements AdminRepositoryI {
  final Dio client;
  AdminRepository(this.client);

  Future<List<Admin>> getAllAdmin() async {
    try {
      //final response = await this.client.get('auth/admin');
      final response = {
        "success": true,
        "data": [
          {
            "status": "ENABLED",
            "_id": "60de2311925cde1dd0b21e73",
            "name": "Sathish",
            "email": "example@domain.com",
            "role": {
              "_id": "60de17fea85f191090fbe2d5",
              "name": "Manager"
            },
            "phone": "978801232",
            "createdAt": "2021-07-01T20:18:25.416Z",
            "updatedAt": "2021-07-01T20:18:25.416Z",
            "__v": 0
          }
        ]
      };
      if (response != null && response['success'] == true) {
        return (response['data'] as List)
            .map((e) => Admin.fromJson(e))
            .toList();
      } else {
        return null;
      }
    } catch (e) {}

  }

  Future<bool> createAdmin(Admin admin) async {
    try {
      final response =
      await this.client.post('auth/admin', data: admin.toJson());
      if (response?.data != null && response?.data['success'] == true) {
        return response?.data['success'];
      } else if (response?.data != null && response?.data['success'] == false) {
        final message = (response?.data['message']);
        if (message != null) {
          Fluttertoast.showToast(msg: message);
        }
      }
    } catch (e) {}
    return false;
  }
}