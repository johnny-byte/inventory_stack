// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _ApiClient implements ApiClient {
  _ApiClient(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<PlaceData> placeCreate(placeData) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(placeData.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PlaceData>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/place/create',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PlaceData.fromJson(_result.data!);
    return value;
  }

  @override
  Future<PlaceData> placeUpdate(placeData) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(placeData.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PlaceData>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/place/update',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PlaceData.fromJson(_result.data!);
    return value;
  }

  @override
  Future<List<PlaceData>> places() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<PlaceData>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/place/all',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => PlaceData.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<PlaceData>> placeFindLike(like) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<PlaceData>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/place/name/${like}/find',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => PlaceData.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<MigrationsData> migrationCreate(migrationsData) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(migrationsData.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MigrationsData>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/migration/create',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MigrationsData.fromJson(_result.data!);
    return value;
  }

  @override
  Future<List<MigrationsData>> migrations() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<MigrationsData>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/migration/all',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => MigrationsData.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<ItemTypeData>> typesAll() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<ItemTypeData>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/types/all',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => ItemTypeData.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<ItemData> itemCreate(itemData) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(itemData.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ItemData>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/item/create',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ItemData.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ItemData> itemUpdate(itemData) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(itemData.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ItemData>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/item/update',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ItemData.fromJson(_result.data!);
    return value;
  }

  @override
  Future<List<ItemData>> items() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<ItemData>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/item/all',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => ItemData.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<ItemData>> itemsInCurrentPlace(placeUUID) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<ItemData>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/item/current/${placeUUID}/all',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => ItemData.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<ItemData>> itemsBySerialNumber(serialNumber) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<ItemData>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/item/serial/${serialNumber}/find',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => ItemData.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<ItemData>> itemsbyInternalNumber(internalNumber) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<ItemData>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/item/internal/${internalNumber}/find',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => ItemData.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<ItemData>> itemByUUID(uuid) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<ItemData>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/item/uuid/${uuid}/find',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => ItemData.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
