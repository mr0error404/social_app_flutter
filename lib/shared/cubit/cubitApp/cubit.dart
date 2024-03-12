import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/models/userModel.dart';
import 'package:social_app/modules/chats/chatsScreens.dart';
import 'package:social_app/modules/feeds/feedsScreen.dart';
import 'package:social_app/modules/settings/settingScreen.dart';
import 'package:social_app/modules/users/usersScreen.dart';
import 'package:social_app/shared/components/constant.dart';
import 'package:social_app/shared/cubit/cubitApp/states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  UserModel? model;
  void getUserData() {
    emit(GetUserLoadingState());

    FirebaseFirestore.instance.collection("users").doc(uId).get().then((value) {
      print(value.data());
      model = UserModel.formJson(value.data()!);
      emit(GetUserSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetUserErrorState(error.toString()));
    });
  }

  int currentIndex = 0;

  List<Widget> screens = [
    FeedsScreens(),
    ChatsScreens(),
    UsersScreen(),
    SettingsScreen(),
  ];

  List<String> titles = ["Home", "Chats", "Users", "Settings"];

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(ChangeBottomNavState());
  }
}
