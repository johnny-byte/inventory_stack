import 'package:flutter/cupertino.dart';
import 'package:inventory_stack/core/logic/place/place_bloc.dart';
import 'package:inventory_stack/core/models/item.dart';
import 'package:inventory_stack/core/models/place.dart';
import 'package:inventory_stack/ui/items/item_list_element.dart';
import 'package:inventory_stack/ui/places/create_place.dart';
import 'package:inventory_stack/utils/icons.dart';
import 'package:provider/src/provider.dart';

class PlaceDetailPage extends StatefulWidget {
  final String previus;
  final PlaceData place;

  const PlaceDetailPage({Key? key, required this.previus, required this.place}) : super(key: key);

  @override
  _PlaceDetailPageState createState() => _PlaceDetailPageState();
}

class _PlaceDetailPageState extends State<PlaceDetailPage> {
  final String title = "Информация";
  bool isLoading = false; // TODO imp load 
  late List<ItemData> items;

  @override
  void initState() {
    super.initState();
    items = context.read<PlaceBloc>().getAllItemsInPlace(widget.place.uuid!);
  } 

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          previousPageTitle: widget.previus,
          middle: Text(title),
          trailing: GestureDetector(child: MigrationIcons.edite, onTap: (){
            Navigator.of(context).push(CupertinoPageRoute(builder: (contex)=> CreatePlacePage(previousTitle: title, place: widget.place,))).then((value) => Navigator.of(context).pop());
          },),
        ),
        child: SafeArea(
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 600, minWidth: 300),
            child: Column(
              children: [
               const SizedBox(height: 15),
                Text(
                    widget.place.name,
                    style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
                ),
                Text(
                    widget.place.description ?? "",
                    style: CupertinoTheme.of(context).textTheme.textStyle,
                ),
                const SizedBox(height: 20),
                if (isLoading) const Center(child: CupertinoActivityIndicator(),),
                if(items.isEmpty && !isLoading) Expanded(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MigrationIcons.empty,
                    Center(child: Text("Нет элементов", style: CupertinoTheme.of(context).textTheme.tabLabelTextStyle,)),
                  ],
                )),

                Expanded(
                      child: ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index){
                          return ItemsListElement(data: items[index],);
                        },
                ))
              ],
            ),
          )),
        ));
  }
}