// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'migrations.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MigrationsData _$MigrationsDataFromJson(Map<String, dynamic> json) =>
    MigrationsData(
      createAt: json['create_at'] == null
          ? null
          : DateTime.parse(json['create_at'] as String),
      upgradeAt: json['upgrade_at'] == null
          ? null
          : DateTime.parse(json['upgrade_at'] as String),
      deleteAt: json['delete_at'] == null
          ? null
          : DateTime.parse(json['delete_at'] as String),
      uuid: json['uuid'] as String?,
      itemUuid: json['item_uuid'] as String,
      fromUuid: json['from_uuid'] as String,
      toUuid: json['to_uuid'] as String,
      item: json['item'] == null
          ? null
          : ItemData.fromJson(json['item'] as Map<String, dynamic>),
      from: json['from'] == null
          ? null
          : PlaceData.fromJson(json['from'] as Map<String, dynamic>),
      to: json['to'] == null
          ? null
          : PlaceData.fromJson(json['to'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MigrationsDataToJson(MigrationsData instance) =>
    <String, dynamic>{
      'create_at': instance.createAt?.toIso8601String(),
      'upgrade_at': instance.upgradeAt?.toIso8601String(),
      'delete_at': instance.deleteAt?.toIso8601String(),
      'uuid': instance.uuid,
      'item_uuid': instance.itemUuid,
      'from_uuid': instance.fromUuid,
      'to_uuid': instance.toUuid,
      'item': instance.item,
      'from': instance.from,
      'to': instance.to,
    };
