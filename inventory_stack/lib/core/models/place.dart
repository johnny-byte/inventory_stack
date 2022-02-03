import 'package:inventory_stack/core/models/item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'place.g.dart';

@JsonSerializable()
class PlaceData {
  final String? uuid;
  @JsonKey(name: "create_at")
  final DateTime? createAt;
  @JsonKey(name: "upgrade_at")
  final DateTime? upgradeAt;
  @JsonKey(name: "delete_at")
  final DateTime? deleteAt;
  final String name;
  final String? description;
  @JsonKey(name: "items_uuid")
  final List<String>? itemsUuids;
  final List<ItemData>? items;

  PlaceData({this.uuid, this.createAt, this.upgradeAt, this.deleteAt, required this.name, this.description, this.itemsUuids, this.items});

  factory PlaceData.fromJson(Map<String, dynamic> json) => _$PlaceDataFromJson(json);
  Map<String, dynamic> toJson() => _$PlaceDataToJson(this);
}