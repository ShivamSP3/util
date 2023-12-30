import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test/error_handling.dart';

class AuthService{
  void signUpUser({
    required BuildContext context,
    required String email,
    required String name,
    required String password,
  })async{
    try {
      // User user = User(id: '', name: name, email: email, trades: [],
      // token: '', password: password);

      http.Response res = await http.post(Uri.parse('url'),
     // Method 1
      //body: user.toJson(),
      headers: <String ,String>{
        'Content-Type':"application/json; charset=UTF-8"
      }
      );
      httpErrorHandling(response: res,
      context: context, 
      onSuccess: () {
             print('Sign Up Success , Account created login with the same credentials!');
      });
    } catch (e) {
          print(e.toString());
    }
  }
  void signInUser({
    required BuildContext context,
    required String email,
    required String password
  }) async{
    try {
    //  var userProvider = Provider.of<UserProvider>(context,listen: false);
      final navigator = Navigator.of(context);
      http.Response res = await http.post(Uri.parse('api/signin'),
     // alternate method to do this M2
      body: jsonEncode({
        'email': email,
        'password': password
      }),
      headers: <String ,String>{
        'Content-Type':"application/json; charset=UTF-8"
      },
      );
      httpErrorHandling(response: res,
         context: context, onSuccess: ()async {
     
       },);
    } catch (e) {
     print( e.toString());
    }
  }
  // get user data
  void getUserData(BuildContext context)async{
    try {
     

      //  var tokenRes = await http.post(Uri.parse('/tokenIsValid'),
      //  headers: <String ,String>{
      //   'Content-Type':"application/json; charset=UTF-8",

      // },
      //  );
      //  var response = jsonDecode(tokenRes.body);
      //  if (response == true) {
      //    http.Response userRes = await http.get(Uri.parse('${Constants.uri}/')
      //    ,headers: <String ,String>{
      //   'Content-Type':"application/json; charset=UTF-8",
      //   'x-auth-token': token
      // },
      //    );
      //    userProvider.setUser(userRes.body);
      //  }
    } catch (e) {
      //  showSnackBar(context, e.toString());
    }
  }
  void signOut(BuildContext context)async{
  //   final navigator = Navigator.of(context);
  //   SharedPreferences prefs  = await SharedPreferences.getInstance();
  //   prefs.setString('x-auth-token', '');
  //   navigator.pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const LoginScreen(),)
  //   , (route) => false);
  }

}