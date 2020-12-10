import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loginflutterapp/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

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
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Criar Conta no Retomba'),
          centerTitle: true,

        ),
        body: ScopedModelDescendant<UserModel>(
            builder: (context,child, model){
              if(model.isLoading)
                return Center(child: CircularProgressIndicator(),);
              return Form(
                  key: _formKey,
                  child: ListView(
                    padding: EdgeInsets.all(16.0),
                    children: <Widget>[
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                            hintText: "Nome Completo"
                        ),
                        validator: (text){
                          if(text.isEmpty) return "Insira o seu nome completo";
                        },
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                            hintText: "E-mail"
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (text){
                          if(text.isEmpty || !text.contains("@")) return "E-mail inválido";
                        },
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                          controller: _passController,
                          decoration: InputDecoration(
                              hintText: "Senha"
                          ),
                          obscureText: true,
                          validator: (text){
                            if(text.isEmpty || text.length < 6) return "Senha inválida";
                          }
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        controller: _addressController,
                        decoration: InputDecoration(
                            hintText: "Endereço"
                        ),

                        validator: (text){
                          if(text.isEmpty ) return "Infome o seu endereço";
                        },
                      ),

                      SizedBox(height: 16.0,),
                      SizedBox(
                          height: 50.0,
                          child: RaisedButton(
                            child: Text("Criar Conta",
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                            textColor: Colors.white,
                            color: Theme.of(context).primaryColor,
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
                      )

                    ],
                  )
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



