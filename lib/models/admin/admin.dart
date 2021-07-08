import 'package:equatable/equatable.dart';
import 'package:admin_web_portal/models/role/role.dart';

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
  String password;
  String countryCode;

  Admin({this.status,
    this.sId,
    this.name,
    this.email,
    this.role,
    this.phone,
    this.createdAt,
    this.updatedAt,
    this.iV,
    this.password,
    this.countryCode});

  Admin.defaultInstance() {
    name = '';
    email = '';
    role = Role();
    countryCode = '';
    phone = '';
    password = '';
  }

  Admin.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    role = json['role'] != null ? new Role.fromJson(json['role']) : null;
    countryCode = json['countryCode'];
    phone = json['phone'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    password = json['password'];
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
    data['countryCode'] = this.countryCode;
    data['phone'] = this.phone;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['password'] = this.password;
    return data;
  }

  Admin copyWith({String status,
    String sId,
    String name,
    String email,
    Role role,
    String phone,
    String countryCode,
    String createdAt,
    String updatedAt,
    int iV,
    String password}) =>
      Admin(
        status: status ?? this.status,
        sId: sId ?? this.sId,
        name: name ?? this.name,
        email: email ?? this.email,
        role: role ?? this.role,
        countryCode: countryCode ?? this.countryCode,
        phone: phone ?? this.phone,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        iV: iV ?? this.iV,
        password: password ?? this.password,
      );

  @override
  List<Object> get props =>
      [
        status,
        sId,
        name,
        email,
        role,
        countryCode,
        phone,
        createdAt,
        updatedAt,
        iV,
        password
      ];
}
