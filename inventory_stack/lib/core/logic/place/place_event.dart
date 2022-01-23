part of 'place_bloc.dart';

abstract class PlaceEvent extends Equatable {
  const PlaceEvent();

  @override
  List<Object> get props => [];
}

class GetPlacesEvent extends PlaceEvent {}

class UpdatePlacesListEvent extends PlaceEvent {}

class CreatePlaceEvent extends PlaceEvent {
  final PlaceData data;

  const CreatePlaceEvent(this.data);

}

class UpdatePlaceEvent extends PlaceEvent {
  final PlaceData data;

  const UpdatePlaceEvent(this.data);

}

class SearchPlaceByName extends PlaceEvent {
  final String name;

  const SearchPlaceByName(this.name);
}

