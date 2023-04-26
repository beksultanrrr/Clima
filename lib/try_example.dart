import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyWidget extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
      String myMargin = "l";
  late double? myMarginAsDouble;
  try{
    myMarginAsDouble = double.parse(myMargin);
  }
  catch(e){
    print(e);
  }
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(myMarginAsDouble = null ?? 10),
        color: Colors.red,
      ),
    );
  }
}
