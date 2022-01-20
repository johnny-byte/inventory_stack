// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemData _$ItemDataFromJson(Map<String, dynamic> json) => ItemData(
      json['id'] as int,
      json['create_at'] as String,
      json['upgrade_at'] as String,
      json['delete_at'] as String,
      json['uuid'] as String,
      json['serial_number'] as String,
      json['reg_number'] as String,
      json['internal_number'] as String,
      json['name'] as String,
      json['description'] as String?,
      ItemTypeData.fromJson(json['type'] as Map<String, dynamic>),
      json['date'] as String?,
      PlaceData.fromJson(json['root_place'] as Map<String, dynamic>),
      PlaceData.fromJson(json['current_place'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ItemDataToJson(ItemData instance) => <String, dynamic>{
      'id': instance.id,
      'create_at': instance.createAt,
      'upgrade_at': instance.upgradeAt,
      'delete_at': instance.deleteAt,
      'uuid': instance.uuid,
      'serial_number': instance.serialNumber,
      'reg_number': instance.regNumber,
      'internal_number': instance.internalNumber,
      'name': instance.name,
      'description': instance.description,
      'type': instance.type,
      'date': instance.date,
      'root_place': instance.rootPlace,
      'current_place': instance.currentPlace,
    };
