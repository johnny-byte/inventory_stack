import 'package:flutter/cupertino.dart';
import 'package:inventory_stack/ui/components/search_box.dart';
import 'package:inventory_stack/ui/migration/migration.dart';
import 'package:inventory_stack/ui/places/create_place.dart';
import 'package:inventory_stack/ui/places/detail_place.dart';
import 'package:inventory_stack/utils/icons.dart';

class PlacePage extends StatelessWidget {
  PlacePage({Key? key}) : super(key: key);
  final String title = "Места";

  final isLoad = false;
  final isShowAll = false;
  final isShowFinded = true;
  final List<String> itemsList = ["Hello", "World"];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoPageScaffold(
        child: CustomScrollView(
      slivers: <Widget>[
        CupertinoSliverNavigationBar(
          largeTitle: Text(title),
          trailing: GestureDetector(
              onTap: () {
                Navigator.of(context).push(CupertinoPageRoute(
                    builder: (context) =>  CreatePlacePage(previousTitle: title,)));
              },
              child: MigrationIcons.add),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 600, minWidth: 300),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      SearchBox(type: SearchType.likeName)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        //AWAIT STATE
        if(isLoad) const SliverToBoxAdapter(child: Padding(
          padding: EdgeInsets.all(40.0),
          child: Center(child: CupertinoActivityIndicator()),
        )),
        // //SHOW ALL STATE
        if(isShowAll) PlaceItemList(array: itemsList),
        // //SHOW FINDED STATE
        if(isShowFinded) itemsList.isEmpty ? 
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 600, minWidth: 300),
                  child: Column(
                    children: [
                      MigrationIcons.search,
                      Text("Ничего не найдено",style: CupertinoTheme.of(context).textTheme.tabLabelTextStyle)
                    ],
                  )
                ),
              )
            ],
          ),
        ) :
        PlaceItemList(array: itemsList,)
      ],
    ))
    );
  }
}

class PlaceItemList extends StatelessWidget {
  PlaceItemList({Key? key, required this.array}) : super(key: key);
  final List<String> array;
  
  @override
  Widget build(BuildContext context) {
    return SliverSafeArea(
              top: false,
              minimum: const EdgeInsets.only(top: 1),
              sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return PlaceListElement(
                      //place: array.places[index],
                      traling: CupertinoButton(
                        child: MigrationIcons.right,
                        onPressed: () {
                          Navigator.of(context)
                              .push(CupertinoPageRoute(
                                  builder: (context) => const PlaceDetailPage(
                                        previus: "Места",
                                      )));
                        },
                      ),
                    );
                  },
                  childCount: array.length
                )
              ),
            );
  }
  }

  class PlaceListElement extends StatelessWidget {
  final String place = "some place";
  final Widget traling;

  const PlaceListElement({Key? key, required this.traling}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 600, minWidth: 300),
        margin: const EdgeInsets.symmetric(vertical: 0),
            height: 80,
            width: double.infinity,
            color: CupertinoTheme.of(context).barBackgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text("ROOT place", style: TextStyle(fontSize: 22),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text("CurrenT", style: TextStyle(fontSize: 22, color: CupertinoTheme.of(context).primaryColor, fontWeight: FontWeight.bold),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Room name",
                            style: CupertinoTheme.of(context).textTheme.dateTimePickerTextStyle,
                          ),
                          Text(
                            "description",
                            style: CupertinoTheme.of(context).textTheme.tabLabelTextStyle,
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    traling
                  ],
                ),
                const Spacer(),
                const CustomDivider(),
              ],
            ),
      ),
    );
  }
}