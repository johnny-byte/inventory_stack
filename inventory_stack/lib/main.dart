import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:inventory_stack/core/api/api.dart';
import 'package:inventory_stack/core/models/item.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(App());
}

class App extends StatelessWidget {
  App({ Key? key }) : super(key: key);
  final ApiClient apiClient = ApiClient();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: Column(
        children: [
          Text(dotenv.get('SERVER')),

          ElevatedButton(onPressed: ()async{
            var items = await apiClient.items();
            debugPrint(items.length.toString());
            items.where((element) => element.type.name.toLowerCase().contains("теле")).forEach((element) {
              debugPrint(element.name);
            });
            
          }, child: const Text("get all items")),
          ElevatedButton(onPressed: ()async{
            var items = await apiClient.places();
            debugPrint(items.length.toString());
          }, child: const Text("get all places")),
          ElevatedButton(onPressed: ()async{
            var items = await apiClient.typesAll();
            debugPrint(items.length.toString());
          }, child: const Text("get all types")),
          ElevatedButton(onPressed: ()async{
            var items = await apiClient.migrations();
            debugPrint(items.length.toString());
          }, child: const Text("get all migrations")),
        ],
      ),),
    );
  }
}
