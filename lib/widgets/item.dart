import 'package:flutter/material.dart';


class Item extends StatefulWidget {

final String image;
double width;

Item(this.image, this.width);

  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {

bool pressed = false;

  @override
  Widget build(BuildContext context) {
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
}