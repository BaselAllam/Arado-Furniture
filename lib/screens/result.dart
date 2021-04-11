import 'package:arado/responsive/responsive.dart';
import 'package:arado/widgets/item.dart';
import 'package:flutter/material.dart';



class Result extends StatefulWidget {

final String className;

Result(this.className);

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {

List<String> images = [
  'https://i.guim.co.uk/img/media/2055259f8f957013aac7eb466ddb6064151608cf/492_196_2043_1226/master/2043.jpg?width=445&quality=45&auto=format&fit=max&dpr=2&s=480e1e7f1601deab23541eed014446ca',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpJvkO6Bvzj2KYCQw6U65vKIpKaXe9B2AfJw&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkUMcNr5fCViBNjtVHJzweed6ViZ4BzRFLzw&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8yQZL4y-57GoTW-wTnVsQkYD0dwu4xKU3zw&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRw9eze6Q9nl6JAti65wFLqdJ-wtPVrXbeqYA&usqp=CAU',
];

List<String> images2 = [
  'https://media.architecturaldigest.com/photos/5f443cc63505a8a74b113615/1:1/w_1280%2Cc_limit/groovy-swivel-chair-o.jpg',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlBQbRG-7WYVsAVg6-nArLwOT3akVWMBs0lNRjPk0NbAW1RxFVq5pbO-AZQFt62lICS0w&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKnCIq6t74LDg5IRbbOodjHBSxhQNyUW9xMA&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPQC5_DPFqj9zyOKzJVeOGevIiTOvcCZLjTA&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcbIkmuRFDv0jxZnhUa2uS_7Nd2OhBW2pbaw&usqp=CAU',
];

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          widget.className,
          style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(color: Colors.black, size: 20.0),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          }, 
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 5.0, right: 5.0),
        child: grid(
          widget.className == 'Best Seller' ? images : images2,
          deviceHeight
        )
      ),
    );
  }
  grid(List<String> list, double deviceHeight) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: responsiveResultRation(deviceHeight)
      ),
      scrollDirection: Axis.vertical,
      itemCount: list.length,
      itemBuilder: (context, index){
        return Item(
          list[index],
          0.0,
          '1'
        );
      }
    );
  }
}