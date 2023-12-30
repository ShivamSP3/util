import 'package:flutter/material.dart';
import 'package:test/service/auth.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
    final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final AuthService authService = AuthService();
    final _signUpFormKey = GlobalKey<FormState>();



  void signupUser() {
    authService.signUpUser(
      context: context,
      email: emailController.text,
      password: passwordController.text,
      name: nameController.text,
    );
  }
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: width,
          height: height,
          child: Stack(
            alignment: Alignment.center,
            children: [
            Positioned(
              top: 50,
              child: Container(
                 width:width,
                height: height*0.45,
                decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30) )
                ),               
              ),
            ),
             Positioned(
             top: 200,
               child: Container(
                 decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(20)
                ),     
                height: height*0.6,
                width:width*0.85,
                         ),
             )
            //  
          ],),
        )
      
      ),
    );
  }
}