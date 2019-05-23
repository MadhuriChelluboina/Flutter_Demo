import 'package:flutter/material.dart';
import 'package:rectangle/Unit.dart';

class ConvertorScreen extends StatefulWidget {
  final String name;
  final Color color;
  final List<Unit> units;

  const ConvertorScreen({
    @required this.name,
    @required this.color,
    @required this.units,
  })  : assert(name != null),
        assert(color != null),
        assert(units != null);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ConvertorScreenState();
  }
}

class _ConvertorScreenState extends State<ConvertorScreen> {
Unit _fromValue;
Unit _toValue;
double _inputValue;
String _convertedValue = '';
List<DropdownMenuItem> _unitMenuItems;
bool _showValidationError = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    final unitWidgets = widget.units.map((Unit unit) {
//      return Container(
//          color: widget.itemColor,
//          margin: EdgeInsets.all(8.0),
//          padding: EdgeInsets.all(16.0),
//          child: Column(
//            children: <Widget>[
//              Text(
//                unit.name,
//                style: Theme.of(context).textTheme.headline,
//              ),
//              Text(
//                'Conversion: ${unit.conversion}',
//                style: Theme.of(context).textTheme.subhead,
//              ),
//            ],
//          ));
//    }).toList();

//    return ListView(
//      children: unitWidgets,
//    );
    final output = Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InputDecorator(
            child: Text(
              _convertedValue,
              style: Theme.of(context).textTheme.display1,
            ),
            decoration: InputDecoration(
              labelText: 'Output',
              labelStyle: Theme.of(context).textTheme.display1,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0.0),
              ),
            ),
          ),
          _createDropdown(_toValue.name, _updateToConversion),
        ],
      ),
    ); 
  
final input = Padding(
  padding: EdgeInsets.all(16.0),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: <Widget>[
      TextField(
        keyboardType: TextInputType.number,
        onChanged: _updateInputValue,
        style: Theme.of(context).textTheme.display1,
        decoration: InputDecoration(labelStyle: Theme.of(context).textTheme.display1,
        errorText: _showValidationError?'invalid number entered':null,
        labelText: 'Input',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0.0),
          )
        ),
      ),
      _createDropdown(_fromValue.name,_updateFromConversion),
    ],
  ),
);
  final arrows = RotatedBox(
    quarterTurns: 1,
    child: Icon(Icons.compare_arrows,size: 40.0,),
  );

  final converter = Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: <Widget>[
      input,
      arrows,
      output,
    ],
  );


  return Padding(
    padding: EdgeInsets.all(16.0),
    child:converter,
  );

  }


@override
void initState() {
  super.initState();
  _createDropdownMenuItems();
  _setDefaults();
}

void _updateInputValue(String value) {
    setState(() {
      if(value==null||value.isEmpty){
        _convertedValue='';
      }else{
        try{
          final inputDouble = double.parse(value);
          _showValidationError = false;
          _inputValue = inputDouble;
          _updateConversion();
        }on Exception catch(e){
          print('Error: $e');
          _showValidationError = true;
        }
      }
    });
  }

  void _updateConversion() {
    setState(() {
      _convertedValue = _format(_inputValue*(_toValue.conversion/_fromValue.conversion));
    });
  }

  String _format(double conversion) {
    var outputNum = conversion.toStringAsPrecision(7);
    if(outputNum.contains('.')&&outputNum.endsWith('0')){
      var i = outputNum.length-1;
      while(outputNum[i]=='0'){
        i-=1;
      }
      outputNum = outputNum.substring(0,i+1);
    }if(outputNum.endsWith('.')){
      return outputNum.substring(0,outputNum.length-1);
    }
    return outputNum;
  }

  void _createDropdownMenuItems() {
    var newItems = <DropdownMenuItem>[];
    for(var unit in widget.units){
      newItems.add(new DropdownMenuItem(value:unit.name,child: Text(unit.name,softWrap: true,)));
      setState(() {
        _unitMenuItems = newItems;
      });
    }
  }

  void _setDefaults() {
    setState(() {
      _fromValue=widget.units[0];
      _toValue=widget.units[1];
    });
  }

 Widget _createDropdown(String currentValue, ValueChanged<dynamic> onChanged) {
    return Container(
      margin: EdgeInsets.only(top: 16.0),
      decoration: BoxDecoration(
        // This sets the color of the [DropdownButton] itself
        color: Colors.grey[50],
        border: Border.all(
          color: Colors.grey[400],
          width: 1.0,
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Theme(
        // This sets the color of the [DropdownMenuItem]
        data: Theme.of(context).copyWith(
          canvasColor: Colors.grey[50],
        ),
        child: DropdownButtonHideUnderline(
          child: ButtonTheme(
            alignedDropdown: true,
            child: DropdownButton(
              value: currentValue,
              items: _unitMenuItems,
              onChanged: onChanged,
              style: Theme.of(context).textTheme.title,
            ),
          ),
        ),
      ),
    );
  }
Unit _getUnit(String unitName) {
  return widget.units.firstWhere(
        (Unit unit) {
      return unit.name == unitName;
    },
    orElse: null,
  );
}

void _updateFromConversion(dynamic unitName) {
  setState(() {
    _fromValue = _getUnit(unitName);
  });
  if (_inputValue != null) {
    _updateConversion();
  }
}

void _updateToConversion(dynamic unitName) {
  setState(() {
    _toValue = _getUnit(unitName);
  });
  if (_inputValue != null) {
    _updateConversion();
  }
}
}
