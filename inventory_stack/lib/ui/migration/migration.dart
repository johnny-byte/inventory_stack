import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_stack/core/logic/migration/migration_bloc.dart';
import 'package:inventory_stack/core/logic/theme/theme_cubit.dart';
import 'package:inventory_stack/ui/components/search_box.dart';
import 'package:inventory_stack/ui/items/item_list_element.dart';
import 'package:inventory_stack/ui/migration/migration_history_list.dart';
import 'package:inventory_stack/utils/icons.dart';
import 'package:provider/src/provider.dart';

class MigrationsPage extends StatefulWidget {
   const MigrationsPage({Key? key}) : super(key: key);

  @override
  State<MigrationsPage> createState() => _MigrationsPageState();
}

class _MigrationsPageState extends State<MigrationsPage> {
  final Key searchKey = const ValueKey("MigrationSearchBox");

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: const Text('Миграции'),
          trailing: Tooltip(
            message: "Сменить тему",
            child: GestureDetector(onTap: () { 
              context.read<ThemeCubit>().swithTheme();
             },
            child: context.read<ThemeCubit>().repository.isDark ? MigrationIcons.darkTheme : MigrationIcons.lightTheme,),
          )
        ),
        child: BlocBuilder<MigrationBloc, MigrationState>(
          builder: (context, state) {
            if(state is MigrationInitState) context.read<MigrationBloc>().add(MigrationGetEvent());
            return SafeArea(
              child: Center(
                child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: Column(children: [
                      SearchBox(
                        key: searchKey,
                        controller: controller,
                         onClear: (){
                            context.read<MigrationBloc>().add(MigrationUpdateListEvent());
                          },
                          onSearch: (v, t){
                            if(t == SearchType.likeInternalNumber) context.read<MigrationBloc>().add(MigrationSearchItemByInternalEvent(v));
                            if(t == SearchType.likeUuid) context.read<MigrationBloc>().add(MigrationSearchItemByUuidEvent(v));
                            if(t == SearchType.likeSerialNumber) context.read<MigrationBloc>().add(MigrationSearchItemBySerialEvent(v));
                          },
                      ),
                       if (state is MigrationLoadState) const Expanded(child: Center(child: CupertinoActivityIndicator())),
                       if (state is MigrationShowSearchedState) Expanded(child: state.data.isEmpty ? const Center(child: Text("Ничего не найдено"),) : 
                       ListView.builder(
                         itemCount: state.data.length,
                         itemBuilder: (context, index)=> ItemsListElement(data: state.data[index], isMigratory: true,)) 
                       ),
                       if(state is MigrationShowState) Expanded(child: MigrationHistory(list: state.data,))
                    ],)),
              ),
            );
          }
        ));
  }
}



