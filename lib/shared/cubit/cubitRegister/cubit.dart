// ignore_for_file: unused_local_variable

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/models/userModel.dart';
import 'package:social_app/shared/cubit/cubitRegister/states.dart';

class RgisterCubit extends Cubit<RegisterStates> {
  RgisterCubit() : super(RegisterInitialState());

  static RgisterCubit get(context) => BlocProvider.of(context);

  void userRegister({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    // try {
    emit(RegisterLoadingState());

    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      createUser(
        name: name,
        email: email,
        password: password,
        phone: phone,
        uId: credential.user!.uid,
      );
      print(credential.user!.email);
      print(credential.user!.emailVerified);
      print(credential.user!.uid);
      emit(RegisterSuccessState());
    } on FirebaseAuthException catch (e) {
      emit(RegisterErrorState(e.toString()));
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      emit(RegisterErrorState(e.toString()));
      print(e);
    }
  }

  void createUser({
    required String email,
    required String password,
    required String name,
    required String phone,
    required String uId,
  }) {
    emit(RegisterCreateUserLoadingState());
    UserModel model = UserModel(
      name: name,
      phone: phone,
      email: email,
      uId: uId,
      bio: "Write your bio ...",
      image:
          "https://media.istockphoto.com/id/1484481140/photo/happy-smiling-young-woman-using-mobile-phone-with-credit-card-for-shopping-and-payment-online.jpg?s=2048x2048&w=is&k=20&c=3CoRtkl73z9UDV6rKoVArCGQsSmyizYXrWz2d_53MfI=",
      cover:
          "https://media.istockphoto.com/id/1484481140/photo/happy-smiling-young-woman-using-mobile-phone-with-credit-card-for-shopping-and-payment-online.jpg?s=2048x2048&w=is&k=20&c=3CoRtkl73z9UDV6rKoVArCGQsSmyizYXrWz2d_53MfI=",
      isEmailVerified: false,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(RegisterCreateUserSuccessState());
    }).catchError((e) {
      emit(RegisterCreateUserErrorState(e.toString()));
      print(e.toString());
    });

    // CollectionReference users = FirebaseFirestore.instance.collection('USERS');
    // users
    //     // .add({
    //     //   'name': name, // John Doe
    //     //   'email': email, // Stokes and Sons
    //     //   'phone': phone, // 42
    //     //   'password': password,
    //     // })
    //     .add(model.toMap())
    //     .then((value) => print("User Added"))
    //     .catchError((error) => print("Failed to add user: $error"));
  }

  IconData suffix = Icons.visibility;
  bool isPasswordShow = true;

  void changePasswordVisibility() {
    isPasswordShow = !isPasswordShow;
    suffix = isPasswordShow ? Icons.visibility : Icons.visibility_off;
    emit(ChangePasswordRegVisibilityState());
  }
}
