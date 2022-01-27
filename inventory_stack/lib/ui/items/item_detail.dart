
import 'package:flutter/cupertino.dart';
import 'package:inventory_stack/core/models/item.dart';
import 'package:inventory_stack/ui/components/divider.dart';
import 'package:inventory_stack/ui/components/icon_duotone.dart';
import 'package:inventory_stack/ui/items/create_item.dart';
import 'package:inventory_stack/ui/migration/migration_history_element.dart';
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
          middle: Text(widget.data.name),
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
                            const SizedBox(height: 20,),
                            Text(widget.data.description ?? "",
                                style:
                                    CupertinoTheme.of(context).textTheme.textStyle.copyWith(fontStyle: FontStyle.italic)),
                            const SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                              Text("ИНВ№${widget.data.internalNumber}",
                                style: CupertinoTheme.of(context)
                                    .textTheme
                                    .tabLabelTextStyle.copyWith(fontSize: 16)),
                            Text("SN: ${widget.data.serialNumber}",
                                style: CupertinoTheme.of(context)
                                    .textTheme
                                    .tabLabelTextStyle.copyWith(fontSize: 16)),
                            ],)
                          ],
                        ),
                      ),
                      CupertinoButton(
                        child:  Column(
                          children: [
                            const Text("UUID:"),
                            Text("-${widget.data.uuid.split("-")[1]}-"),
                          ],
                        ),
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      if (widget.data.currentPlaceUuid != widget.data.currentPlaceUuid) Column(
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
                  if(widget.data.migrations?.isNotEmpty ?? false)
                  Expanded(
                    child: ListView.builder(
                      itemCount: widget.data.migrations!.length,
                      itemBuilder: (context, index){
                        //return Container();
                          // if (widget.data.currentPlaceUuid != widget.data.rootPlaceUuid){
                            return MigrationListElement(title: false, data: widget.data.migrations![index],);
                          // } else{
                          //   return Container();
                          // }
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