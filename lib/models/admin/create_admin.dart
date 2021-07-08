class CreateAdmin {
  String name;
  String email;
  String role;
  String phone;
  String password;
  String countryCode;

  CreateAdmin(
      {this.name,
        this.email,
        this.role,
        this.phone,
        this.password,
        this.countryCode});

  CreateAdmin.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
    phone = json['phone'];
    password = json['password'];
    countryCode = json['countryCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['role'] = this.role;
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['countryCode'] = this.countryCode;
    return data;
  }
}