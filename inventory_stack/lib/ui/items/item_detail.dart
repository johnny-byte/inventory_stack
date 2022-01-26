
import 'package:flutter/cupertino.dart';
import 'package:inventory_stack/core/models/item.dart';
import 'package:inventory_stack/ui/components/icon_duotone.dart';
import 'package:inventory_stack/ui/items/create_item.dart';
import 'package:inventory_stack/ui/migration/migration.dart';
import 'package:inventory_stack/utils/icons.dart';

class ItemDetailPage extends StatefulWidget {
  const ItemDetailPage({Key? key, required this.data}) : super(key: key);

  final ItemData data;

  @override
  _ItemDetailPageState createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
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
                      IconDuotone(icon: widget.data.type?.icon),
                      const SizedBox(width: 40),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              widget.data.name,
                              style: CupertinoTheme.of(context)
                                  .textTheme
                                  .navLargeTitleTextStyle,
                            ),
                            Text(widget.data.description ?? "",
                                style:
                                    CupertinoTheme.of(context).textTheme.textStyle),
                            Text("Гим ИНВ№${widget.data.internalNumber}",
                                style: CupertinoTheme.of(context)
                                    .textTheme
                                    .tabLabelTextStyle),
                            Text("SN: ${widget.data.serialNumber}",
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
                                    content: Center(
                                        child: Text(widget.data.uuid)),
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
                            widget.data.rootPlace?.name ?? "",
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
                            widget.data.currentPlace?.name ?? "",
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
                        if (widget.data.currentPlaceUuid != widget.data.rootPlaceUuid){
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