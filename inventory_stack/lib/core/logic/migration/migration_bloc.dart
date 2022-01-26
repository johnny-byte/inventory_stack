import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_stack/core/logic/migration/migration_repository.dart';
import 'package:inventory_stack/core/models/migrations.dart';

part 'migration_event.dart';
part 'migration_state.dart';

class MigrationBloc extends Bloc<MigrationEvent, MigrationState>{
  MigrationBloc(this.repository) : super(MigrationInitState()){
    on<MigrationGetEvent>(_onGetEvent);
    on<MigrationCreateEvent>(_onCreateEvent);
  }

  final MigrationRepository repository;

  FutureOr<void> _onGetEvent(MigrationGetEvent event, Emitter<MigrationState> emiter) async  {
    emiter(MigrationLoadState());
    if(repository.migrations == null){
        await repository.getItems();
    }
    emiter(MigrationShowState(repository.migrations!));
  }

  FutureOr<void> _onCreateEvent(MigrationCreateEvent event, Emitter<MigrationState> emiter) async  {
    await repository.createItem(event.data);
  }
}