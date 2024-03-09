import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/shared/cubit/cubitLogin/states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  void userLogin({
    required String email,
    required String password,
  }) async {
    emit(
      LoginLoadingState(),
    );
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print(credential.user!.email);
      print(credential.user!.uid);

      emit(
        // LoginSuccessState(credential.user!.uid),
        LoginSuccessState(credential.user!.uid),
      );
    } on FirebaseAuthException catch (e) {
      emit(LoginErrorState(e.toString()));
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
  //
  //
  //
  //
  //
  //
  // void userLogin({
  //   required String email,
  //   required String password,
  // }) async {
  //   print("------Start-----Login-");
  //   emit(
  //     LoginLoadingState(),
  //   );
  //   try {
  //     final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //     print("--------------------- token ----------");
  //     // print(credential.credential!.token);
  //     emit(
  //       LoginSuccessState(credential.user!.uid),
  //     );
  //   } on FirebaseAuthException catch (e) {
  //     print("---------------error---------");
  //     emit(LoginErrorState(e.toString()));
  //     if (e.code == 'user-not-found') {
  //       print('No user found for that email.');
  //     } else if (e.code == 'wrong-password') {
  //       print('Wrong password provided for that user.');
  //     }
  //   }

  // DioHelper.postData(
  //   url: LOGIN,
  //   data: {
  //     "email": email,
  //     "password": password,
  //   },
  // ).then(
  //   (value) {
  //     loginModel = LoginModel.fromJson(json: value.data);
  //     print("------Value------");
  //     print(loginModel?.data?.name);
  //     print(loginModel?.data?.id);
  //     print(loginModel?.data?.token);
  //     print(loginModel?.message);
  //     // print(value.data['message']);
  //     // print(value.data['data']['phone']);
  //     // print(value.data['data']['token']);
  //     print(value.toString());
  //     emit(
  //       LoginSuccessState(loginModel),
  //     );
  //   },
  // ).catchError((error) {
  //   print("------Error------");
  //   print(error.toString());
  //   emit(
  //     LoginErrorState(
  //       error.toString(),
  //     ),
  //   );
  // });
// }

  IconData suffix = Icons.visibility;
  bool isPasswordShow = true;

  void changePasswordVisibility() {
    isPasswordShow = !isPasswordShow;
    suffix = isPasswordShow ? Icons.visibility : Icons.visibility_off;
    emit(LoginChangePasswordVisibilityState());
  }
}
