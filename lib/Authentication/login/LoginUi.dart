import 'package:flutter/material.dart';
import 'package:notes/Authentication/register/RegisterUi.dart';
import 'package:notes/Dashboard/DasboardUi.dart';
import 'package:notes/api/api.dart';
import 'package:notes/components/AccountPrompt.dart';
import 'package:notes/components/ButtonView.dart';
import 'package:notes/components/EmailInput.dart';
import 'package:notes/components/HeroImage.dart';
import 'package:notes/components/PasswordInput.dart';
import 'package:notes/components/TitleView.dart';
import 'package:notes/database/EncryptedDatabase.dart';

import 'package:sonner_flutter/sonner_flutter.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  bool obscureText = true;

  @override
  void _register() async {
    if (_formKey.currentState!.validate()) {
      final registerSuccess = await login(
        _emailController.text,
        _passwordController.text,
      );

      if (registerSuccess.status) {
        EncryptedDatabase.instance.write(
          "token",
          registerSuccess.data["token"],
        );
        EncryptedDatabase.instance.write("isLoginDone", true);
        Toast.success(context, "Login Successful");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (builder) => Dashboard()),
        );
      } else {
        Toast.error(context, registerSuccess.message);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              // Hero iMAGE / Lottie assets
              HeroImage(),

              // Title and subtitle
              TitleView(
                title: "Welcome Back",
                subtitle: "Please login to continue",
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.03),

              Form(
                key: _formKey,
                child: Column(
                  children: [
                    //Email Field
                    EmailInput(emailController: _emailController),

                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),

                    //Password Input
                    Passwordinput(
                      text: "Password",
                      obText: obscureText,
                      passwordController: _passwordController,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                        child: () {
                          if (obscureText) {
                            return const Icon(Icons.visibility_outlined);
                          } else {
                            return const Icon(Icons.visibility_off_outlined);
                          }
                        }(),
                      ),
                      validatorFunc: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        } else if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.025),

              //Sign up button
              ButtonView(onPressed: () => {_register()}, buttonText: "Login"),
              SizedBox(height: MediaQuery.of(context).size.height * 0.009),

              AccountPrompt(
                onLoginTap:
                    () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Register()),
                      ),
                    },
                promptText: "Don't have an Account?",
                actionText: "Register",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
