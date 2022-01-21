import 'package:flutter/cupertino.dart';
import 'package:inventory_stack/ui/types/types.dart';

class CreateItemPage extends StatelessWidget {
  const CreateItemPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        previousPageTitle: "Устройва",
        middle: Text("Добавить новое"),
      ),
      child: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600, minWidth: 300),
            child: Column(
              children: [
                const SizedBox(height: 15),
                Container(
                  color: CupertinoTheme.of(context).barBackgroundColor,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Тип:"),
                        CupertinoButton(
                          child: const Text("Type name"),
                          onPressed: () {
                            Navigator.of(context).push(CupertinoPageRoute(
                                builder: (context) => const ItemTypesPage(
                                      previus: "Назад",
                                    )));
                          },
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  color: CupertinoTheme.of(context).barBackgroundColor,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: const [
                        Expanded(child: Text("Название:")),
                        Expanded(
                          child: CupertinoTextField(),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 1),
                Container(
                  color: CupertinoTheme.of(context).barBackgroundColor,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: const [
                        Expanded(
                          child: Text("Описание: "),
                        ),
                        Expanded(
                          child: CupertinoTextField(),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 1,),
                Container(
                  color: CupertinoTheme.of(context).barBackgroundColor,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: const [
                        Expanded(child: Text("Инвентарный номер: ")),
                        Expanded(
                          child: CupertinoTextField(),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 1),
                Container(
                  color: CupertinoTheme.of(context).barBackgroundColor,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: const [
                        Expanded(child: Text("Серийный номер: ")),
                        Expanded(child: CupertinoTextField())
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  color: CupertinoTheme.of(context).barBackgroundColor,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Основное местоположение: "),
                        // CupertinoButton(
                        //   child:Text(item.rootPlace.length != 0 ? (BlocProvider.of<MainBloc>(context).placeArray.fromUuid(item.rootPlace).name) : "Выбрать"),
                        //   onPressed: () {
                        //     Navigator.of(context).push(CupertinoPageRoute(
                        //         builder: (context) => DestinationPage(
                        //               previus: "Назад",
                        //             ))).then((value){
                        //               setState(() {
                        //                 if (value != null){
                        //                   item.rootPlace = value;
                        //                 }
                        //               });
                        //             });
                        //   },
                        // )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                CupertinoButton.filled(
                  child: const Text("Сохранить"),
                  onPressed: () async{
                    // if (item.name.length == 0){
                    //   showCupertinoModalPopup(
                    //         context: context,
                    //         builder: (context) => CupertinoAlertDialog(
                    //               title: Text("Ошибка"),
                    //               content: Center(
                    //                   child: Padding(
                    //                     padding: const EdgeInsets.all(15.0),
                    //                     child: Text("Название не может быть пустым"),
                    //                   )),
                    //               actions: [
                    //                 CupertinoButton(
                    //                     child: Text("OK"),
                    //                     onPressed: () {
                    //                       Navigator.of(context).pop();
                    //                     })
                    //               ],
                    //             ));
                    // } else if (item.rootPlace.length == 0){
                    //     showCupertinoModalPopup(
                    //         context: context,
                    //         builder: (context) => CupertinoAlertDialog(
                    //               title: Text("Ошибка"),
                    //               content: Center(
                    //                   child: Padding(
                    //                     padding: const EdgeInsets.all(15.0),
                    //                     child: Text("Не указанно основное местоположение"),
                    //                   )),
                    //               actions: [
                    //                 CupertinoButton(
                    //                     child: Text("OK"),
                    //                     onPressed: () {
                    //                       Navigator.of(context).pop();
                    //                     })
                    //               ],
                    //             ));
                    // } else {
                    //   var x; 
                    //   if(isEdite){
                    //     x = await item.update();
                    //   } else{
                    //     x = await item.crete();
                    //   }
                    //   if (x.statusCode == 201 || x.statusCode == 200){
                    //     Navigator.of(context).pop(context);
                    //   } else {
                    //     print(x.statusCode);
                    //   }
                    // }
                  }
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}