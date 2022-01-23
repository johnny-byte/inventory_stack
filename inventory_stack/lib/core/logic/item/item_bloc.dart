import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_stack/core/logic/item/item_repository.dart';
import 'package:inventory_stack/core/models/item.dart';

part 'item_event.dart';
part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  ItemBloc(this.repository) : super(ItemInitialState()){
    on<ItemsGetEvent>(_onGetEvent);
    on<ItemsUpdateEvent>(_onUpdateList);
    on<ItemCreateEvent>(_onCreateEvent);
    on<ItemSearchBySerialNumberEvent>(_onSearchBySerial);
    on<ItemSearchByInternalNumberEvent>(_onSearchByInternal);
    on<ItemSearchByUUIDEvent>(_onSearchByUUID);
  }

  final ItemRepository repository;

  FutureOr<void> _onGetEvent(ItemsGetEvent event, Emitter<ItemState> emiter) async  {
    emiter(ItemLoadState());
    if(repository.places == null){
        await repository.getItems();
    }
    emiter(ItemShowState(repository.places!));
  }
  
  FutureOr<void> _onUpdateList(ItemsUpdateEvent event, Emitter<ItemState> emiter) async  {
    emiter(ItemLoadState());
    await repository.getItems();
    emiter(ItemShowState(repository.places!));
  }

  FutureOr<void> _onCreateEvent(ItemCreateEvent event, Emitter<ItemState> emiter) async  {
    await repository.createItem(event.item);
  }

  FutureOr<void> _onSearchBySerial(ItemSearchBySerialNumberEvent event, Emitter<ItemState> emiter) async  {
    emiter(ItemLoadState());
    List<ItemData> list = await repository.searchBySerial(event.number);
    emiter(ItemShowSearchedState(list));
  }

  FutureOr<void> _onSearchByInternal(ItemSearchByInternalNumberEvent event, Emitter<ItemState> emiter) async  {
    emiter(ItemLoadState());
    List<ItemData> list = await repository.searchByIntrnal(event.number);
    emiter(ItemShowSearchedState(list));
  }

  FutureOr<void> _onSearchByUUID(ItemSearchByUUIDEvent event, Emitter<ItemState> emiter) async  {
    emiter(ItemLoadState());
    List<ItemData> list = await repository.searchByUUID(event.uuid);
    emiter(ItemShowSearchedState(list));
  }
}