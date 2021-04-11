import 'package:arado/models/mainmodel.dart';
import 'package:arado/screens/details.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';


class Item extends StatefulWidget {

final String image;
final String id;
double width;

Item(this.image, this.width, this.id);

  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {

bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (context, child, MainModel model){
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0))
          ),
          width: widget.width,
          margin: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 170.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                    image: NetworkImage(widget.image),
                    fit: BoxFit.fill
                  )
                ),
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(pressed == false ? Icons.favorite_border : Icons.favorite),
                  color: Colors.red,
                  iconSize: 20.0,
                  onPressed: () {
                    model.selectProduct(widget.id);
                    Navigator.push(context, MaterialPageRoute(builder: (_) {return Details();}));
                    setState(() {
                      pressed = !pressed;
                    });
                  }
                ),
              ),
              Text(
                'Chair',
                style: TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Text(
                '200 \$',
                style: TextStyle(color: Colors.grey, fontSize: 18.0, fontWeight: FontWeight.normal),
              ),
            ],
          ),
        );
      }
    );
  }
}