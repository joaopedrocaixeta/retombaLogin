
import 'package:flutter/material.dart';
import 'package:loginflutterapp/constants.dart';
import 'package:loginflutterapp/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'login_screen.dart';

class Home extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScopedModelDescendant<UserModel>(
        builder: (context, child, model ){
          if(model.isLoading)
            return Center(child: CircularProgressIndicator(),);

          return Form(
              key: _formKey,
              child: ListView(
                padding: EdgeInsets.all(16.0),
                children: <Widget>[
                  Image(image: AssetImage('assets/images/retomba.jpg')),
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                    style: TextStyle(

                        color: kGrey,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 16.0,),
                  Text("Olá, ${!model.isLoggedIn() ? "" : model.userData["name"]}"),
                  GestureDetector(
                    child:

                    Text(
                      !model.isLoggedIn()? "Entre ou cadastre-se >" : "Sair",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    onTap: (){
                      if(!model.isLoggedIn())
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context)=>LoginScreen() )
                      );
                      else
                        model.signOut();
                    },
                  ),
                  SizedBox(height: 16.0,),




                ],
              )
          );
        },
      )
    );
  }
}


