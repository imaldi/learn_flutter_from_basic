import 'package:hive/hive.dart';

import '../core/resource/consts/hive_type.dart';

part 'user.g.dart';

@HiveType(typeId: userTypeId)
class User extends HiveObject {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String username;
  @HiveField(2)
  String? email;
  @HiveField(3)
  String password;
  @HiveField(4)
  String? address;
  @HiveField(5)
  String? phoneNumber;
  User(
      {this.name,
      required this.username,
      this.email,
      required this.password,
      this.address,
      this.phoneNumber});
}
