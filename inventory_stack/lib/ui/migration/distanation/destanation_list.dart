import 'package:flutter/cupertino.dart';
import 'package:inventory_stack/core/models/place.dart';
import 'package:inventory_stack/ui/places/places.dart';

class DestanationList extends StatelessWidget {
  final List<PlaceData> array;

  const DestanationList({Key? key, required this.array}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: array.length,
        itemBuilder: (context, index) => PlaceListElement(
          place: array[index],
          traling: CupertinoButton(
            child: const Text("Выбрать"),
            onPressed: () {
              //BlocProvider.of<PlaceBloc>(context).add(PlaceGetAllEvent());
              Navigator.of(context).pop(array[index].uuid);
            },
          ),
        ),
      ),
    );
  }
}