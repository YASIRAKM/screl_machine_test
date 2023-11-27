import 'package:flutter/material.dart';
import 'package:flutter_test_user/model/user_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';

class UserViewModel extends ChangeNotifier {
  List<UserModel> _user = [];
  static const String userBoxName = 'userBox';
  List<UserModel> get user => _user;
  bool search =false;
  UserViewModel(){
    fetchData();
  }
  Future<void> fetchData() async {
    var box = await Hive.openBox<UserModel>(userBoxName);
    _user = box.values.toList();
    notifyListeners();
  }
  Future<void> addUser(UserModel user) async {
    var box = await Hive.openBox<UserModel>(userBoxName);
    await box.put(user.id, user);
    await fetchData();
    notifyListeners();
  }

  Future<void> deleteUser(UserModel user) async {
    var box = await Hive.openBox<UserModel>(userBoxName);
    if (box.containsKey(user.id)) {
      box.delete(user.id);
      Fluttertoast.showToast(msg:'User deleted successfully' ,gravity: ToastGravity.CENTER);
    } else {
      Fluttertoast.showToast(msg:'User not found in the box' ,gravity: ToastGravity.CENTER);
    }

    notifyListeners();
  }

  void searchUsers(String query) {
    List<UserModel> filteredUsers = _user
        .where((user) =>
            user.name.toLowerCase().contains(query.toLowerCase()) ||
            user.name.toUpperCase().contains(query.toUpperCase()) ||
            user.email.toUpperCase().contains(query.toUpperCase()) ||
            user.email.toLowerCase().contains(query.toLowerCase()))
        .toList();
    _user = filteredUsers;
  }


  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}
