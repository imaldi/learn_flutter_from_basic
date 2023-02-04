import 'package:hive/hive.dart';

import '../core/resource/consts/hive_box_names.dart';
import '../model/user.dart';

class UserService {
  late Box<User> _users;

  init() async {
    Hive.registerAdapter(UserAdapter());
    _users = await Hive.openBox(userBoxName);

    // await _users.add(User()..name = "Aldi" ..userName = "aim2u" ..email = "aldi@gmail.com" ..password = "abc123");
    // await _users.add(User()..name = "Ipul" ..userName = "ipoel" ..email = "ipul@gmail.com" ..password = "qwerty123");
  }

  /// Ini method untuk login user (cek apakah di Box Hive nya ada usernya atau nggak)
  Future<String?> authenticateUser(final String username, final String password) async {
    // var listOfPeople = ["aldi","ipul","imam","aldi"];
    // var listAldi = listOfPeople.where((element) => element == "aldi").toList();
    // listOfPeople.any((element) => false);
    final success = await _users.values.any((element) => element.userName == username && element.password == password);
    if (success) {
      return username;
    } else {
      return null;
    }
  }

  /// Ini method untuk register user
  Future<UserCreationResult> createUser(final String username, final String password) async {
    final alreadyExists = _users.values.any(
          (element) => element.userName?.toLowerCase() == username.toLowerCase(),
    );

    if (alreadyExists) {
      return UserCreationResult.already_exists;
    }

    try {
      _users.add(User(userName: username, password: password));
      return UserCreationResult.success;
    } on Exception catch (ex) {
      return UserCreationResult.failure;
    }
  }
}
enum UserCreationResult { success, failure, already_exists }