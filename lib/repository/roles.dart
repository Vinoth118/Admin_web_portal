import 'package:admin_web_portal/models/role.dart';
import 'package:dio/dio.dart';

abstract class RolesRepositoryI {
  Future<List<Role>> getAllRoles();
}
class RolesRepository implements RolesRepositoryI {
  final Dio client;
  RolesRepository(this.client);

  Future<List<Role>> getAllRoles() async {
    try {
      //final response = await this.client.get('auth/role');
      final response = {
        "success": true,
        "data": [
          {
            "status": "DISABLED",
            "_id": "60de17fea85f191090fbe2d5",
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
          }
        ]
      };
      if (response != null && response['success'] == true) {
        return (response['data'] as List)
            .map((e) => Role.fromJson(e))
            .toList();
      } else {
        return null;
      }
    } catch (e) {}

  }
}