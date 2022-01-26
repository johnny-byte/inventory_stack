import 'dart:async';

import 'package:inventory_stack/core/api/api.dart';
import 'package:inventory_stack/core/models/migrations.dart';

class MigrationRepository{
  ApiClient client = ApiClient();

  List<MigrationsData>? _migrations;

  List<MigrationsData>? get migrations => _migrations;
  

  FutureOr<void> getItems() async {
    _migrations = await client.migrations();
    
  }

  FutureOr<void> createItem(MigrationsData item) async {
    await client.migrationCreate(item);
  }
}