// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemData _$ItemDataFromJson(Map<String, dynamic> json) => ItemData(
      json['uuid'] as String,
      json['create_at'] as String,
      json['upgrade_at'] as String,
      json['delete_at'] as String?,
      json['serial_number'] as String,
      json['reg_number'] as String,
      json['internal_number'] as String,
      json['name'] as String,
      json['description'] as String?,
      json['type_uuid'] as String,
      json['type'] == null
          ? null
          : ItemTypeData.fromJson(json['type'] as Map<String, dynamic>),
      json['date'] as String?,
      json['count'] as int?,
      json['root_place_uuid'] as String,
      json['current_place_uuid'] as String,
      json['root_place'] == null
          ? null
          : PlaceData.fromJson(json['root_place'] as Map<String, dynamic>),
      json['current_place'] == null
          ? null
          : PlaceData.fromJson(json['current_place'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ItemDataToJson(ItemData instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'create_at': instance.createAt,
      'upgrade_at': instance.upgradeAt,
      'delete_at': instance.deleteAt,
      'serial_number': instance.serialNumber,
      'reg_number': instance.regNumber,
      'internal_number': instance.internalNumber,
      'name': instance.name,
      'description': instance.description,
      'type_uuid': instance.typeUuid,
      'type': instance.type,
      'date': instance.date,
      'count': instance.count,
      'root_place_uuid': instance.rootPlaceUuid,
      'current_place_uuid': instance.currentPlaceUuid,
      'root_place': instance.rootPlace,
      'current_place': instance.currentPlace,
    };
