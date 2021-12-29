import 'package:smart_password_clean_architechture/features/dashboard/domain/entities/password.dart';

class PasswordModel extends Password {
  PasswordModel({
    String desc,
    String name,
    String password,
  }) : super(
          desc: desc,
          name: name,
          password: password,
        );

  factory PasswordModel.fromJson(Map<String, dynamic> json) {
    return PasswordModel(
      desc: json['desc'],
      name: json['name'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'desc': this.desc,
      'name': this.name,
      'password': this.password,
    };
  }
}
