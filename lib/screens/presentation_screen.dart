import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loginflutterapp/constants.dart';
import 'package:loginflutterapp/screens/login_screen.dart';

class Presentation1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kDarkRed,
      body: Stack(
        children: <Widget>[ 
          Positioned(
            top: 0,
            child: Container(
              color: kRed,
              width: size.width,
              height: size.height*0.55,
            )
          ),
          Container(
            height: double.infinity,
            padding: EdgeInsets.fromLTRB(40, 40, 40, 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget> [
                //Container(height: 100,color: kDarkRed,),
                RotatedBox(
                  quarterTurns: 3,
                  child: Text(
                    "retomba",
                    style: TextStyle(
                        fontFamily: "Atami",
                        fontSize: 50,
                        color: Colors.white,
                      ),
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  child: SvgPicture.asset("assets/icons/Celular2.svg",height: size.height*0.5,),
                ),
              ]
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: size.height*0.3,
        width: size.width,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: Container(
          padding: EdgeInsets.fromLTRB(40, 20, 40, 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                "Sabe aquele prédio, praça ou cine-ma que marcou a sua infância mas foi demolido para dar lugar a outro edifício? O app retomba te permite revisitar as construções do passado e resgatar as memórias que formam a sua cidade!",
                style: TextStyle(
                  fontSize: 16,

                ),
              ),
              Row(
                children: [
                  Icon(Icons.arrow_back_ios_rounded, color: kGrey,),
                  Expanded(
                    child: SizedBox(),
                  ),
                  IconButton(
                    highlightColor: kLightBlue,
                    splashColor: kLightYellow,
                    icon: Icon(Icons.arrow_forward_ios_rounded), 
                    onPressed: () {  
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginScreen()));
                    },
                  ),
                ]
              )
              
            ],
          ),
        )
      ),
    );
  }
}