import 'package:json_annotation/json_annotation.dart';

part 'item_type.g.dart';

@JsonSerializable()
class ItemTypeData {
  final int id;
  @JsonKey(name: "create_at")
  final DateTime createAt;
  @JsonKey(name: "upgrade_at")
  final DateTime upgradeAt;
  @JsonKey(name: "delete_at")
  final DateTime? deleteAt;
  final String uuid;
  final String name;
  final String? icon;
  final String? description;

  ItemTypeData(this.id, this.createAt, this.upgradeAt, this.deleteAt, this.uuid, this.name, this.icon, this.description);

  factory ItemTypeData.fromJson(Map<String, dynamic> json) => _$ItemTypeDataFromJson(json);

  Map<String, dynamic> toJson() => _$ItemTypeDataToJson(this);
}