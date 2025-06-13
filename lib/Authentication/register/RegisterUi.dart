import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:notes/Authentication/login/LoginUi.dart';
import 'package:email_validator/email_validator.dart';
import 'package:notes/Dashboard/DasboardUi.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/api/api.dart';
import 'package:notes/components/AccountPrompt.dart';
import 'package:notes/components/ButtonView.dart';
import 'package:notes/components/EmailInput.dart';
import 'package:notes/components/FormElement.dart';
import 'package:notes/components/HeroImage.dart';
import 'package:notes/components/PasswordInput.dart';
import 'package:notes/components/TitleView.dart';

import 'package:sonner_flutter/sonner_flutter.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final _confirmPasswordController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  bool obscureText = true;

  @override
  void _register() async {
    if (_formKey.currentState!.validate()) {
      final registerSuccess = await register(
        _emailController.text,
        _passwordController.text,
      );
      if (registerSuccess.status) {
        Toast.success(context, "Register Successful");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (builder) => Login()),
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
                title: "Register Now",
                subtitle: "Get started by signing up",
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
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),

                    //Confirm Password
                    Passwordinput(
                      text: "Password",
                      obText: obscureText,
                      passwordController: _confirmPasswordController,
                      validatorFunc: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        } else if (value != _passwordController.text) {
                          return "Passwords don't match";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.025),

              //Sign up button
              ButtonView(onPressed: () => {_register()}, buttonText: "Sign Up"),
              SizedBox(height: MediaQuery.of(context).size.height * 0.009),

              AccountPrompt(
                onLoginTap:
                    () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      ),
                    },
                promptText: "Have an Account Already?",
                actionText: "Login",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
