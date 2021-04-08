import 'package:arado/screens/homepage.dart';
import 'package:arado/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

GlobalKey<FormState> emailKey = GlobalKey<FormState>();
GlobalKey<FormState> passwordKey = GlobalKey<FormState>();

GlobalKey<FormState> formKey = GlobalKey<FormState>();

bool secure = true;

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
              Text(
                '   Login',
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
              field('Password', Icons.lock, TextInputType.text, secure, passwordController, passwordKey),
              // Builder(
              //   builder: (BuildContext context) {
              //     return FlatButton(
              //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              //       color: Colors.black,
              //       child: Text(
              //         'Login',
              //         style: TextStyle(color: Colors.white, fontSize: 20.0)
              //       ),
              //       onPressed: () {
              //         if(!formKey.currentState.validate()){
              //           Scaffold.of(context).showSnackBar(
              //             SnackBar(
              //               backgroundColor: Colors.red,
              //               duration: Duration(seconds: 4),
              //               content: Text('Some Fields Required?!'),
              //             ),
              //           );
              //         }else{
              //           Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {return HomePage();}));
              //         }
              //       },
              //     );
              //   },
              // ),
              FlatButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                color: Colors.black,
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 20.0)
                ),
                onPressed: () async {
                  if(!formKey.currentState.validate()){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        duration: Duration(seconds: 4),
                        content: Text('Some Fields Required?!'),
                      ),
                    );
                  }else{
                    SharedPreferences _user = await SharedPreferences.getInstance();
                    _user.setString('email', emailController.text);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {return HomePage();}));
                  }
                },
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap : () {},
                  child: Text(
                    'Forgot Password?!',
                    style: TextStyle(color: Colors.black, fontSize: 20.0, height: 2.0),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    Text(
                        'Dont\'t Have An Account?',
                        style: TextStyle(color: Colors.grey, fontSize: 20.0, height: 2.0),
                      ),
                    InkWell(
                      onTap : () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) {return SignUp();}));
                      },
                      child: Text(
                        '  Sign up',
                        style: TextStyle(color: Colors.black, fontSize: 20.0, height: 2.0),
                      ),
                    ),
                  ],
                ),
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