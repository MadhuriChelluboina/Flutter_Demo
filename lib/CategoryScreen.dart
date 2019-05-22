import 'package:flutter/material.dart';
import 'package:rectangle/CategoryItem.dart';
import 'package:rectangle/Unit.dart';

class CategoryScreen extends StatelessWidget {
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
  static const _itemSplashColors = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];

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

    final categoryItems = <CategoryItem>[];
    for (int i = 0; i < _itemNames.length; i++) {
      categoryItems.add(
        CategoryItem(
            itemName: _itemNames[i],
            itemIcon: Icons.cake,
            itemSplashColor: _itemSplashColors[i],
            units: _retriveUnits(_itemNames[i])),
      );
    }

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
