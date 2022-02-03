import 'dart:async';

import 'package:inventory_stack/core/api/api.dart';
import 'package:inventory_stack/core/models/item.dart';
import 'package:inventory_stack/core/models/migrations.dart';

class MigrationRepository{
  ApiClient client = ApiClient();

  List<MigrationsData>? _migrations;

  List<MigrationsData>? get migrations => _migrations;
  

  FutureOr<void> getMigrations() async {
    _migrations = await client.migrations();
    _migrations?.sort((m1, m2)=> m2.upgradeAt!.compareTo(m1.upgradeAt!));
  }

  FutureOr<void> createMigration(MigrationsData item) async {
    await client.migrationCreate(item);
  }

  FutureOr<List<ItemData>> serchItemsBySerial(String serialNumber) async {
    List<ItemData> list = await client.itemsBySerialNumber(serialNumber);
    list.sort((m1, m2)=> m2.upgradeAt.compareTo(m1.upgradeAt));
    return list;
  }

  FutureOr<List<ItemData>> serchItemsByInternal(String internalNumber) async {
    List<ItemData> list = await client.itemsbyInternalNumber(internalNumber);
    list.sort((m1, m2)=> m2.upgradeAt.compareTo(m1.upgradeAt));
    return list;
  }

  FutureOr<List<ItemData>> serchItemsByUuid(String uuid) async {
    List<ItemData> list = await client.itemByUUID(uuid);
    list.sort((m1, m2)=> m2.upgradeAt.compareTo(m1.upgradeAt));
    return list;
  }
}