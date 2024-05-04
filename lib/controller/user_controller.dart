import 'package:casilleros_inteligente/config/db.dart';
import 'package:casilleros_inteligente/model/user_model.dart';
import 'package:sqflite/sqflite.dart';

class UserController {
  Future<void> insertUser(UserModel user) async {
    await Db.dbInstance!.insert(
      'user',
      user.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<UserModel?> login(String email, String password) async {
    final List<Map<String, dynamic>> userMaps = await Db.dbInstance!.query(
      'user',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );

    if (userMaps.isNotEmpty) {
      return UserModel.fromJson(userMaps.first);
    } else {
      return null;
    }
  }
}
