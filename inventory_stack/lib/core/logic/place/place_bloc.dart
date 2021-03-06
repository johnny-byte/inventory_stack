import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_stack/core/logic/place/place_repository.dart';
import 'package:inventory_stack/core/models/place.dart';

part 'place_state.dart';
part 'place_event.dart';

class PlaceBloc extends Bloc<PlaceEvent, PlaceState> {
  PlaceBloc(this.placeRepository) : super(PlaceInitialState()){
    on<GetPlacesEvent>(_onGetPlaces);
    on<UpdatePlacesListEvent>(_onUpdatePlacesList);
    on<SearchPlaceByName>(_onSearchByName);
    on<CreatePlaceEvent>(_onCreatePlaceEvent);
    on<UpdatePlaceEvent>(_onUpdatePlaceEvent);
  }

  final PlaceRepository placeRepository;

  FutureOr<void> _onGetPlaces(GetPlacesEvent event, Emitter<PlaceState> emiter) async  {
    emiter(PlaceLoadState());
    if(placeRepository.places == null){
        await placeRepository.getPlaces();
    }
    emiter(PlacesShowState(placeRepository.places!));
  }
  FutureOr<void> _onUpdatePlacesList(UpdatePlacesListEvent event, Emitter<PlaceState> emiter) async  {
    emiter(PlaceLoadState());
    await placeRepository.getPlaces();
    emiter(PlacesShowState(placeRepository.places!));
  }

  FutureOr<void> _onSearchByName(SearchPlaceByName event, Emitter<PlaceState> emiter) async  {
    emiter(PlaceLoadState());
    List<PlaceData> list = await placeRepository.searchByName(event.name);
    emiter(PlacesShowSearchedState(list));
  }

  FutureOr<void> _onCreatePlaceEvent(CreatePlaceEvent event, Emitter<PlaceState> emiter) async  {
    await placeRepository.createPlace(event.data);
  }

  FutureOr<void> _onUpdatePlaceEvent(UpdatePlaceEvent event, Emitter<PlaceState> emiter) async  {
    await placeRepository.updatePlace(event.data);
  }
}