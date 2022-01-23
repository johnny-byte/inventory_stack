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
      ItemData.fromJson(json['item'] as Map<String, dynamic>),
      PlaceData.fromJson(json['from'] as Map<String, dynamic>),
      PlaceData.fromJson(json['to'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MigrationsDataToJson(MigrationsData instance) =>
    <String, dynamic>{
      'create_at': instance.createAt.toIso8601String(),
      'upgrade_at': instance.upgradeAt.toIso8601String(),
      'delete_at': instance.deleteAt?.toIso8601String(),
      'uuid': instance.uuid,
      'item': instance.item,
      'from': instance.from,
      'to': instance.to,
    };
