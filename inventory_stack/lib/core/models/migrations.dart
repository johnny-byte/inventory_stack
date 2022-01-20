import 'package:inventory_stack/core/models/item.dart';
import 'package:inventory_stack/core/models/place.dart';
import 'package:json_annotation/json_annotation.dart';

part 'migrations.g.dart';

@JsonSerializable()
class MigrationsData {
  final int id;
  @JsonKey(name: "create_at")
  final DateTime createAt;
  @JsonKey(name: "upgrade_at")
  final DateTime upgradeAt;
  @JsonKey(name: "delete_at")
  final DateTime? deleteAt;
  final String uuid;
  final ItemData item;
  final PlaceData from;
  final PlaceData to;


  factory MigrationsData.fromJson(Map<String, dynamic> json) => _$MigrationsDataFromJson(json);

  MigrationsData(this.id, this.createAt, this.upgradeAt, this.deleteAt, this.uuid, this.item, this.from, this.to);
  Map<String, dynamic> toJson() => _$MigrationsDataToJson(this);
}