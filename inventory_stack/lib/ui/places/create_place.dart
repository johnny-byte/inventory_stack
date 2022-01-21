import 'package:flutter/cupertino.dart';

class CreatePlacePage extends StatefulWidget {
  final String previousTitle;
  const CreatePlacePage({Key? key, required this.previousTitle}) : super(key: key);

  @override
  _CreatePlacePageState createState() => _CreatePlacePageState();
}

class _CreatePlacePageState extends State<CreatePlacePage> {
  late TextEditingController name;
  late TextEditingController description;


  @override
  void initState() {
    name = TextEditingController();
    description = TextEditingController();
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
                  child: const Text("Сохранить"),
                  onPressed: () async {
                    // var x;
                    // if (isEditor) {
                    //   x = await place.update();
                    // } else {
                    //   x = await place.crete();
                    // }
                    // if (x.statusCode == 201 || x.statusCode == 200) {
                    //   Navigator.of(context).pop(context);
                    // } else {
                    //   print(x.statusCode);
                    // }
                    Navigator.of(context).pop();
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