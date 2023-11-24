import 'package:flutter/material.dart';
import 'package:flutter_test_user/model/user_model.dart';
import 'package:hive/hive.dart';

class UserViewModel extends ChangeNotifier {
  late List<UserModel> _user;
  late Box<Map<String, dynamic>> _userBox;

  List<UserModel> get user => _user;

  Future<Box <UserModel>> getHive() async {
    return await Hive.openBox<UserModel>('user_data');
  }

  UserViewModel() {
    _userBox = Hive.box<Map<String, dynamic>>('user_data');
  }

  Future<void> fetchData(UserModel user) async {
    // final hivBox = await getHive();
    _user = _userBox.values.map((userData) => UserModel.fromJson(userData))
        .toList();
    notifyListeners();
  }

  Future<void> addUser(UserModel user) async {
    final userData = user.toJson();
    _userBox.put(user.id, userData);
    notifyListeners();
  }

  Future<void> deleteUser(UserModel user) async {
    final userData = user.toJson();
    _userBox.delete(userData);
    notifyListeners();
  }

  void searchUsers(String query) {
    List<UserModel> filteredUsers = _user.where((user) =>
        user.name.toLowerCase().contains(query.toLowerCase())||
        user.name.toUpperCase().contains(query.toUpperCase())||
        user.email.toUpperCase().contains(query.toUpperCase())||
        user.email.toLowerCase().contains(query.toLowerCase())
    ).toList();
  }
}