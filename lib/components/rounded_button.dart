import 'package:flutter/material.dart';
import 'package:loginflutterapp/constants.dart';

class RoundedButton extends StatelessWidget {
  final Widget child;
  final double height;
  final double width;

  RoundedButton({@required this.child, @required this.height, @required this.width})
      : assert(child != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      width: this.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(this.height / 2)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: kDarkBlue.withOpacity(0.2),
            blurRadius: height / 10,
            offset: Offset(0, height / 15),
          ),
        ],
      ),
      child: this.child,
    );
  }
}