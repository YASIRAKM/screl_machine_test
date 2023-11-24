
// import 'package:flutter_test_user/model/user_model.dart';
// import 'package:hive/hive.dart';
//
// class MyDataModelAdapter extends TypeAdapter<UserModel> {
//   @override
//   final typeId = 0; // Assign a unique ID for your data model
//
//   @override
//   UserModel read(BinaryReader reader) {
//     return UserModel.fromJson(reader.readMap());
//   }
//
//   @override
//   void write(BinaryWriter writer, UserModel obj) {
//     writer.writeMap(obj.toJson());
//   }
// }