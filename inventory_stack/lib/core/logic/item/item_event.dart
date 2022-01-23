part of 'item_bloc.dart';

abstract class ItemEvent extends Equatable {
  const ItemEvent();

  @override
  List<Object> get props => [];
}

class ItemsGetEvent extends ItemEvent{}
class ItemsUpdateEvent extends ItemEvent{}

class ItemCreateEvent extends ItemEvent{
  final ItemData item;

  const ItemCreateEvent(this.item);
}


class ItemSearchBySerialNumberEvent extends ItemEvent{
  final String number;

  const ItemSearchBySerialNumberEvent(this.number);
}

class ItemSearchByInternalNumberEvent extends ItemEvent{
  final String number;

  const ItemSearchByInternalNumberEvent(this.number);
}

class ItemSearchByUUIDEvent extends ItemEvent{
  final String uuid;

  const ItemSearchByUUIDEvent(this.uuid);
}