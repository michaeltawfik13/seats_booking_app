import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:ticketres/Cubit/cubit/states.dart';
import 'package:ticketres/Models/login_model.dart';
import 'package:ticketres/Models/seats_model.dart';
import 'package:ticketres/shared/components/constants.dart';

class SocialCubit extends Cubit<SocialStates> {
  SocialCubit() : super(SocialInitialState());

  static SocialCubit get(context) => BlocProvider.of(context);

   TicketUserModel? userModel;

  void getUserData() {
    emit(SocialGetUserLoading());

    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      print(value.data());
      userModel = TicketUserModel.fromJson(value.data()!);
      emit(SocialGetUserSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(SocialGetUserError(error.toString()));
    });
  }

  int CurrentIndex = 0;

  // List<Widget> screens = [
  //   NewsFeedScreen(),
  //   ChatsScreen(),
  //   NewPOstScreen(),
  //   UsersScreen(),
  //   SettingsScreen(),
  // ];

  void updateSeat({
    required String? uId,
    required String? status,
}){
    SeatsModel model = SeatsModel(
        uId: uId!,
        status: status!
    );
    FirebaseFirestore.instance.collection('seats').doc(uId).get().then((value) {
      model = SeatsModel.fromJeson(value.data()!);
      print(model.status);
    }).catchError((error)
    {
      print(error.toString());
    });
  }

  void updateUser({
    required String? name,
    required String? phone,
    required String? email,
  }) {
    TicketUserModel model = TicketUserModel(
      name: name!,
      phone: phone!,
      uId: userModel!.uId,
      email: userModel!.uId,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel!.uId)
        .update(model.toMap())
        .then((value) {
      getUserData();
    }).catchError((onError) {
      emit(SocialUpdateUserErrorState());
    });
  }



  // void createPost({
  //   required String? dateTime,
  //   required String? text,
  //   String? postImage,
  // }) {
  //   emit(SocialCreatePostLoading());
  //   PostModel model = PostModel(
  //     name: userModel!.name,
  //     uId: userModel!.uId,
  //     image: userModel!
  //         .image, // law image == null استخدم الصوره الاساسيه userModel!.image
  //     dateTime: dateTime!,
  //     postImage: postImage ?? '',
  //     text: text!, // law image == null استخدم الصوره الاساسيه userModel!.cover
  //   );
  //   FirebaseFirestore.instance
  //       .collection('posts')
  //       .add(model.toMap()) // set هتخليه يعمل doc و يحط فيه البوست
  //       .then((value) {
  //     emit(SocialCreatePostSuccess());
  //   }).catchError((onError) {
  //     emit(SocialCreatePostError());
  //   });
  // }

  // List<PostModel> posts = [];
  // List<String> postId = [];
  // List<int> likes = [];
  // List<int> comments = [];

  // void getPosts() {
  //   FirebaseFirestore.instance
  //       .collection('posts')
  //       .orderBy('dateTime')
  //       .get()
  //       .then((value) {
  //     value.docs.forEach((element) {
  //       element.reference.collection('Likes').get().then((value) {
  //         likes.add(value.docs.length);
  //         postId.add(element.id);
  //         posts.add(PostModel.fromJson(element.data()));
  //       });
  //     });
  //
  //     emit(SocialGetPostsSuccess());
  //   }).catchError((error) {
  //     emit(SocialGetPostsError(error.toString()));
  //   });
  // }

  // void postLikes(String postId) {
  //   FirebaseFirestore.instance
  //       .collection('posts')
  //       .doc(postId)
  //       .collection('Likes')
  //       .doc(userModel?.uId)
  //       .set({'Like': true}).then((value) {
  //     emit(SocialLikesPostsSuccess());
  //   }).catchError((error) {
  //     emit(SocialLikesPostsError(error.toString()));
  //   });
  // }

  List<TicketUserModel> users = [];

  void getUsers() {
    if (users.length == 0)
      FirebaseFirestore.instance.collection('users').get().then((value) {
        value.docs.forEach((element) {
          // if(element.data()['uId'] != userModel?.uId) // علشان يجيب كل الusers ماعدا user بتاعي انا
          users.add(TicketUserModel.fromJson(element.data()));
        });
        emit(SocialGetAllUserSuccess());
      }).catchError((error) {
        emit(SocialGetAllUserError(error.toString()));
      });
  }


}
