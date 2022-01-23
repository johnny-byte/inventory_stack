import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_stack/core/logic/place/place_bloc.dart';
import 'package:inventory_stack/core/models/place.dart';
import 'package:inventory_stack/ui/components/search_box.dart';
import 'package:inventory_stack/ui/migration/migration.dart';
import 'package:inventory_stack/ui/places/create_place.dart';
import 'package:inventory_stack/ui/places/detail_place.dart';
import 'package:inventory_stack/utils/icons.dart';

class PlacePage extends StatefulWidget {
  const PlacePage({Key? key}) : super(key: key);

  @override
  State<PlacePage> createState() => _PlacePageState();
}

class _PlacePageState extends State<PlacePage> {
  final String title = "Места";

  final Key searchKey = const ValueKey("PlaceSearchBox");

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: BlocBuilder<PlaceBloc, PlaceState>(
          buildWhen: (state, state2)=>state!=state2,
          builder: (context, state) {
          if(state is PlaceInitialState) context.read<PlaceBloc>().add(GetPlacesEvent());
      return CustomScrollView(
        slivers: <Widget>[
          
          CupertinoSliverNavigationBar(
            largeTitle: Text(title),
            trailing: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                      builder: (context) => CreatePlacePage(
                            previousTitle: title,
                          ))).then((value) => context.read<PlaceBloc>().add(UpdatePlacesListEvent()));
                },
                child: MigrationIcons.add),
          ),
           CupertinoSliverRefreshControl(
            onRefresh: (){
              context.read<PlaceBloc>().add(UpdatePlacesListEvent());
                return Future.value();
            },
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Center(
                  child: ConstrainedBox(
                    constraints:
                        const BoxConstraints(maxWidth: 600, minWidth: 300),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        SearchBox(
                          key: searchKey,
                          controller: controller,
                          type: SearchType.likeName,
                          onClear: (){
                            context.read<PlaceBloc>().add(UpdatePlacesListEvent());
                          },
                          onSearch: (v){
                            context.read<PlaceBloc>().add(SearchPlaceByName(v));
                          },
                          )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          const SliverPadding(padding: EdgeInsets.only(top: 30)),
          //AWAIT STATE
          if (state is PlaceLoadState || state is PlaceInitialState)
            const SliverToBoxAdapter(
                child: Padding(
              padding: EdgeInsets.all(40.0),
              child: Center(child: CupertinoActivityIndicator()),
            )),
          // //SHOW ALL STATE
          if (state is PlacesShowState) PlaceItemList(array: state.data),
          // //SHOW FINDED STATE
          if (state is PlacesShowSearchedState)
            state.data.isEmpty
                ? SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Center(
                          child: ConstrainedBox(
                              constraints: const BoxConstraints(
                                  maxWidth: 600, minWidth: 300),
                              child: Column(
                                children: [
                                  MigrationIcons.search,
                                  Text("Ничего не найдено",
                                      style: CupertinoTheme.of(context)
                                          .textTheme
                                          .tabLabelTextStyle)
                                ],
                              )),
                        )
                      ],
                    ),
                  )
                : PlaceItemList(array: state.data)
        ],
      );
    }));
  }
}

class PlaceItemList extends StatelessWidget {
  const PlaceItemList({Key? key, required this.array}) : super(key: key);

  final List<PlaceData> array;

  @override
  Widget build(BuildContext context) {
    return SliverSafeArea(
      top: false,
      minimum: const EdgeInsets.only(top: 1),
      sliver: SliverList(

          delegate: SliverChildBuilderDelegate((context, index) {
        return PlaceListElement(
          place: array[index],
          traling: CupertinoButton(
            child: MigrationIcons.right,
            onPressed: () {
              Navigator.of(context).push(CupertinoPageRoute(
                  builder: (context) => PlaceDetailPage(
                        previus: "Места",
                        place: array[index],
                      ))).then((value)=>context.read<PlaceBloc>().add(UpdatePlacesListEvent()));
            },
          ),
        );
      }, childCount: array.length)),
    );
  }
}

class PlaceListElement extends StatelessWidget {
  final PlaceData place;
  final Widget traling;

  const PlaceListElement({Key? key, required this.traling, required this.place})
      : super(key: key);
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
            const Spacer(),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    "0",
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "0",
                    style: TextStyle(
                        fontSize: 22,
                        color: CupertinoTheme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        place.name,
                        style: CupertinoTheme.of(context)
                            .textTheme
                            .dateTimePickerTextStyle,
                      ),
                      if(place.description != null) 
                      Text(
                        place.description!,
                        style: CupertinoTheme.of(context)
                            .textTheme
                            .tabLabelTextStyle,
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
