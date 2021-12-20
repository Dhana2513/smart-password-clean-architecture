import 'package:equatable/equatable.dart';

class Password extends Equatable {
  final String desc;
  final String name;
  final String password;

  Password({
    this.desc,
    this.name,
    this.password,
  });

  @override
  List<Object> get props => [
        this.desc,
        this.name,
        this.password,
      ];
}
