part of 'place_bloc.dart';

abstract class PlaceState extends Equatable {
  const PlaceState();

  @override
  List<Object> get props => [];
}

class PlaceInitialState extends PlaceState {}
class PlaceLoadState extends PlaceState {}

class PlacesShowState extends PlaceState {
  final List<PlaceData> data;

  const PlacesShowState(this.data);
}

class PlacesShowSearchedState extends PlaceState {
  final List<PlaceData> data;

  const PlacesShowSearchedState(this.data);
}

