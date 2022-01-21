
import 'package:flutter/cupertino.dart';
import 'package:inventory_stack/ui/items/create_item.dart';
import 'package:inventory_stack/ui/migration/migration.dart';
import 'package:inventory_stack/utils/icons.dart';

class ItemDetailPage extends StatefulWidget {
  const ItemDetailPage({Key? key,}) : super(key: key);

  @override
  _ItemDetailPageState createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
  getRootPlaceName(context){
    // if (widget.data.rootPlace.length != 0){
    //   return BlocProvider.of<MainBloc>(context).placeArray.fromUuid(widget.data.rootPlace).name;
    // }
    return "no parsed name";
  }

  getCurrentPlaceName(context){
    // if (widget.data.currentPlace.length != 0){
    //   return BlocProvider.of<MainBloc>(context).placeArray.fromUuid(widget.data.currentPlace).name;
    // }
    return "no parsed name";
  }
  bool isMigration = true;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
         //BlocProvider.of<ItemBloc>(context).add(ItemGetAllEvent());
         Navigator.pop(context);
         return false;
      },
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          previousPageTitle: "Устройства",
          middle: const Text("Детальная информация"),
          trailing: GestureDetector(child: MigrationIcons.edite, onTap: (){
            Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>const CreateItemPage()));
          },),
        ),
        child: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600, minWidth: 300),
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      const SizedBox(width: 15),
                      //DeviceTypeList.fromInt(widget.data.type).icon,
                      const Text("I"),
                      const SizedBox(width: 40),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "NAME",
                              style: CupertinoTheme.of(context)
                                  .textTheme
                                  .navLargeTitleTextStyle,
                            ),
                            Text("DESCR",
                                style:
                                    CupertinoTheme.of(context).textTheme.textStyle),
                            Text("Гим ИНВ№ 123",
                                style: CupertinoTheme.of(context)
                                    .textTheme
                                    .tabLabelTextStyle),
                            Text("SN: 123",
                                style: CupertinoTheme.of(context)
                                    .textTheme
                                    .tabLabelTextStyle),
                          ],
                        ),
                      ),
                      CupertinoButton(
                        child: const Text("UUID"),
                        onPressed: () {
                          showCupertinoModalPopup(
                              context: context,
                              builder: (context) => CupertinoAlertDialog(
                                    title: const Text("UUID"),
                                    content: const Center(
                                        child: Text("uuid-uuid-uuid")),
                                    actions: [
                                      CupertinoButton(
                                          child: const Text("OK"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          })
                                    ],
                                  ));
                        },
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                            MigrationIcons.home,
                          Text(
                            getRootPlaceName(context),
                            style: CupertinoTheme.of(context)
                                .textTheme
                                .tabLabelTextStyle,
                          ),
                        ],
                      ),
                      if (true) Column(
                        children: [
                          MigrationIcons.location,
                          Text(
                            getCurrentPlaceName(context),
                            style: CupertinoTheme.of(context)
                                .textTheme
                                .tabLabelTextStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const CustomDivider(),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Text("Миграции:",
                            style: CupertinoTheme.of(context)
                                .textTheme
                                .navTitleTextStyle),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index){
                        if (isMigration){
                          return const MigrationListElement(title: false,);
                        } else{
                          return Container();
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}