import 'package:equatable/equatable.dart';
import 'package:admin_web_portal/models/role.dart';

class Admin extends Equatable {
  String status;
  String sId;
  String name;
  String email;
  Role role;
  String phone;
  String createdAt;
  String updatedAt;
  int iV;

  Admin(
      {this.status,
      this.sId,
      this.name,
      this.email,
      this.role,
      this.phone,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Admin.defaultInstance() {
    status = '';
    sId = '';
    name = '';
    email = '';
    role = null;
    phone = '';
    createdAt = '';
    updatedAt = '';
    iV = 0;
  }

  Admin.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    role = json['role'] != null ? new Role.fromJson(json['role']) : null;
    phone = json['phone'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    if (this.role != null) {
      data['role'] = this.role.toJson();
    }
    data['phone'] = this.phone;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }

  Admin copyWith(
          {String status,
          String sId,
          String name,
          String email,
          Role role,
          String phone,
          String createdAt,
          String updatedAt,
          int iV}) =>
      Admin(
          status: status ?? this.status,
          sId: sId ?? this.sId,
          name: name ?? this.name,
          email: email ?? this.email,
          role: role ?? this.role,
          phone: phone ?? this.phone,
          createdAt: createdAt ?? this.createdAt,
          updatedAt: updatedAt ?? this.updatedAt,
          iV: iV ?? this.iV);

  @override
  List<Object> get props => [status, sId, name, email, role, phone, createdAt, updatedAt, iV];
}

/*class Roles {
  String sId;
  String name;

  Roles({this.sId, this.name});

  Roles.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    return data;
  }

  Roles copyWith({String name, String sId}) => Roles(name: name ?? this.name, sId: sId ?? this.sId);
}*/
