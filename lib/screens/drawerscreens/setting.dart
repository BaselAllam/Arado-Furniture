import 'package:arado/models/mainmodel.dart';
import 'package:arado/models/product/productcontroller.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scoped_model/scoped_model.dart';


class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {

TextEditingController productNameController = TextEditingController();
TextEditingController priceController = TextEditingController();

GlobalKey<FormState> productNameKey = GlobalKey<FormState>();
GlobalKey<FormState> priceKey = GlobalKey<FormState>();

GlobalKey<FormState> formKey = GlobalKey<FormState>();

PickedFile image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Add Product',
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
        margin: EdgeInsets.all(10.0),
        child: Form(
          key: formKey,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Container(
                height: MediaQuery.of(context).size.height/3,
                width: MediaQuery.of(context).size.width/3,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[200],
                  image: DecorationImage(
                    image: image == null ? AssetImage('assets/logo.jpg') : AssetImage(image.path),
                    fit: BoxFit.fill
                  ),
                ),
                alignment: Alignment.center,
                child: IconButton(
                  icon: Icon(Icons.add_a_photo),
                  color: Colors.black,
                  iconSize: 20.0,
                  onPressed: () {
                    pickPic(ImageSource.camera);
                  }
                )
              ),
                field('Product Name', Icons.text_fields, TextInputType.text, productNameController, productNameKey),
                field('Price', Icons.attach_money, TextInputType.number, priceController, priceKey),
                ScopedModelDescendant(
                  builder: (context, child, MainModel product) {
                    return FlatButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      color: Colors.black,
                      child: product.isAddProductLoading == true ? 
                      Center(child: CircularProgressIndicator()) : 
                       Text(
                        'Add',
                        style: TextStyle(color: Colors.white, fontSize: 20.0)
                      ),
                      onPressed: () async {
                        bool _valid = await product.addProduct(
                          productNameController.text,
                          double.parse(priceController.text),
                          'https://i.guim.co.uk/img/media/2055259f8f957013aac7eb466ddb6064151608cf/492_196_2043_1226/master/2043.jpg?width=445&quality=45&auto=format&fit=max&dpr=2&s=480e1e7f1601deab23541eed014446ca',
                        );
                        if(_valid == true){
                          ScaffoldMessenger.of(context).showSnackBar(snack('Added'));
                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(snack('Error'));
                        }
                      }
                    );
                  }
                ),
            ],
          ),
        ),
      ),
    );
  }
  snack(String content){
    return SnackBar(
      backgroundColor: Colors.red,
      duration: Duration(seconds: 4),
      content: Text(content),
    );
  }
  field(String label, IconData icon, TextInputType type, TextEditingController controller, Key key) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        key: key,
        validator: (value) {
          if(value.isEmpty){
            return 'this field required';
          }else{
            return null;
          }
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1.0),
            borderRadius: BorderRadius.circular(15.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1.0),
            borderRadius: BorderRadius.circular(15.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.0),
            borderRadius: BorderRadius.circular(15.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1.0),
            borderRadius: BorderRadius.circular(15.0),
          ),
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey, fontSize: 15.0),
          prefixIcon: Icon(
            icon,
            color: Colors.grey,
            size: 20.0
          ),
        ),
        keyboardType: type,
        textInputAction: TextInputAction.done,
        controller: controller,
      ),
    );
  }
  pickPic(ImageSource source) async {
    try{
      var _picked = await ImagePicker().getImage(source: source);
      setState(() {
        image = _picked;
      });
    }catch(e){}
  }
}