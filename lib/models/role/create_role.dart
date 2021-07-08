class CreateRole {
  String name;
  List<RoleModules> modules;

  CreateRole({this.name, this.modules});

  CreateRole.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['modules'] != null) {
      modules = new List<RoleModules>();
      json['modules'].forEach((v) {
        modules.add(new RoleModules.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.modules != null) {
      data['modules'] = this.modules.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RoleModules {
  String name;
  List<String> privileges;

  RoleModules({this.name, this.privileges});

  RoleModules.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    privileges = json['privileges'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['privileges'] = this.privileges;
    return data;
  }
}