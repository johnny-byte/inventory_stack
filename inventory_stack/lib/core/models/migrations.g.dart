// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'migrations.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MigrationsData _$MigrationsDataFromJson(Map<String, dynamic> json) =>
    MigrationsData(
      DateTime.parse(json['create_at'] as String),
      DateTime.parse(json['upgrade_at'] as String),
      json['delete_at'] == null
          ? null
          : DateTime.parse(json['delete_at'] as String),
      json['uuid'] as String,
      json['item_uuid'] as String,
      json['from_uuid'] as String,
      json['to_uuid'] as String,
      json['item'] == null
          ? null
          : ItemData.fromJson(json['item'] as Map<String, dynamic>),
      json['from'] == null
          ? null
          : PlaceData.fromJson(json['from'] as Map<String, dynamic>),
      json['to'] == null
          ? null
          : PlaceData.fromJson(json['to'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MigrationsDataToJson(MigrationsData instance) =>
    <String, dynamic>{
      'create_at': instance.createAt.toIso8601String(),
      'upgrade_at': instance.upgradeAt.toIso8601String(),
      'delete_at': instance.deleteAt?.toIso8601String(),
      'uuid': instance.uuid,
      'item_uuid': instance.itemUuid,
      'from_uuid': instance.fromUuid,
      'to_uuid': instance.toUuid,
      'item': instance.item,
      'from': instance.from,
      'to': instance.to,
    };
