import 'package:flutter/material.dart';

class CustomPageRoute extends PageRouteBuilder {
  final String routeName;

  CustomPageRoute({required this.routeName})
      : super(
            transitionDuration: const Duration(milliseconds: 500),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secAnimation,
                Widget child) {
              animation = CurvedAnimation(
                  parent: animation, curve: Curves.fastLinearToSlowEaseIn);
              return ScaleTransition(
                scale: Tween<double>(begin: 0.0, end: 1.0).animate(animation),
                child: child,
              );
            },
            pageBuilder: (BuildContext context, Animation<double> animation,
                    Animation<double> secAnimation) =>
                SizedBox.shrink());
}

void getPage(BuildContext context, String routeName) {
  Navigator.pushNamed(context, routeName);
}
