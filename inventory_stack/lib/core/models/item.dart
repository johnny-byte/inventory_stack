import 'package:inventory_stack/core/models/item_type.dart';
import 'package:inventory_stack/core/models/migrations.dart';
import 'package:inventory_stack/core/models/place.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item.g.dart';

@JsonSerializable()
class ItemData {
  final String uuid;
  @JsonKey(name: "create_at")
  final String createAt;
  @JsonKey(name: "upgrade_at")
  final String upgradeAt;
  @JsonKey(name: "delete_at")
  final String? deleteAt;
  @JsonKey(name: "serial_number")
  final String serialNumber;
  @JsonKey(name: "reg_number")
  final String regNumber;
  @JsonKey(name: "internal_number")
  final String internalNumber;
  final String name;
  final String? description;
  @JsonKey(name: "type_uuid")
  final String typeUuid;
  final ItemTypeData? type;
  final String? date;
  final int? count;
  @JsonKey(name: "root_place_uuid")
  final String rootPlaceUuid;
  @JsonKey(name: "current_place_uuid")
  final String currentPlaceUuid;
  @JsonKey(name: "root_place")
  final PlaceData? rootPlace;
  @JsonKey(name: "current_place")
  final PlaceData? currentPlace;
  @JsonKey(name: "migrations")
  final List<MigrationsData>? migrations;

  ItemData(this.uuid, this.createAt, this.upgradeAt, this.deleteAt, this.serialNumber, this.regNumber, this.internalNumber, this.name, this.description, this.typeUuid, this.type, this.date, this.count, this.rootPlaceUuid, this.currentPlaceUuid, this.rootPlace, this.currentPlace, this.migrations);

  factory ItemData.fromJson(Map<String, dynamic> json) => _$ItemDataFromJson(json);
  Map<String, dynamic> toJson() => _$ItemDataToJson(this);
}