import 'package:flutter/material.dart';

class InitUserStudySpacePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InitUserStudySpacePageState();
  }
}

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class InitUserStudySpacePageState extends State {
  String _selectedItem = 'Option 1'; // 默认选中项

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("初始化用户学习空间"),
      ),
      body: Column(
        children: [
          Text("你想使用那种语言学习"),
          // ListView(
          //   children: [],
          // )
          ListTile(leading: Icon(Icons.abc), title: Text("汉语"),),
          ListTile(leading: Icon(Icons.abc), title: Text("en语"),)
        ],
      ),
    );
  }
}

// 下拉框 demo展示
class DropdownMenuExample extends StatefulWidget {
  const DropdownMenuExample({super.key});

  @override
  State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
}

class _DropdownMenuExampleState extends State<DropdownMenuExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: list.first,
      onSelected: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}
