
import 'package:flutter/cupertino.dart';

class ItemTypesPage extends StatelessWidget {
  final String previus;

  const ItemTypesPage({Key? key, required this.previus}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          previousPageTitle: previus,
          middle: const Text('Тип'),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 1),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600, minWidth: 300),
              child: ListView.builder(
                itemCount: 10,//DeviceTypeList.types.length,
                itemBuilder: (context, index){
                  return const TypeListElement();
                },
                ),
            ),
          ),
        )
        );
  }
}

class TypeListElement extends StatelessWidget {


  const TypeListElement({Key? key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: CupertinoTheme.of(context).barBackgroundColor,
          child: Row(children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: Text("T"),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text("Name", style: CupertinoTheme.of(context).textTheme.textStyle,),
              Text("description", style: CupertinoTheme.of(context).textTheme.tabLabelTextStyle,),
            ],),
            const Spacer(),
            CupertinoButton(child: const Text("Выбрать"), onPressed: (){
              //Navigator.of(context).pop(type.type);
            })
          ],),
        ),
        const SizedBox(height: 1,)
      ],
    );
  }
}