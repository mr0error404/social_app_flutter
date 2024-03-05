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
    print("------Start RegisterLoadingState --- register--1-");
    emit(
      RegisterLoadingState(),
    );
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("------Start-   -- register--2-");
      // emit(RegisterSuccessState());
      userCreate(
        email: email,
        phone: phone,
        name: name,
        uId: credential.user!.uid,

      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      emit(RegisterErrorState(e.toString()));
      print(e.toString());
    }
  }

  /// In the provided Dart code snippet, there seems to be a typo in the function declaration. The
  /// keyword `voi` is not a valid keyword in Dart. It should be `void` instead.

  IconData suffix = Icons.visibility;
  bool isPasswordShow = true;

  void changePasswordVisibility() {
    isPasswordShow = !isPasswordShow;
    suffix = isPasswordShow ? Icons.visibility : Icons.visibility_off;
    emit(ChangePasswordRegVisibilityState());
  }

  void userCreate({
    required String email,
    required String name,
    required String phone,
    required String uId,
    bool isEmailVerified= false ,
  }) async {
    print("-------------------------- Create User --------------------------");
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uId)
          .set({
            'name': name,
            'email': email,
            'phone': phone,
            'uId': uId,
        'isEmailVerified':isEmailVerified

          })
          .then((value) => emit(RegisterCreateUserSuccessState()))
          .catchError(
              (error) => emit(RegisterCreateUserErrorState(error.toString())));
    } catch (e) {
      emit(RegisterCreateUserErrorState(e.toString()));
    }
  }
}
