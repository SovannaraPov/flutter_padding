import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';

class DetailApp extends StatefulWidget {
  @override
  _DetailAppState createState() => _DetailAppState();
}

class _DetailAppState extends State<DetailApp> {
  var txtOne = TextEditingController();
  var txtTwo = TextEditingController();
  String result;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Column(
          children: <Widget>[
            // TextField1
            _myTextField(txtOne),
            // TextField2
            _myTextField(txtTwo),
            // CupertinoButton
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: CupertinoButton(
                color: Colors.blueAccent,
                // borderRadius: BorderRadius.all(Radius.circular(30)),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Text('Sum'),
                onPressed: _handleSum,
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  'Result: $result',
                  style: TextStyle(color: Colors.greenAccent, fontSize: 24.0),
                ))
          ],
        ),
      ),
    );
  }

  // _methodName is a private method
  void _handleSum() {
    setState(() {
      var fmt = NumberFormat('\$#,##0.00');

      double valueOne = double.parse(txtOne.text);
      double valueTwo = double.parse(txtTwo.text);
      double sum = valueOne + valueTwo;

      result = fmt.format(sum);
    });
  }

  Padding _myTextField(TextEditingController txt) {
    return Padding(
      padding: EdgeInsets.only(top: 30),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
        ),
        controller: txt,
        keyboardType: TextInputType.number,
      ),
    );
  }
}
