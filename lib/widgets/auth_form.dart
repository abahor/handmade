import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {

  bool _isLoading;

  AuthForm(this.submitFn, this._isLoading);

  final void Function (String email,String password,String userName,String _phone, bool isLogin,BuildContext ctx) submitFn;


  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {


  final _formKey = GlobalKey<FormState>();
  var isLogin = true;
  String _userEmail ="";
  String _userphone ="";
  String _userName ="";
  String _userpassword ="";



  void _trySubmit(){
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid){
      _formKey.currentState!.save();
      widget.submitFn(
        _userEmail.trim(),
        _userpassword.trim(),
        _userName.trim(),
        _userphone,
        isLogin,
        context,

      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    key: ValueKey('Email'),
                    validator: (value){
                      if(value == null){
                        return 'Please enter a valid email address.';
                      }
                      if(value.isEmpty || !value.contains('@')){
                        return 'Please enter a valid email address.';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: 'Email address'
                    ),
                    onSaved: (value){
                      _userEmail = value!;
                    },
                  ),

                  if (!isLogin)
                    TextFormField(
                      key: ValueKey('Username'),
                      validator: (value){
                        if(value == null){
                          return 'Please enter a Username.';
                        }
                        if(value.isEmpty ||  value.length < 4 ){
                          return 'Password must be at least 4 characters long.';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: 'Username'
                      ),
                      onSaved: (value){
                        _userName = value!;
                      },
                    ),
                  TextFormField(
                    key: ValueKey('password'),
                    validator: (value){
                      if(value == null){
                        return 'please enter a valid password';
                      }
                      if(value.isEmpty || value.length < 7){
                        return 'Password must be at least 7 characters long';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: 'Password'
                    ),
                    onSaved: (value){
                      _userpassword = value!;
                    },
                    obscureText: true,
                  ),
                  TextFormField(
                    key: ValueKey('phone'),
                    validator: (value){
                      if(value == null){
                        return 'please enter a valid phone';
                      }
                      if(value.isEmpty || value.length < 11){
                        return 'Phone must be at least 11 numbers long';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: 'Phone'
                    ),
                    onSaved: (value){
                      _userphone = value!;
                    },
                    obscureText: true,
                  ),


                  SizedBox(height: 12,),
                  ElevatedButton(

                      onPressed: (){
                        _trySubmit();
                      }, child: Text(isLogin ? 'Login':"Register")
                  ),
                  TextButton(
                    onPressed: (){
                      setState(() {
                        isLogin = !isLogin;
                      });
                    }, style: ButtonStyle(),
                    child: Text( isLogin ?  'Create new account': 'I already have an account' ,style: TextStyle( color: Theme.of(context).primaryColor )),)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
