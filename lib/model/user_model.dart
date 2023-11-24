import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
part 'user_model.freezed.dart';
part 'user_model.g.dart';
@HiveType(typeId: 0)
@freezed
class UserModel with _$UserModel{
  @HiveField(0)
  const factory UserModel({
required String id,
    required String name,
    required String email,
    required DateTime createdAt
}) = _UserModel;
  factory UserModel.fromJson(Map<String,dynamic> json)=> _$UserModelFromJson(json);

}