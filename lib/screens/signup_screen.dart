import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loginflutterapp/components/bottom_login.dart';
import 'package:loginflutterapp/components/rounded_button.dart';
import 'package:loginflutterapp/components/text_field_decoration.dart';
import 'package:loginflutterapp/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

import '../constants.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _addressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      body: ScopedModelDescendant<UserModel>(
        builder: (context,child, model){
          if(model.isLoading)
            return Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(kYellow)),);
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: size.height),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:<Widget>[
                  Form(
                    key: _formKey,
                    child: Container(
                      padding: EdgeInsets.all(40.0),
                      child: Column(
                        children: <Widget>[
                          //SizedBox(height: size.height*0.15),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Registrar', 
                              style: TextStyle(color:kDarkBlue,fontSize: 20,fontWeight: FontWeight.w700),
                            )
                          ),
                          SizedBox(height: 10.0),
                          TextFormField(
                            controller: _nameController,
                            decoration: buildTextFormDecoration("Nome Completo"),
                            cursorColor: kDarkBlue,
                            keyboardType: TextInputType.name,
                            validator: (text){
                              if(text.isEmpty) return "Insira o seu nome completo";
                            },
                          ),
                          TextFormField(
                            controller: _emailController,
                            decoration: buildTextFormDecoration("E-mail"),
                            cursorColor: kDarkBlue,
                            keyboardType: TextInputType.emailAddress,
                            validator: (text){
                              if(text.isEmpty || !text.contains("@")) return "E-mail inválido";
                            },
                          ),
                          TextFormField(
                            controller: _passController,
                            decoration: buildTextFormDecoration("Senha"),
                            cursorColor: kDarkBlue,
                            obscureText: true,
                            keyboardType: TextInputType.name,
                            validator: (text){
                              if(text.isEmpty || text.length < 6) return "Senha inválida";
                            },
                          ),
                          TextFormField(
                            controller: _addressController,
                            decoration: buildTextFormDecoration("Endereço"),
                            cursorColor: kDarkBlue,
                            validator: (text){
                              if(text.isEmpty ) return "Infome o seu endereço";
                            },
                          ),
                          SizedBox(height: 40.0,),
                          RoundedButton(
                            height: 40,
                            width: size.width,
                            child: FlatButton(
                              height: 40.0,
                              color: kYellow,
                              shape: StadiumBorder(),
                              child: Text("Registrar",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w700,
                                  color: kDarkBlue,
                                ),
                              ),

                              onPressed: (){
                                if(_formKey.currentState.validate()){
                                  Firestore.instance.collection("mensagens").document().setData({
                                    'nome': _nameController.text,
                                    'endereco' : _addressController.text,
                                    'email': _emailController.text,
                                    'pass': _passController.text
                                  });
                                  Map<String, dynamic> userData = {
                                    "name": _nameController.text,
                                    "email": _emailController.text,
                                    "address": _addressController.text,

                                  };
                                  model.signUp(
                                      userData: userData,
                                      pass: _passController.text,
                                      onSuccess: _onSuccess,
                                      onFail: _onFail);
                                  }
                                },
                            )
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: FlatButton(
                              child: RichText(
                                text: TextSpan(
                                  text: 'Já tem conta? ',
                                  style: TextStyle(
                                    color: kDarkBlue,
                                    fontFamily: 'montserrat',
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(text: 'Entrar', style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginScreen()));
                              },
                            )
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: buildBottomLogin(size),
                  )
                ],
              ),
            ),
          );
        }
      )
    );
  }

  void _onSuccess(){
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(content: Text("Usuário criado com sucesso!"),
        backgroundColor: Theme.of(context).primaryColor,
        duration: Duration(seconds: 5),
      )
    );
    Future.delayed(Duration(seconds: 2)).then((_){
      Navigator.of(context).pop();
    });
  }
  void _onFail(){
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(content: Text("Falha ao criar usuário"),
        backgroundColor: Colors.redAccent,
        duration: Duration(seconds: 5),

      )
    );
  }
}



