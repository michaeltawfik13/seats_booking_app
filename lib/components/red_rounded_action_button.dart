import 'package:flutter/material.dart';
import 'package:ticketres/screens/webview.dart';
import 'package:ticketres/shared/components.dart';

import '../const.dart';

class RedRoundedActionButton extends StatelessWidget {
  const RedRoundedActionButton({Key? key , required this.text, required this.callback}):super(key: key);

  final String text;

  final Function callback;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: ()
    {
      navigateTo(context, Web_Screen());
    },child:
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.red
          ),
            child: Text('احجز تذكرتك الان',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.white),)),

      );
  }
}
