import 'package:flutter/cupertino.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Настройки'),
        ),
        child: SafeArea(
                  child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: ListView(
                children: [
                  
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: Text("Пользователь: "),
                  ),
                  Container(
                    color: CupertinoTheme.of(context).barBackgroundColor,
                    height: 80,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        const Text("usrname"),
                        CupertinoButton(child: const Text("Выход"), onPressed: (){
                          //Hive.box(userBox).put("username", "");
                        },)
                      ],),
                    ),
                    ),
                    const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: Text("Глобальные настройки: "),
                  ),
                  Container(
                    color: CupertinoTheme.of(context).barBackgroundColor,
                    height: 80,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        const Text("О приложении"),
                        CupertinoButton(child: const Text("Информация"), onPressed: (){
                          showCupertinoModalPopup(
                            context: context,
                            builder: (context) => CupertinoAlertDialog(
                                  title: const Text("Migration app"),
                                  content: const Center(
                                      child: Padding(
                                        padding: EdgeInsets.all(15.0),
                                        child: Text("""
Date: 26/06/2020,
Dev: maxnemoy,
Build: 123
                                        """),
                                      )),
                                  actions: [
                                    CupertinoButton(
                                        child: const Text("OK"),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        })
                                  ],
                                ));
                        },)
                      ],),
                    ),
                    )
                ],
              ),
            ),
          ),
        ));
  }
}
