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
    return await client.itemsBySerialNumber(serialNumber);
  }

  FutureOr<List<ItemData>> serchItemsByInternal(String internalNumber) async {
    return await client.itemsbyInternalNumber(internalNumber);
  }

  FutureOr<List<ItemData>> serchItemsByUuid(String uuid) async {
    return await client.itemByUUID(uuid);
  }
}