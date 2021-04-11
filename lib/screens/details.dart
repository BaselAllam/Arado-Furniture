import 'package:arado/models/mainmodel.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';



class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (context, child, MainModel model){
        return Scaffold(
          appBar: AppBar(title: Text('${model.selectedProduct.title}', style: TextStyle(color: Colors.black))),
        );
      }
    );
  }
}