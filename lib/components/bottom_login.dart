import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

  Container buildBottomLogin(Size size) {
    return Container(
      height: size.height*0.27,
      width: size.width,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        color: kLightYellow,
      ),
      child: Stack (
        children: [
          Positioned( 
            bottom: -10,
            right: size.width*0.7,
            child: SvgPicture.asset("assets/icons/arvore.svg",
              height: size.height*0.2,
            )
          ),
          Positioned( 
            bottom: -10,
            right: size.width*0.05,
            child: SvgPicture.asset("assets/icons/edificioazul.svg",
              height: size.height*0.19,
            )
          ),
          Positioned( 
            bottom: -10,
            right: size.width*0.08*-1,
            child: SvgPicture.asset("assets/icons/arvore.svg",
              height: size.height*0.2,
            )
          ),  
        ],
      )
    );
  }