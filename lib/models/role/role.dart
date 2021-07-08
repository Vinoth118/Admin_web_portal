import 'package:equatable/equatable.dart';

class Role extends Equatable {
  String status;
  String sId;
  String name;
  List<Modules> modules;
  String createdAt;
  String updatedAt;
  int iV;

  Role(
      {this.status,
      this.sId,
      this.name,
      this.modules,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Role.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    sId = json['_id'];
    name = json['name'];
    if (json['modules'] != null) {
      modules = new List<Modules>();
      json['modules'].forEach((v) {
        modules.add(new Modules.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['_id'] = this.sId;
    data['name'] = this.name;
    if (this.modules != null) {
      data['modules'] = this.modules.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }

  Role copyWith(
          {String status,
          String sId,
          String name,
          String modules,
          String createdAt,
          String updatedAt,
          int iV}) =>
      Role(
          status: status ?? this.status,
          sId: sId ?? this.sId,
          name: name ?? this.name,
          modules: modules ?? this.modules,
          createdAt: createdAt ?? this.createdAt,
          updatedAt: updatedAt ?? this.updatedAt,
          iV: iV ?? this.iV
      );

  @override
  List<Object> get props =>
      [status, sId, name, modules, createdAt, updatedAt, iV];
}

class Modules extends Equatable {
  List<String> privileges;
  String sId;
  String name;
  String updatedAt;
  String createdAt;

  Modules(
      {this.privileges, this.sId, this.name, this.updatedAt, this.createdAt});

  Modules.fromJson(Map<String, dynamic> json) {
    privileges = json['privileges'].cast<String>();
    sId = json['_id'];
    name = json['name'];
    updatedAt = json['updatedAt'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['privileges'] = this.privileges;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['updatedAt'] = this.updatedAt;
    data['createdAt'] = this.createdAt;
    return data;
  }

  @override
  List<Object> get props => [privileges, sId, name, createdAt, updatedAt];
}
