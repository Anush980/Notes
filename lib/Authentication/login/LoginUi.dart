import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:notes/Authentication/register/RegisterUi.dart';
import 'package:email_validator/email_validator.dart';
import 'package:notes/Dashboard/DasboardUi.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              LottieBuilder.asset(
                'assets/Login.json',
                height: 250,
                width: 250,
                repeat: false,
                animate: true,
                reverse: false,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Text(
                'Welcome Back,',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.001),
              Text(
                'Please Login In to continue',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              SizedBox(
                width:MediaQuery.of(context).size.width *0.95,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.blueGrey,width: 2),
                      
                      
                    ),
                    prefixIcon: Icon(Icons.email),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              SizedBox(
                width:MediaQuery.of(context).size.width *0.95,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.blueGrey),
                    ),
                    prefixIcon: Icon(Icons.lock),
                  ),               
                  obscureText: true,
                ),
              ),
         
              SizedBox(height: MediaQuery.of(context).size.height * 0.09),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Dashboard(),
                            ));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  minimumSize: Size(
                    MediaQuery.of(context).size.width * 0.8,
                    50,
                  ),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
             
               Text("Don't have an account? "),
                    GestureDetector(onTap: (){
                      Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Register(),
                            ));
                    },child: Text('Register',style: TextStyle(color: Colors.deepPurple),))
              
            ],
          ),
        ),
      ),
    );
  }
}
