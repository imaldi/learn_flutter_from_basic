import 'package:hive/hive.dart';

import '../core/resource/consts/hive_box_names.dart';
import '../model/user.dart';

class UserService {
  late Box<User?> _users;

  UserService() {
    init();
  }

  init() async {
    _users = await Hive.openBox(userBoxName);

    // await _users.add(User()..name = "Aldi" ..username = "aim2u" ..email = "aldi@gmail.com" ..password = "abc123");
    // await _users.add(User()..name = "Ipul" ..username = "ipoel" ..email = "ipul@gmail.com" ..password = "qwerty123");
  }

  /// Ini method untuk login user (cek apakah di Box Hive nya ada usernya atau nggak)
  Future<User?> authenticateUser(
      final String username, final String password) async {
    // var listOfPeople = ["aldi","ipul","imam","aldi"];
    // var listAldi = listOfPeople.where((element) => element == "aldi").toList();
    // listOfPeople.any((element) => false);
    final user = _users.values.firstWhere(
        (element) =>
            element?.username == username && element?.password == password,
        orElse: () {
      return null;
    });

    return user;
  }

  /// Ini method untuk register user
  Future<UserCreationResult> createUser(
    final String username,
    final String password,
    final String email,
    final String nama,
    final String address,
    final String phoneNumber,
  ) async {
    final alreadyExists = _users.values.any(
      (element) => element?.username?.toLowerCase() == username.toLowerCase(),
    );

    if (alreadyExists) {
      return UserCreationResult.already_exists;
    }

    try {
      _users.add(User(
          name: nama,
          username: username,
          password: password,
          email: email,
          address: address,
          phoneNumber: phoneNumber));
      return UserCreationResult.success;
    } on Exception catch (ex) {
      return UserCreationResult.failure;
    }
  }

  Future<void> removeAllUsers() async {
    await _users.clear();
  }
}

enum UserCreationResult { success, failure, already_exists }
