import 'dart:async';

import 'package:inventory_stack/core/api/api.dart';
import 'package:inventory_stack/core/models/item.dart';

class ItemRepository{
  ApiClient client = ApiClient();

  List<ItemData>? _items;

  List<ItemData>? get places => _items;
  

  FutureOr<void> getItems() async {
    _items = await client.items();
    
  }

  FutureOr<void> createItem(ItemData item) async {
    await client.itemCreate(item);
  }

  FutureOr<void> updatePlace(ItemData item) async {
    await client.itemUpdate(item);
  }

  FutureOr<List<ItemData>> searchByIntrnal(String number) async {
    List<ItemData> items = await client.itemsbyInternalNumber(number);
    return items;
  }

  FutureOr<List<ItemData>> searchBySerial(String number) async {
    List<ItemData> items = await client.itemsBySerialNumber(number);
    return items;
  }

  FutureOr<List<ItemData>> searchByUUID(String uuid) async {
    List<ItemData> items = await client.itemByUUID(uuid);
    return items;
  }
}