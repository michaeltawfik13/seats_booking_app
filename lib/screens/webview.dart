import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketres/Cubit/cubit/cubit.dart';
import 'package:ticketres/Cubit/cubit/states.dart';
import 'package:webview_flutter/webview_flutter.dart';
class Web_Screen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>(
        builder: (context,state){
          var userModel = SocialCubit.get(context).userModel;
          var id = userModel!.uId;
          var name = userModel!.name;

          return Scaffold(
            appBar: AppBar(title:
            Text('Seket Safar'),),
            body: WebView(
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl: 'https://reserv2.globvar.com?id=$id&name=$name',


            ),
          );
        },
        listener: (context,state){});
  }
}
