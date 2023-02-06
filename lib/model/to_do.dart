import 'package:hive/hive.dart';

import '../core/resource/consts/hive_type.dart';

part 'to_do.g.dart';

@HiveType(typeId: todoTypeId)
class ToDo extends HiveObject {
  @HiveField(0)
  bool isDone;
  @HiveField(1)
  String task;
  @HiveField(2)
  String? tag;
  @HiveField(3)
  DateTime? jadwal;
  @HiveField(4)
  String username;
  ToDo(this.task, this.username, {this.isDone = false, this.tag, this.jadwal});
}
