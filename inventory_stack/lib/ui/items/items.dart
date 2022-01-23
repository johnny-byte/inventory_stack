import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_stack/core/logic/item/item_bloc.dart';
import 'package:inventory_stack/core/models/item.dart';
import 'package:inventory_stack/ui/components/not_found_elements.dart';
import 'package:inventory_stack/ui/components/search_box.dart';
import 'package:inventory_stack/ui/items/create_item.dart';
import 'package:inventory_stack/ui/items/item_list_element.dart';
import 'package:inventory_stack/utils/icons.dart';
import 'package:provider/src/provider.dart';

class ItemsPage extends StatefulWidget {
  const ItemsPage({Key? key}) : super(key: key);

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  final String title = "Элементы";

  final Key searchKey = const ValueKey("ItemsSearchBox");

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  CupertinoPageScaffold(
          child: BlocBuilder<ItemBloc, ItemState>(
            buildWhen: (state1, state2) => state1 != state2,
            builder: (context, state) {
              if(state is ItemInitialState) context.read<ItemBloc>().add(ItemsGetEvent());
              return CustomScrollView(
        slivers: <Widget>[
              CupertinoSliverNavigationBar(
                largeTitle: Text(title),
                trailing: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(CupertinoPageRoute(builder: (context) => const CreateItemPage()));
                    },
                    child: MigrationIcons.add),
              ),
              CupertinoSliverRefreshControl(
                onRefresh: (){
                  context.read<ItemBloc>().add(ItemsUpdateEvent());
                    return Future.value();
                },
              ),
              
              //SEARCH BOX
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 600, minWidth: 300),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: SearchBox(
                                key: searchKey,
                                controller: controller,
                                  onClear: () { 
                                      context.read<ItemBloc>().add(ItemsGetEvent());
                                  },
                                  onSearch: (v, type) {
                                    if(type == SearchType.likeInternalNumber) context.read<ItemBloc>().add(ItemSearchByInternalNumberEvent(v));
                                    if(type == SearchType.likeSerialNumber) context.read<ItemBloc>().add(ItemSearchBySerialNumberEvent(v));
                                    if(type == SearchType.likeUuid) context.read<ItemBloc>().add(ItemSearchByUUIDEvent(v));
                                    
                                  },
                                ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),          
              if (state is ItemLoadState) const SliverToBoxAdapter(child: Center(child: CupertinoActivityIndicator())),

              if (state is ItemShowState) ItemList(array: state.data),

              if (state is ItemShowSearchedState) state.data.isEmpty ? const NotFountElements() : ItemList(array: state.data),
        ],
      );
            }
          ));
  }
}

class ItemList extends StatelessWidget {
  final List<ItemData> array;

  const ItemList({Key? key, required this.array}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverSafeArea(
      top: false,
      minimum: const EdgeInsets.only(top: 1),
      sliver: SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
        return ItemsListElement(data:  array[index],);
      }, childCount: array.length)),
    );
  }
}