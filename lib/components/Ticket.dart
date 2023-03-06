import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketres/Cubit/cubit/cubit.dart';
import 'package:ticketres/Cubit/cubit/states.dart';

class Ticket extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>(
        builder: (context,state)
        {
          var userModel = SocialCubit.get(context).userModel;

          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 70),
              child: Container(
                height: 500,
                width: 500,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white
                ),
                child: Column(

                  children: [
                    SizedBox(height: 5,),
                    CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage('https://www.saintrefqa.com/wp-content/uploads/2014/02/st_barbara.jpg')
                    ),
                    Text('تذكرتك',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.red),),
                    Text('السبت 1/4/2023',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('${userModel?.name}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                              Text(': الاسم',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                            ],
                          ),
                        ),
                        SizedBox(height: 5,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('${userModel?.phone}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                              Text(': الهاتف',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
                            ],
                          ),
                        ),
                        SizedBox(height: 5,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('L12,L13,L14,L15 ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                              Text(': المقاعد',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
                            ],
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),
          );
        },
        listener: (context,state) {});
  }
}
