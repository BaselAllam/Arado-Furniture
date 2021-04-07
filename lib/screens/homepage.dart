import 'package:arado/screens/result.dart';
import 'package:arado/widgets/item.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

final Map<int, List> drawerItem = {
  0 : [
    'My Account',
    Icons.account_circle
  ],
  1 : [
    'Settings',
    Icons.settings
  ],
  2 : [
    'Contact Us',
    Icons.phone
  ],
  3 : [
    'About Us',
    Icons.info
  ],
};

List<String> images = [
  'https://i.guim.co.uk/img/media/2055259f8f957013aac7eb466ddb6064151608cf/492_196_2043_1226/master/2043.jpg?width=445&quality=45&auto=format&fit=max&dpr=2&s=480e1e7f1601deab23541eed014446ca',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpJvkO6Bvzj2KYCQw6U65vKIpKaXe9B2AfJw&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkUMcNr5fCViBNjtVHJzweed6ViZ4BzRFLzw&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8yQZL4y-57GoTW-wTnVsQkYD0dwu4xKU3zw&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRw9eze6Q9nl6JAti65wFLqdJ-wtPVrXbeqYA&usqp=CAU',
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black, size: 25.0),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          Icon(
            Icons.search,
          ),
          Icon(
            Icons.shopping_basket,
          ),
        ],
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: drawerItem.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(drawerItem[index][1], color: Colors.black, size: 20.0),
                title: Text(drawerItem[index][0],
                  style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold)
                ),
                trailing: Icon(Icons.navigate_next, color: Colors.grey, size: 25.0),
                onTap: () {
                  Navigator.pushNamed(context, drawerItem[index][0]);
                },
              );
            },
          ),
        ),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          headerSection('Explore'),
          Container(
            height: 250.0,
            margin: EdgeInsets.only(left: 10.0, bottom: 10.0),
            child: scrollItem(),
          ),
          headerSection('Best Seller'),
          Container(
            height: 250.0,
            margin: EdgeInsets.only(left: 10.0, bottom: 10.0),
            child: scrollItem()
          ),
          bestSellerSection()
        ],
      ),
    );
  }
  scrollItem() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: images.length,
      itemBuilder: (context, index){
        return Item(
          images[index],
          MediaQuery.of(context).size.width/2
        );
      },
    );
  }
  bestSellerSection() {
    return Column(
      children: [
        for(var i in images)
          Item(
            i,
            MediaQuery.of(context).size.width
          )
      ],
    );
  }
  headerSection(String title) {
    return ListTile(
      title: Text(
        '$title',
        style: TextStyle(color: Colors.black, fontSize: 30.0, fontWeight: FontWeight.bold)
      ),
      trailing: Text(
        'show all',
        style: TextStyle(color: Colors.grey, fontSize: 18.0, fontWeight: FontWeight.bold)
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) {return Result(title);}));
      },
    );
  }
}