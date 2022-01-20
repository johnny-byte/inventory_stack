// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceData _$PlaceDataFromJson(Map<String, dynamic> json) => PlaceData(
      json['id'] as int,
      DateTime.parse(json['create_at'] as String),
      DateTime.parse(json['upgrade_at'] as String),
      json['delete_at'] == null
          ? null
          : DateTime.parse(json['delete_at'] as String),
      json['uuid'] as String,
      json['name'] as String,
      json['description'] as String?,
    );

Map<String, dynamic> _$PlaceDataToJson(PlaceData instance) => <String, dynamic>{
      'id': instance.id,
      'create_at': instance.createAt.toIso8601String(),
      'upgrade_at': instance.upgradeAt.toIso8601String(),
      'delete_at': instance.deleteAt?.toIso8601String(),
      'uuid': instance.uuid,
      'name': instance.name,
      'description': instance.description,
    };
