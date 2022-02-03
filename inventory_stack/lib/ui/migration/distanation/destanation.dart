import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_stack/core/logic/place/place_bloc.dart';
import 'package:inventory_stack/ui/components/search_box.dart';
import 'package:inventory_stack/ui/migration/distanation/destanation_list.dart';
import 'package:inventory_stack/ui/places/create_place.dart';
import 'package:inventory_stack/utils/icons.dart';

class DestinationPage extends StatefulWidget {
  final String previus;

  const DestinationPage({Key? key, required this.previus}) : super(key: key);

  @override
  _DestinationPageState createState() => _DestinationPageState();
}

class _DestinationPageState extends State<DestinationPage> {
  final Key searchKey = const ValueKey("DistanationSearchBox");
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{ 
          context.read<PlaceBloc>().add(GetPlacesEvent());
          Navigator.pop(context);
          return false;
       },
      child: BlocBuilder<PlaceBloc, PlaceState>(
        builder: (context, state) {
          if(state is PlaceInitialState) context.read<PlaceBloc>().add(GetPlacesEvent());
        return CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              previousPageTitle: widget.previus,
              middle: const Text("Места"),
              trailing: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => CreatePlacePage(
                              previousTitle: widget.previus,
                            ))).then((_)=>context.read<PlaceBloc>().add(GetPlacesEvent()));
                  },
                  child: MigrationIcons.add),
            ),
            child: SafeArea(
              child: Center(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 600, minWidth: 300),
                  child: Column(
                    children: [
                      const SizedBox(height: 15,),
                      SearchBox(
                        key: searchKey,
                        type: SearchType.likeName,
                        controller: controller, 
                        onClear: () {
                            context.read<PlaceBloc>().add(UpdatePlacesListEvent());
                          },
                        onSearch: (v,_) {
                            context.read<PlaceBloc>().add(SearchPlaceByName(v));
                        },
                      ),
                      const SizedBox(height: 30,),
                      if (state is PlaceLoadState) const Center(child: CupertinoActivityIndicator(),),
                      if (state is PlacesShowState) DestanationList(array: state.data,),
                      if (state is PlacesShowSearchedState) DestanationList(array: state.data,)
                    ],
                  ),
                ),
              ),
            ));
      }),
    );
  }
}