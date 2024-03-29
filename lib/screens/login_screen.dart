//import 'package:conditional_builder/conditional_builder.dart';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ticketres/Cubit/login_cubit/cubit.dart';
import 'package:ticketres/Cubit/login_cubit/states.dart';
import 'package:ticketres/screens/RegisterScreen.dart';
import 'package:ticketres/screens/buy_ticket.dart';
import 'package:ticketres/screens/home_screen.dart';
import 'package:ticketres/shared/components.dart';
import 'package:ticketres/shared/network/local/cache_helper.dart';


class SocialLoginScreen extends StatelessWidget {

//Hello2
  var formkey =GlobalKey<FormState>();
  var emialController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (BuildContext context) => SocialLoginCubit(),
      child: BlocConsumer<SocialLoginCubit,LoginStates>(
        listener: (BuildContext context, state)
        {
          if(state is SocialLoginErrorState)
          {
            //showToast(text: state.error, state: ToastStates.ERROR);
          }
          if(state is SocialLoginSuccessState)
          {
            CacheHelper.saveData(
              key: 'uId',
              value: state.uId,
            ).then((value)
            {
              navigateAndFinish(context, MyHomePage());
            });

          }

        },
        builder: (BuildContext context, Object? state) {
          return Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('LOGIN',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Text('Login now to reserve your seat',
                            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Colors.grey,  //copyWith بعدل بيها علي الاصل بتاعه
                            )
                        ),
                        SizedBox(
                          height: 30,),
                        defaultFormField(
                            controller: emialController,
                            type: TextInputType.emailAddress,
                            validate: (String value)
                            {
                              if(value.isEmpty)
                              {
                                return "Username must not be Empty";
                              }
                            },
                            labelText: 'Email Address',
                            prefix: Icons.email_outlined),
                        SizedBox(
                          height: 30,),
                        defaultFormField(
                            controller: passwordController,
                            type: TextInputType.visiblePassword,
                            suffix: SocialLoginCubit.get(context).suffix,

                            isPassword: SocialLoginCubit.get(context).isPassword,
                            suffixPressed: ()
                            {
                              SocialLoginCubit.get(context).changePasswordVisibility();
                            },
                            validate: (String value)
                            {
                              if(value.isEmpty)
                              {
                                return "Password is too short";
                              }

                            },
                            labelText: 'Password',
                            prefix: Icons.lock_outline),
                        SizedBox(
                          height: 15,),
                        ConditionalBuilder(
                          condition: true,//state is! ShopLoginLoadingState,
                          builder: (context) => Container(
                            height: 50,
                            width: double.infinity,
                            child: MaterialButton(
                              onPressed: ()
                              {
                                if(formkey.currentState!.validate())
                                {
                                  SocialLoginCubit.get(context).userLogin(
                                      email: emialController.text,
                                      password: passwordController.text);
                                }
                              },
                              child:Text('Login',
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),) ,

                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(0.0),
                                color: Colors.blue),

                          ),

                          fallback: (context) =>
                              Center(child:CircularProgressIndicator(),),
                        ),
                        SizedBox(
                          height: 15,),
                        Text('Don\'t have an account?'),
                        TextButton(
                            onPressed: ()
                            {
                              navigateTo(context, RegisterationScreen());
                            },
                            child: Text('Register')),
                        SizedBox(height: 85,),
                        Center(
                          child: Column(
                            children: [
                              Text('©'),
                              Text('Michael Tawfik '),
                              Text('Nader Nagy '),
                              Text('Peter Ayad '),
                              Text('Refaat Erian '),
                            ],
                          ),
                        ),



                      ],
                    ),
                  ),
                ),
              ),
            ),
          );},

      ),
    );
  }
}
