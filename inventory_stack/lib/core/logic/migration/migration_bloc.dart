import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_stack/core/logic/migration/migration_repository.dart';
import 'package:inventory_stack/core/models/item.dart';
import 'package:inventory_stack/core/models/migrations.dart';

part 'migration_event.dart';
part 'migration_state.dart';

class MigrationBloc extends Bloc<MigrationEvent, MigrationState>{
  MigrationBloc(this.repository) : super(MigrationInitState()){
    on<MigrationGetEvent>(_onGetEvent);
    on<MigrationCreateEvent>(_onCreateEvent);
    on<MigrationUpdateListEvent>(_onUpdateListEvent);
    on<MigrationSearchItemByInternalEvent>(_onSearchByInternal);
    on<MigrationSearchItemBySerialEvent>(_onSearchBySerial);
    on<MigrationSearchItemByUuidEvent>(_onSearchByUuid);
  }

  final MigrationRepository repository;

  FutureOr<void> _onGetEvent(MigrationGetEvent event, Emitter<MigrationState> emiter) async  {
    emiter(MigrationLoadState());
    if(repository.migrations == null){
        await repository.getMigrations();
    }
    emiter(MigrationShowState(repository.migrations!));
  }
  FutureOr<void> _onUpdateListEvent(MigrationUpdateListEvent event, Emitter<MigrationState> emiter) async  {
    emiter(MigrationLoadState());
    if(repository.migrations == null){
        await repository.getMigrations();
    }
    emiter(MigrationShowState(repository.migrations!));
  }

  FutureOr<void> _onCreateEvent(MigrationCreateEvent event, Emitter<MigrationState> emiter) async  {
    await repository.createMigration(event.data);
  }

   FutureOr<void> _onSearchBySerial(MigrationSearchItemBySerialEvent event, Emitter<MigrationState> emiter) async  {
    emiter(MigrationLoadState());
    List<ItemData> list = await repository.serchItemsBySerial(event.serial);
    emiter(MigrationShowSearchedState(list));
  }

   FutureOr<void> _onSearchByInternal(MigrationSearchItemByInternalEvent event, Emitter<MigrationState> emiter) async  {
    emiter(MigrationLoadState());
    List<ItemData> list = await repository.serchItemsByInternal(event.internalNumber);
    emiter(MigrationShowSearchedState(list));
  }

   FutureOr<void> _onSearchByUuid(MigrationSearchItemByUuidEvent event, Emitter<MigrationState> emiter) async  {
    emiter(MigrationLoadState());
    List<ItemData> list = await repository.serchItemsByUuid(event.uuid);
    emiter(MigrationShowSearchedState(list));
  }
}