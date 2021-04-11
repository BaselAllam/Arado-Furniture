import 'package:arado/models/mainmodel.dart';
import 'package:arado/models/product/productcontroller.dart';
import 'package:arado/screens/result.dart';
import 'package:arado/widgets/item.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';


class HomePage extends StatefulWidget {

final MainModel product;
HomePage(this.product);

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
    'Add Product',
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

List<String> images2 = [
  'https://media.architecturaldigest.com/photos/5f443cc63505a8a74b113615/1:1/w_1280%2Cc_limit/groovy-swivel-chair-o.jpg',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlBQbRG-7WYVsAVg6-nArLwOT3akVWMBs0lNRjPk0NbAW1RxFVq5pbO-AZQFt62lICS0w&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKnCIq6t74LDg5IRbbOodjHBSxhQNyUW9xMA&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPQC5_DPFqj9zyOKzJVeOGevIiTOvcCZLjTA&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcbIkmuRFDv0jxZnhUa2uS_7Nd2OhBW2pbaw&usqp=CAU',
];

@override
void initState() {
  widget.product.getProducts();
  super.initState();
}

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
            child: scrollItem(images),
          ),
          headerSection('Best Seller'),
          Container(
            height: 250.0,
            margin: EdgeInsets.only(left: 10.0, bottom: 10.0),
            child: scrollItem(images2)
          ),
          bestSellerSection()
        ],
      ),
    );
  }
  scrollItem(List<String> img) {
    return ScopedModelDescendant(
      builder: (context, child, MainModel product){
        if(product.isGetProductLoading == true){
          return Center(child: CircularProgressIndicator());
        }else if(product.allProducts.isEmpty){
          return Center(child: Text('No Products Found'));
        }else{
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: product.allProducts.length,
            itemBuilder: (context, index){
              return Item(
                product.allProducts[index].image,
                MediaQuery.of(context).size.width/2,
                product.allProducts[index].id
              );
            },
          );
        }
      }
    );
  }
  bestSellerSection() {
    return Column(
      children: [
        for(var i in images)
          Item(
            i,
            MediaQuery.of(context).size.width,
            '1'
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