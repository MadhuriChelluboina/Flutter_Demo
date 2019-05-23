import 'package:flutter/material.dart';
import 'package:rectangle/CategoryItem.dart';
import 'package:rectangle/Unit.dart';

class CategoryScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CategoryScreenState();
  }
}

class _CategoryScreenState extends State<CategoryScreen>{
  final categoryItems = <CategoryItem>[];
  static const _itemNames = <String>[
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency',
  ];
//  static const _itemSplashColors = <Color>[
//    Colors.teal,
//    Colors.orange,
//    Colors.pinkAccent,
//    Colors.blueAccent,
//    Colors.yellow,
//    Colors.greenAccent,
//    Colors.purpleAccent,
//    Colors.red,
//  ];

  static const _itemSplashColors = <ColorSwatch>[
    ColorSwatch(0xFF6AB7A8, {
      'highlight': Color(0xFF6AB7A8),
      'splash': Color(0xFF0ABC9B),
    }),
    ColorSwatch(0xFFFFD28E, {
      'highlight': Color(0xFFFFD28E),
      'splash': Color(0xFFFFA41C),
    }),
    ColorSwatch(0xFFFFB7DE, {
      'highlight': Color(0xFFFFB7DE),
      'splash': Color(0xFFF94CBF),
    }),
    ColorSwatch(0xFF8899A8, {
      'highlight': Color(0xFF8899A8),
      'splash': Color(0xFFA9CAE8),
    }),
    ColorSwatch(0xFFEAD37E, {
      'highlight': Color(0xFFEAD37E),
      'splash': Color(0xFFFFE070),
    }),
    ColorSwatch(0xFF81A56F, {
      'highlight': Color(0xFF81A56F),
      'splash': Color(0xFF7CC159),
    }),
    ColorSwatch(0xFFD7C0E2, {
      'highlight': Color(0xFFD7C0E2),
      'splash': Color(0xFFCA90E5),
    }),
    ColorSwatch(0xFFCE9A9A, {
      'highlight': Color(0xFFCE9A9A),
      'splash': Color(0xFFF94D56),
      'error': Color(0xFF912D2D),
    }),
  ];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < _itemNames.length; i++) {
      categoryItems.add(
        CategoryItem(
            itemName: _itemNames[i],
            itemIcon: Icons.cake,
            itemSplashColor: _itemSplashColors[i],
            units: _retriveUnits(_itemNames[i])),
      );
    }
  }

  Widget _buildItemsList(List<Widget> categoryItems) {
    return ListView.builder(
        itemCount: categoryItems.length,
        itemBuilder: (BuildContext context, int index) {
          return categoryItems[index];
        });
  }

//return a list of mock units
  List<Unit> _retriveUnits(String itemName) {
    return List.generate(5, (int i) {
      i += 1;
      return Unit(name: '$itemName Unit$i', conversion: i.toDouble());
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final listView = Container(
      color: Colors.green[100],
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: _buildItemsList(categoryItems),
    );

    final appBar = AppBar(
      elevation: 0.0,
      title: Text(
        'Unit Convertor',
        style: TextStyle(fontSize: 30.0, color: Colors.black),
      ),
      centerTitle: true,
      backgroundColor: Colors.green[100],
    );

    return Scaffold(
      appBar: appBar,
      body: listView,
    );
  }

}
