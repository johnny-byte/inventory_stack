import 'package:flutter/cupertino.dart';
import 'package:inventory_stack/ui/migration/migration.dart';
import 'package:inventory_stack/utils/icons.dart';

class ItemsListElement extends StatefulWidget {
  const ItemsListElement({Key? key,}) : super(key: key);

  @override
  _ItemsListElementState createState() => _ItemsListElementState();
}

class _ItemsListElementState extends State<ItemsListElement> {
  
  getPlaceName(context){
    // return BlocProvider.of<MainBloc>(context).placeArray.fromUuid(widget.data.currentPlace).name;
    return "";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0 ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600, minWidth: 300),
          child: GestureDetector(
            onTap: (){
              //Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>ItemDetailPage(data: widget.data)));
            },
                  child: Container(
              height: 105,
              color: CupertinoTheme.of(context).barBackgroundColor,
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Text("I")//DeviceTypeList.fromInt(widget.data.type).icon,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Device name",
                                        style:  CupertinoTheme.of(context).textTheme.textStyle
                                      ),
                                      const SizedBox(width: 15,),
                                      //if(widget.data.currentPlace != widget.data.rootPlace) MigrationIcons.alert,
                                    ],
                                  ),
                                  Text(
                                    "descripton",
                                    style: CupertinoTheme.of(context).textTheme.tabLabelTextStyle,
                                  ),
                                  const Spacer(),
                                  Text(
                                    "Гимназия 1 ИНВ №123",
                                    style: CupertinoTheme.of(context).textTheme.tabLabelTextStyle,
                                  ),
                                  Text(
                                    "Местоположение: " + getPlaceName(context),
                                    style: CupertinoTheme.of(context).textTheme.tabLabelTextStyle,
                                  ),
                                  const SizedBox(height: 15,)
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Container(
                                height: 100,
                                child: CupertinoButton(
                                  child: MigrationIcons.right,
                                  onPressed: () {
                                    // Navigator.of(context).push(CupertinoPageRoute(
                                    //     builder: (context) => ItemDetailPage(data: widget.data,)));
                                  },
                                )),
                          ),
                        ],
                      ),
                    ),
                    const CustomDivider()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}