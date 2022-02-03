part of 'migration_bloc.dart';

abstract class MigrationState extends Equatable {
  const MigrationState();

  @override
  List<Object> get props => [];
}


class MigrationInitState extends MigrationState {}
class MigrationLoadState extends MigrationState {}

class MigrationShowState extends MigrationState {
  final List<MigrationsData> data;

  const MigrationShowState(this.data);
}

class MigrationShowSearchedState extends MigrationState {
  final List<ItemData> data;

  const MigrationShowSearchedState(this.data);
}