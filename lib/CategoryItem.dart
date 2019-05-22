import 'package:flutter/material.dart';
import 'package:rectangle/ConvertorScreen.dart';
import 'package:rectangle/Unit.dart';

final _rowHeight = 100.0;
final _borderRadius = BorderRadius.circular(_rowHeight / 2);

class CategoryItem extends StatelessWidget {
  final String itemName;
  final ColorSwatch itemSplashColor;
  final IconData itemIcon;
  final List<Unit> units;

  const CategoryItem({
    Key key,
    @required this.itemName,
    @required this.itemIcon,
    @required this.itemSplashColor,
    @required this.units,
  })  : assert(itemName != null),
        assert(itemIcon != null),
        assert(itemSplashColor != null),
        assert(units != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      color: Colors.transparent,
      child: Container(
        height: _rowHeight,
        child: InkWell(
            borderRadius: _borderRadius,
            splashColor: itemSplashColor,
            highlightColor: itemSplashColor,
            onTap: () {
              _navigateToConvertor(context);
              print('i was tapped');
            },
            child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Icon(
                          itemIcon,
                          size: 60.0,
                        ),
                      ),
                      Center(
                          child: Text(
                        itemName,
                        style: Theme.of(context).textTheme.headline,
                      ))
                    ]))),
      ),
    );
  }

  void _navigateToConvertor(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(itemName, style: Theme.of(context).textTheme.display1),
          centerTitle: true,
          backgroundColor: itemSplashColor,
        ),
        body: ConvertorScreen(
          itemColor: itemSplashColor,
          itemName: itemName,
          units: units,
        ),
      );
    }));
  }
}
