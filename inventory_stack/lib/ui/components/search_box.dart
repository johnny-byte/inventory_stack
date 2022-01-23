import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory_stack/utils/icons.dart';

enum SearchType{
  likeName,
  likeSerialNumber,
  likeInternalNumber,
  likeUuid
}

typedef OnSearchCallback = void Function(String text, SearchType type);

class SearchBox extends StatefulWidget {
  final TextEditingController controller;
  final OnSearchCallback? onSearch;
  final VoidCallback? onClear;
  final SearchType type;

  SearchBox({Key? key, this.type= SearchType.likeInternalNumber, TextEditingController? controller,  this.onSearch,  this.onClear}) : controller = controller ?? TextEditingController(), super(key: key);

  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  late SearchType type;
  late FocusNode focus;

  @override
  void initState() {
    type = widget.type;
    focus = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: type == SearchType.likeName ? 65 : 155,
      child: Column(
        children: [
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: CupertinoTextField(
              controller: widget.controller,
              focusNode: focus,
              placeholder: "Поиск",
              onEditingComplete: (){
                focus.unfocus();
                widget.onSearch?.call(widget.controller.value.text, type);
              },
              suffix: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: widget.controller.value.text.isEmpty ? Tooltip(
                  message: "Найти",
                  waitDuration: const Duration(seconds: 1),
                  child: MigrationIcons.search) : Tooltip(
                  message: "Очистить",
                  waitDuration: const Duration(seconds: 1),
                  child: GestureDetector(child: MigrationIcons.clear, onTap: (){
                    setState(() {
                    widget.controller.clear();
                    focus.unfocus();
                    });
                    widget.onClear?.call();
                  },)
              ),)
            ),
          ),
          if (type != SearchType.likeName) const SizedBox(height: 30),
          if (type != SearchType.likeName)
            CupertinoSegmentedControl(
                groupValue: type,
                children: const {
                  SearchType.likeSerialNumber: Center(
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Text("Серийный номер"))),
                  SearchType.likeInternalNumber: Center(
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Text("Инвентарный номер"))),
                  SearchType.likeUuid: Center(
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Text("UUID"))),
                },
                onValueChanged: (v){
                  setState(() {
                    type = v as SearchType; 
                  });
                }),
        ],
      ),
    );
  }
}