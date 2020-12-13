import 'package:flutter/material.dart';
import 'package:loginflutterapp/components/rounded_button.dart';
import 'package:loginflutterapp/components/bottom_login.dart';
import 'package:loginflutterapp/components/text_field_decoration.dart';
import 'package:loginflutterapp/models/user_model.dart';
import 'package:loginflutterapp/screens/signup_screen.dart';
import 'package:scoped_model/scoped_model.dart';
import '../constants.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ScopedModelDescendant<UserModel>(
        builder: (context, child, model ){
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
                          //SizedBox(height: size.height*0.20),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Entrar', 
                              style: TextStyle(color:kDarkBlue,fontSize: 20,fontWeight: FontWeight.w700),
                            )
                          ),
                          SizedBox(height: 10.0),
                          TextFormField(
                            decoration: buildTextFormDecoration("E-mail"),
                            cursorColor: kDarkBlue,
                            keyboardType: TextInputType.emailAddress,
                            validator: (text){
                              if(text.isEmpty || !text.contains("@")) return "E-mail inválido";
                            },
                          ),
                          
                          TextFormField(
                              decoration: buildTextFormDecoration("Senha"),
                              cursorColor: kDarkBlue,
                              obscureText: true,
                              validator: (text){
                                if(text.isEmpty || text.length < 6) return "Senha inválida";
                              }
                          ),
                          
                          Align(
                              alignment: Alignment.centerRight,
                              child: FlatButton(
                                onPressed: (){},
                                child: 
                                Text("Esqueci minha senha",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: kDarkBlue,

                                  ),
                                textAlign: TextAlign.right,),
                                padding: EdgeInsets.zero,
                              )
                              
                          ),
                          SizedBox(height: 16.0,),
                          RoundedButton(
                            height: 40,
                            width: size.width,
                            child: FlatButton(
                              height: 40.0,
                              color: kYellow,
                              shape: StadiumBorder(),
                              child: Text("Entrar",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w700,
                                  color: kDarkBlue,
                                ),
                              ),

                              onPressed: (){
                                if(_formKey.currentState.validate()){
                                }
                                model.signIn();
                              },
                            )
                          ),
                          Align(
                              alignment: Alignment.center,
                              child: FlatButton(
                                child: RichText(
                                  text: TextSpan(
                                    text: 'Não tem conta? ',
                                    style: TextStyle(
                                      color: kDarkBlue,
                                      fontFamily: 'montserrat',
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(text: 'Registrar', style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                                
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>SignUpScreen()));
                                },
                              )
                          ),
                        ],
                      ),
                    )
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: buildBottomLogin(size),
                  )
                ]
              ),
            ),
          );
        },
      )
    );
  }

  
}
