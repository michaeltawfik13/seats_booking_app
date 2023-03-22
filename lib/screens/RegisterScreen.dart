
//import 'package:conditional_builder/conditional_builder.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketres/Cubit/register_cubit/registerCubit.dart';
import 'package:ticketres/Cubit/register_cubit/states.dart';
import 'package:ticketres/screens/buy_ticket.dart';
import 'package:ticketres/screens/home_screen.dart';
import 'package:ticketres/shared/network/remote/end_points.dart';

import '../components/components.dart';

class RegisterationScreen extends StatelessWidget {

  var  formkey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var chNameController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SocialRegitserCubit(),
      child: BlocConsumer<SocialRegitserCubit,SocialRegisterStates>(
        listener: (context,state)
        {
          if(state is SocialCreateUserSuccessState)
          {
            navigateAndFinish(context, MyHomePage());
            showToast(text: 'Congratulations', state: ToastStates.SUCCESS);
          } else
          {
            //showToast(text: 'Error through Registration', state: ToastStates.ERROR);
          }
        },
        builder: (context,state)
        {
          return  Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Register',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          Text('Register now to reserve your seat',
                              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                color: Colors.grey,  //copyWith بعدل بيها علي الاصل بتاعه
                              )
                          ),
                          SizedBox(
                            height: 30,),
                          defaultFormField(
                              controller: nameController,
                              type: TextInputType.name,
                              validate: (String value)
                              {
                                if(value.isEmpty)
                                {
                                  return "Name must not be empty";
                                }
                              },
                              labelText: 'UserName',
                              prefix: Icons.person),

                          SizedBox(
                            height: 30,),

                          defaultFormField(
                              controller: emailController,
                              type: TextInputType.emailAddress,
                              validate: (String value)
                              {
                                if(value.isEmpty)
                                {
                                  return "Email must not be Empty";
                                }
                              },
                              labelText: 'Email Address',
                              prefix: Icons.email_outlined),
                          SizedBox(
                            height: 30,),
                          defaultFormField(
                              controller: passwordController,
                              type: TextInputType.visiblePassword,
                              suffix: SocialRegitserCubit.get(context).suffix,

                              isPassword: SocialRegitserCubit.get(context).isPassword,
                              suffixPressed: ()
                              {
                                SocialRegitserCubit.get(context).changePasswordVisibility();
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
                            height: 30,),

                          defaultFormField(
                              controller: phoneController,
                              type: TextInputType.phone,
                              validate: (String value)
                              {
                                if(value.isEmpty)
                                {
                                  return "Phone must not be Empty";
                                }
                              },
                              labelText: 'Phone Number',
                              prefix: Icons.phone),
                          SizedBox(
                            height: 30,),

                          defaultFormField(
                              controller: chNameController,
                              type: TextInputType.text,
                              validate: (String value)
                              {
                                if(value.isEmpty)
                                {
                                  return "Church Name must not be Empty";
                                }
                              },
                              labelText: 'اسم الكنيسه',
                              prefix: Icons.church),

                          SizedBox(
                            height: 15,),

                          ConditionalBuilder(
                            condition: state is! SocialRegisterLoadingState,
                            builder: (context) => Container(
                              height: 50,
                              width: double.infinity,
                              child: MaterialButton(
                                onPressed: ()
                                {
                                  if(formkey.currentState!.validate())
                                  {
                                    SocialRegitserCubit.get(context).userRegister(
                                        name: nameController.text,
                                        email: emailController.text,
                                        password: passwordController.text,
                                        phone: phoneController.text,
                                        chName: chNameController.text ,
                                        isEmailVerified: false, );

                                  }

                                },
                                child:Text('Register',
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),) ,

                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(0.0),
                                  color: Colors.blue),

                            ),

                            fallback: (context) => Center(child:CircularProgressIndicator(),),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },

      ),
    );
  }
}

