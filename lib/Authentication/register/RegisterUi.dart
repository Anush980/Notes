import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:notes/Authentication/login/LoginUi.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Text(
                'Register',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.001),
              Text(
                'Get started by signing up',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              TextField(
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

              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              TextField(
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
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Repeat Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.blueGrey),
                  ),
                  prefixIcon: Icon(Icons.lock),
                ),          
                obscureText: true,
              ),
      
             
              SizedBox(height: MediaQuery.of(context).size.height * 0.06),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  minimumSize: Size(
                    MediaQuery.of(context).size.width * 0.8,
                    50,
                  ),
                ),
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.009),
              
                
                
                    Text('Have an Account Already? '),
                    GestureDetector(onTap: (){
                      Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Login(),
                            ));
                    },child: Text('Login',style: TextStyle(color: Colors.deepPurple),))
                  
                
              
            ],
          ),
        ),
      ),
    );
  }
}
