import 'package:equatable/equatable.dart';

import 'package:hive/hive.dart';
part 'password.g.dart';

@HiveType(typeId: 1)
class Password extends HiveObject implements EquatableMixin {
  @HiveField(0)
  final String desc;

  @HiveField(1)
  final String name;

  @HiveField(2)
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

  @override
  String toString() {
    return super.toString();
  }

  @override
  bool get stringify => throw UnimplementedError();
}
