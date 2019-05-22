import 'package:flutter/material.dart';
import 'package:rectangle/Unit.dart';

class ConvertorScreen extends StatelessWidget{

  final String itemName;
  final Color itemColor;
  final List<Unit> units;

  const ConvertorScreen(
  {
  @required this.itemName,
  @required this.itemColor,
  @required this.units,
}):assert(itemName!=null),assert(itemColor!=null),assert(units!=null);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final unitWidgets = units.map((Unit unit){
      return Container(
          color: itemColor,
          margin: EdgeInsets.all(8.0),
          padding: EdgeInsets.all(16.0),
          child:Column(
            children: <Widget>[
              Text(unit.name,style: Theme.of(context).textTheme.headline,),
              Text('Conversion: ${unit.conversion}',style: Theme.of(context).textTheme.subhead,),
            ],
          )

      );
    }).toList();

    return ListView(children: unitWidgets,);
  }

}