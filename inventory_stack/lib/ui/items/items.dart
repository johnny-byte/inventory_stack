import 'package:flutter/cupertino.dart';
import 'package:inventory_stack/ui/components/search_box.dart';
import 'package:inventory_stack/ui/items/create_item.dart';
import 'package:inventory_stack/ui/items/item_list_element.dart';
import 'package:inventory_stack/utils/icons.dart';

class ItemsPage extends StatelessWidget {
  const ItemsPage({Key? key}) : super(key: key);
  final String title = "Элементы";
  final bool isLoad = false;
  final bool isShow = true;

  @override
  Widget build(BuildContext context) {
    return  CupertinoPageScaffold(
          child: CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            largeTitle: Text(title),
            trailing: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(CupertinoPageRoute(builder: (context) => const CreateItemPage()));
                },
                child: MigrationIcons.add),
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
                              onClear: () { 
                                // BlocProvider.of<ItemBloc>(context).add(ItemGetAllEvent());
                              },
                              onSearch: () {
                                // if (controller.value.text.length <= 2) {
                                //   BlocProvider.of<ItemBloc>(context).add(ItemGetAllEvent());
                                // } else {
                                //   BlocProvider.of<ItemBloc>(context).add(ItemFindEvent(request: controller.value.text, type: type));
                                // }
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
          if (isLoad) const SliverToBoxAdapter(child: Center(child: CupertinoActivityIndicator())),

          if (isShow) const ItemList(array: ["Hello", "World"]),
        ],
      ));
  }
}

class ItemList extends StatelessWidget {
  final List<String> array;

  const ItemList({Key? key, required this.array}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverSafeArea(
      top: false,
      minimum: const EdgeInsets.only(top: 1),
      sliver: SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
        return const ItemsListElement();
      }, childCount: array.length)),
    );
  }
}