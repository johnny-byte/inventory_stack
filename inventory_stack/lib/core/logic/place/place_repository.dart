import 'dart:async';

import 'package:inventory_stack/core/api/api.dart';
import 'package:inventory_stack/core/models/place.dart';

class PlaceRepository{
  ApiClient client = ApiClient();

  List<PlaceData>? _places;

  List<PlaceData>? get places => _places;
  

  FutureOr<void> getPlaces() async {
    _places = await client.places();
    
  }

  FutureOr<void> createPlace(PlaceData place) async {
    await client.placeCreate(place);
  }

  FutureOr<void> updatePlace(PlaceData place) async {
    await client.placeUpdate(place);
  }

  FutureOr<List<PlaceData>> searchByName(String name) async {
    _places = await client.placeFindLike(name);
    return _places!;
  }
}