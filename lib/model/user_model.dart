import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
part 'user_model.freezed.dart';
part 'user_model.g.dart';
@HiveType(typeId: 0)
@freezed
class UserModel with _$UserModel{

  const factory UserModel({
    @HiveField(0) required String id,
    @HiveField(1) required String name,
    @HiveField(2) required String email,
    @HiveField(3) required DateTime createdAt
}) = _UserModel;
  factory UserModel.fromJson(Map<String,dynamic> json)=> _$UserModelFromJson(json);

}