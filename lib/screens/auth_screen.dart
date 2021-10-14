import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:handmade/widgets/auth_form.dart';


class AuthScreen extends StatefulWidget {

  static const String routeName = '/auth';
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  // final _auth = FirebaseAuth.instance;
  bool _isLoading = false;

  void _submitAuthForm(String email, String password, String  username, String phone, bool isLogin,BuildContext context) async {
    var authResult;
    print('saadd');
    try {
      setState(() {
        _isLoading = true;
      });

      if (isLogin) {
        print('saadd //////////////////////////////////');


        authResult = FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);

        print(authResult);
      } else {

        authResult = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email, password: password
        );
        FirebaseFirestore.instance.collection('users').doc(authResult.user.uid).set({
          'username':username,
          // 'phone':phone,
          'email':email,
        });
      }
      setState(() {
        _isLoading = false;
      });
    }  on PlatformException catch (err){
      var message = 'An error occured, please check your credentials';
      print('sad');
      if(err.message != null){
        message = err.message!;
        print(message);
      }

// Scaffold.of(context).showSnackBar(SnackBar(content: Text(message),));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message),));


    } catch (err) {
      print(err);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(err.toString()),));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body:  AuthForm(_submitAuthForm,_isLoading),
    );
  }
}
