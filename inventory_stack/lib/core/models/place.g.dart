// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceData _$PlaceDataFromJson(Map<String, dynamic> json) => PlaceData(
      uuid: json['uuid'] as String?,
      createAt: json['create_at'] == null
          ? null
          : DateTime.parse(json['create_at'] as String),
      upgradeAt: json['upgrade_at'] == null
          ? null
          : DateTime.parse(json['upgrade_at'] as String),
      deleteAt: json['delete_at'] == null
          ? null
          : DateTime.parse(json['delete_at'] as String),
      name: json['name'] as String,
      description: json['description'] as String?,
      itemsUuids: (json['items_uuid'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => ItemData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PlaceDataToJson(PlaceData instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'create_at': instance.createAt?.toIso8601String(),
      'upgrade_at': instance.upgradeAt?.toIso8601String(),
      'delete_at': instance.deleteAt?.toIso8601String(),
      'name': instance.name,
      'description': instance.description,
      'items_uuid': instance.itemsUuids,
      'items': instance.items,
    };
