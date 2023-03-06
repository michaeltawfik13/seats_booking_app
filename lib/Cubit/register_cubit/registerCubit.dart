import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketres/Cubit/login_cubit/cubit.dart';
import 'package:ticketres/Cubit/register_cubit/states.dart';
import 'package:ticketres/Models/login_model.dart';

class SocialRegitserCubit extends Cubit<SocialRegisterStates> {
  SocialRegitserCubit() : super(SocialInitialRegisterState());

  static SocialRegitserCubit get(context) => BlocProvider.of(context);

  void userRegister({
    required String? name,
    required String? email,
    required String? password,
    required String? phone,
    required bool isEmailVerified,
  }) {
    emit(SocialRegisterLoadingState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email!, password: password!).then((value) {
      print(value.user!.email);
      createUser(
        name: name,
        email: email,
        phone: phone,
        uId: value.user!.uid,


      );
      print(value.user!.email);
      //emit(SocialRegisterSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SocialRegisterErrorState(error.toString()));
    });
  }

  void createUser({
    required String? name,
    required String? email,
    required String? phone,
    required String? uId,
  }) {
    TicketUserModel model = TicketUserModel(
      name: name!,
      email: email!,
      phone: phone!,
      uId: uId!,


    );

    FirebaseFirestore.instance.collection('users').doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(SocialCreateUserSuccessState());
    }
    ).catchError((error) {
      emit(SocialCreateUserErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility : Icons.visibility_off_outlined;
    emit(SocialRegisterChangePasswordState());
  }

}