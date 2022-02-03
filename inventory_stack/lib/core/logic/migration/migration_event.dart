part of 'migration_bloc.dart';

abstract class MigrationEvent extends Equatable {
  const MigrationEvent();

  @override
  List<Object> get props => [];
}


class MigrationGetEvent extends MigrationEvent {}
class MigrationUpdateListEvent extends MigrationEvent {}

class MigrationCreateEvent extends MigrationEvent {
  final MigrationsData data;

  const MigrationCreateEvent(this.data);
}

class MigrationSearchItemBySerialEvent extends MigrationEvent {
  final String serial;

  const MigrationSearchItemBySerialEvent(this.serial);
}
class MigrationSearchItemByInternalEvent extends MigrationEvent {
  final String internalNumber;

  const MigrationSearchItemByInternalEvent(this.internalNumber);
}
class MigrationSearchItemByUuidEvent extends MigrationEvent {
  final String uuid;

  const MigrationSearchItemByUuidEvent(this.uuid);
}