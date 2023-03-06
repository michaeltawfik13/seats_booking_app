import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketres/Cubit/login_cubit/states.dart';


class SocialLoginCubit extends Cubit<LoginStates>
{
  SocialLoginCubit(): super(SocialInitialLoginState());


  static SocialLoginCubit get(context) => BlocProvider.of(context);

  // SocialLoginModel? loginModel;

  void userLogin({
    required String? email,
    required String? password,
})
  {
    FirebaseAuth.instance.signInWithEmailAndPassword(email: email!, password: password!).then((value)
    {
      emit(SocialLoginSuccessState(value.user!.uid));
    }).catchError((error)
    {
      emit(SocialLoginErrorState(error.toString()));
    });
  }
  IconData suffix = Icons.visibility;
  bool isPassword = true;
  void changePasswordVisibility()
  {
    isPassword = !isPassword;
    suffix = isPassword ?  Icons.visibility : Icons.visibility_off_outlined;
 emit(SocialChangePasswordState());
  }

}