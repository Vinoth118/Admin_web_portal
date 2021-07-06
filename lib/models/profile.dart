import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  String name;

  Profile({this.name});

  Profile.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }

  @override
  List<Object> get props => [name];
}
