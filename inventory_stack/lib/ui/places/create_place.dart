import 'package:flutter/cupertino.dart';
import 'package:inventory_stack/core/logic/place/place_bloc.dart';
import 'package:inventory_stack/core/models/place.dart';
import 'package:provider/src/provider.dart';

class CreatePlacePage extends StatefulWidget {
  final String previousTitle;
  final PlaceData? place;
  const CreatePlacePage({Key? key, required this.previousTitle, final this.place}) : super(key: key);

  @override
  _CreatePlacePageState createState() => _CreatePlacePageState();
}

class _CreatePlacePageState extends State<CreatePlacePage> {
  late TextEditingController name;
  late TextEditingController description;

  @override
  void initState() {
    name = TextEditingController(text: widget.place?.name);
    description = TextEditingController(text: widget.place?.description);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        automaticallyImplyLeading: true,
        previousPageTitle: widget.previousTitle,
      middle: const Text("Добавить новое"),

      ),
      child: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600, minWidth: 300),
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Container(
                  color: CupertinoTheme.of(context).barBackgroundColor,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Text("Название: "),
                        ),
                        Expanded(
                          child: CupertinoTextField(
                            controller: name,
                            onChanged: (v) {
                              //place.name = v;
                              },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 1,
                ),
                Container(
                  color: CupertinoTheme.of(context).barBackgroundColor,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Text("Описание: "),
                        ),
                        Expanded(
                          child: CupertinoTextField(
                            controller: description,
                            onChanged: (v){
                              //place.description = v
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                CupertinoButton.filled(
                  child: Text(widget.place != null ? "Обновить" : "Сохранить"),
                  onPressed: () async {
                    PlaceData? placeData = PlaceData(
                      uuid: widget.place?.uuid,
                      name: name.text, description: description.text);
                    if(placeData.uuid!=""){
                      context.read<PlaceBloc>().add(UpdatePlaceEvent(placeData));
                    } else{
                      context.read<PlaceBloc>().add(CreatePlaceEvent(placeData));
                    }
                    Navigator.of(context).pop(placeData);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}