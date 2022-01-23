import 'package:json_annotation/json_annotation.dart';

part 'place.g.dart';

@JsonSerializable()
class PlaceData {
  final int? id;
  @JsonKey(name: "create_at")
  final DateTime? createAt;
  @JsonKey(name: "upgrade_at")
  final DateTime? upgradeAt;
  @JsonKey(name: "delete_at")
  final DateTime? deleteAt;
  final String? uuid;
  final String name;
  final String? description;

  PlaceData({this.id, this.createAt, this.upgradeAt, this.deleteAt, this.uuid, required this.name, this.description});

  factory PlaceData.fromJson(Map<String, dynamic> json) => _$PlaceDataFromJson(json);
  Map<String, dynamic> toJson() => _$PlaceDataToJson(this);
}