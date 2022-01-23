part of 'item_bloc.dart';

abstract class ItemState extends Equatable {
  const ItemState();

  @override
  List<Object> get props => [];
}

class ItemInitialState extends ItemState {}
class ItemLoadState extends ItemState {}

class ItemShowState extends ItemState {
  final List<ItemData> data;

  const ItemShowState(this.data);
}

class ItemShowSearchedState extends ItemState{
  final List<ItemData> data;

  const ItemShowSearchedState(this.data);
}