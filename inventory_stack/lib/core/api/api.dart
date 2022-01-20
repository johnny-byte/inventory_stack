import 'dart:typed_data';

import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:inventory_stack/core/models/item.dart';
import 'package:inventory_stack/core/models/item_type.dart';
import 'package:inventory_stack/core/models/migrations.dart';
import 'package:inventory_stack/core/models/place.dart';
import 'package:retrofit/retrofit.dart';

part 'api.g.dart';

String serverBaseUrl = dotenv.get('SERVER');

@RestApi()
abstract class ApiClient {
  factory ApiClient() {
    Dio dio = Dio();
    dio.options = BaseOptions(baseUrl: serverBaseUrl);
    return _ApiClient(dio);
  }

  /// PLACE
  @POST("/place/create")
  Future<PlaceData> placeCreate(@Body() PlaceData placeData);

  @POST("/place/update")
  Future<PlaceData> placeUpdate(@Body() PlaceData placeData);

  @GET("/place/all")
  Future<List<PlaceData>> places();

  @GET("/place/{like}/find")
  Future<List<PlaceData>> placeFindLike(@Path("like") String like);


  /// MIGRATION

  @POST("/migration/create")
  Future<MigrationsData> migrationCreate(@Body() MigrationsData migrationsData);

  @GET("/migration/all")
  Future<List<MigrationsData>> migrations();

  /// Types
  ///
  @GET("/types/all")
  Future<List<ItemTypeData>> typesAll();

  /// ITEM
  /// 
  @POST("/item/create")
  Future<ItemData> itemCreate(@Body() ItemData itemData);

  @POST("/item/update")
  Future<ItemData> itemUpdate(@Body() ItemData itemData);

  @GET("/item/all")
  Future<List<ItemData>> items();

  @GET("/item/current/{place_uuid}/all")
  Future<List<ItemData>> itemsInCurrentPlace(@Path("place_uuid") String placeUUID);

  @GET("/item/serial/{serial_number}/find")
  Future<List<ItemData>> itemsBySerialNumber(@Path("serial_number") String serialNumber);

  @GET("/item/internal/{internal_number}/find")
  Future<List<ItemData>> itemsbyInternalNumber(@Path("internal_number") String internalNumber);

  @GET("/item/uuid/{uuid}/find")
  Future<List<ItemData>> itemByUUID(@Path("uuid") String uuid);
}