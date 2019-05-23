import 'package:flutter/material.dart';
import 'package:rectangle/CategoryScreen.dart';

//class HelloRectangle extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Center(
//      child: Container(
//        color: Colors.greenAccent,
//        height: 500.0,
//        width: 400.0,
//        margin: EdgeInsets.all(10.0),
//        child: Center(
//          child: Text(
//            'Madhuri',
//            style: TextStyle(fontSize: 60),
//          ),
//        ),
//      ),
//    );
//  }
//}
//class CategoryRoute extends StatelessWidget{
//
//  static const _categoryNames = <String>[
//    'length',
//    'area',
//    'length',
//    'area','length',
//    'area','length',
//    'area','length',
//    'area','length',
//    'area',
//  ];
//
//  Widget _buildListView(List<Widget> categories){
//    return ListView.builder(itemBuilder: (BuildContext context,int index)=>categories[index],
//    itemCount: categories.length,
//    );
//  }
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    final categories = <CategoryWidget>[];
//
//    final listView = Container(
//      color: Colors.pink,
//      padding: EdgeInsets.symmetric(horizontal: 8.0),
//      child: _buildListView(_categoryNames),
//    );
//
//    final appBar = AppBar(
//      elevation: 0.0,
//      title: Text(
//        'Unit Converter',
//        style: TextStyle(
//          color: Colors.black,
//          fontSize: 30.0,
//        ),
//      ),
//      centerTitle: true,
//      backgroundColor: Colors.greenAccent,
//    );
//    return Scaffold(appBar: appBar,body:listView);
//  }
//
//}
//
//class CategoryWidget extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Material(
//      color: Colors.transparent,
//      child: Container(
//        height: 100.0,
//        margin: EdgeInsets.all(10.0),
//        child: InkWell(
//            borderRadius: BorderRadius.circular(100.0 / 2),
//            highlightColor: Colors.black,
//            splashColor: Colors.grey,
//            onTap: () {
//              print("i was tapped");
//            },
//            child: Row(
//              children: <Widget>[
//                Padding(
//                  padding: const EdgeInsets.all(8.0),
//                  child: Icon(Icons.cake, color: Colors.black, size: 60.0),
//                ),
//                Center(
//                    child: Text(
//                  'initial text',
//                  style: TextStyle(fontSize: 24.0),
//                )),
//              ],
//            )),
//      ),
//    );
//  }
//}
//
//class Items extends StatelessWidget {
//   static const _items = <String>[
//    "cupcake",
//    "donut",
//    "eclair",
//    "froyo",
//    "ginger bread",
//    "honey comb",
//    "ics",
//    "jelly bean",
//    "kitkat",
//    "lollipop",
//    "marshmallow",
//    "nougat",
//    "oreo",
//    "pie",
//  ];
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
////    return ListView.builder(
////        itemCount: _items.length,
////        itemBuilder: (BuildContext context, int index) {
////          return Card(
////            child: Text(_items[index],style:TextStyle(fontSize: 24.0),),
////          );
////        }
////        );
//  return GridView.builder(
//      itemCount: _items.length,
//      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
//      itemBuilder:(BuildContext context,int position){
//        return Card(
//          child:Text(_items[position],style:TextStyle(fontSize: 30.0),)
//        );
//      },
//  );
//  }
//}

//void main() {
//  runApp(
//    MaterialApp(
//      debugShowCheckedModeBanner: false,
//      home:CategoryScreen(),
//    ),
//  );
//}
void main() {
  runApp(UnitConverterApp());
}


class UnitConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unit Converter',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.black,
          displayColor: Colors.grey[600],
        ),
        // This colors the [InputOutlineBorder] when it is selected
        primaryColor: Colors.grey[500],
        textSelectionHandleColor: Colors.green[500],
      ),
      home: CategoryScreen(),
    );
  }
}