import 'package:inventory_stack/core/models/item_type.dart';
import 'package:inventory_stack/core/models/place.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item.g.dart';

@JsonSerializable()
class ItemData {
  @JsonKey(name: "create_at")
  final String createAt;
  @JsonKey(name: "upgrade_at")
  final String upgradeAt;
  @JsonKey(name: "delete_at")
  final String deleteAt;
  final String uuid;
  @JsonKey(name: "serial_number")
  final String serialNumber;
  @JsonKey(name: "reg_number")
  final String regNumber;
  @JsonKey(name: "internal_number")
  final String internalNumber;
  final String name;
  final String? description;
  final ItemTypeData type;
  final String? date;
  @JsonKey(name: "root_place")
  final PlaceData rootPlace;
  @JsonKey(name: "current_place")
  final PlaceData currentPlace;

  ItemData(this.createAt, this.upgradeAt, this.deleteAt, this.uuid, this.serialNumber, this.regNumber, this.internalNumber, this.name, this.description, this.type, this.date, this.rootPlace, this.currentPlace);

  factory ItemData.fromJson(Map<String, dynamic> json) => _$ItemDataFromJson(json);
  Map<String, dynamic> toJson() => _$ItemDataToJson(this);
}