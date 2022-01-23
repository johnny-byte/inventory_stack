// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemTypeData _$ItemTypeDataFromJson(Map<String, dynamic> json) => ItemTypeData(
      DateTime.parse(json['create_at'] as String),
      DateTime.parse(json['upgrade_at'] as String),
      json['delete_at'] == null
          ? null
          : DateTime.parse(json['delete_at'] as String),
      json['uuid'] as String,
      json['name'] as String,
      json['icon'] as String?,
      json['description'] as String?,
    );

Map<String, dynamic> _$ItemTypeDataToJson(ItemTypeData instance) =>
    <String, dynamic>{
      'create_at': instance.createAt.toIso8601String(),
      'upgrade_at': instance.upgradeAt.toIso8601String(),
      'delete_at': instance.deleteAt?.toIso8601String(),
      'uuid': instance.uuid,
      'name': instance.name,
      'icon': instance.icon,
      'description': instance.description,
    };
