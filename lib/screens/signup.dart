import 'package:flutter/material.dart';



class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

TextEditingController emailController = TextEditingController();
TextEditingController userNameController = TextEditingController();
TextEditingController passwordController = TextEditingController();

GlobalKey<FormState> emailKey = GlobalKey<FormState>();
GlobalKey<FormState> userNameKey = GlobalKey<FormState>();
GlobalKey<FormState> passwordKey = GlobalKey<FormState>();

GlobalKey<FormState> formKey = GlobalKey<FormState>();

bool secure = true;

String gender = 'Select Gender';

bool accepted = false;

DateTime selectedDate = DateTime(1990);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Form(
          key: formKey,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.black,
                  iconSize: 25.0,
                  onPressed: () {
                    Navigator.pop(context);
                  }
                ),
              ),
              Text(
                '   Signup',
                style: TextStyle(color: Colors.black, fontSize: 30.0, fontWeight: FontWeight.bold, height: 2.0),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10.0, top: 10.0),
                height: 200.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('https://img.freepik.com/free-vector/mobile-login-concept-illustration_114360-83.jpg?size=338&ext=jpg'),
                    fit: BoxFit.fill
                  )
                ),
              ),
              field('Email Address', Icons.email, TextInputType.emailAddress, false, emailController, emailKey),
              field('User Name', Icons.account_circle, TextInputType.text, false, userNameController, userNameKey),
              field('Password', Icons.lock, TextInputType.text, secure, passwordController, passwordKey),
              ListTile(
                title: Text(
                  'Birth Date',
                  style: TextStyle(color: Colors.black, fontSize: 20.0)
                ),
                subtitle: Text( selectedDate != null ? 
                  selectedDate.toString() : 'Please Select Date',
                  style: TextStyle(color: Colors.grey, fontSize: 20.0)
                ),
                trailing: Icon(
                  Icons.calendar_today,
                  color: Colors.grey,
                  size: 20.0,
                ),
                onTap: () async {
                  try{
                      var _selectedDate = await showDatePicker(
                      context: context,
                      currentDate: DateTime.now(),
                      lastDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      initialDate: DateTime.now()
                    );
                    setState(() {
                        selectedDate = _selectedDate;
                      });
                  }catch(e){
                    setState(() {
                      selectedDate = DateTime.now();
                    });
                  }
                },
              ),
              ListTile(
                title: Text(
                  'Gender',
                  style: TextStyle(color: Colors.black, fontSize: 20.0)
                ),
                subtitle: Text(
                  '$gender',
                  style: TextStyle(color: Colors.grey, fontSize: 20.0)
                ),
                trailing: PopupMenuButton(
                  icon: Icon(Icons.arrow_downward, color: Colors.grey, size: 18.0),
                  itemBuilder: (BuildContext context) {
                    return <PopupMenuEntry<String>>[
                      PopupMenuItem(
                        child: Text('Male', style: TextStyle(color: Colors.black)),
                        value: 'Male',
                      ),
                      PopupMenuItem(
                        child: Text('Female', style: TextStyle(color: Colors.black)),
                        value: 'Female',
                      ),
                    ];
                  },
                  onSelected: (value) {
                    setState(() {
                      gender = value;
                    });
                  },
                ),
                onTap: () {}
              ),
              ListTile(
                title: Text(
                  'Accept Terms Condition',
                  style: TextStyle(color: Colors.black, fontSize: 20.0)
                ),
                subtitle: Text(accepted == false ? 'Not Accepted' :
                  'Accepted',
                  style: TextStyle(color: Colors.grey, fontSize: 20.0)
                ),
                trailing: Checkbox(
                  activeColor: Colors.black,
                  checkColor: Colors.white,
                  hoverColor: Colors.black,
                  value: accepted,
                  onChanged: (value) {
                    setState(() {
                      accepted = value;
                    });
                  },
                ),
              ),
              FlatButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                color: Colors.black,
                child: Text(
                  'Signup',
                  style: TextStyle(color: Colors.white, fontSize: 20.0)
                ),
                onPressed: () {
                  if(!formKey.currentState.validate()){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        duration: Duration(seconds: 4),
                        content: Text('Some Fields Required?!'),
                      ),
                    );
                  }else{
                  
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
  field(String label, IconData icon, TextInputType type, bool secured, TextEditingController controller, Key key) {
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
          suffixIcon: label == 'Password' ? IconButton(
            icon: Icon(Icons.remove_red_eye),
            color: Colors.grey,
            iconSize: 20.0,
            onPressed: () {
              setState(() {
                secure = !secure;
              });
            }
          ) : null
        ),
        obscureText: secured,
        keyboardType: type,
        textInputAction: TextInputAction.done,
        controller: controller,
      ),
    );
  }
}