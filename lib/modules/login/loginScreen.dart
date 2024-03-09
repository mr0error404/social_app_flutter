// ignore_for_file: unnecessary_string_escapes

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:social_app/layout/home/layoutApp.dart';
import 'package:social_app/modules/register/registerScreen.dart';
import 'package:social_app/shared/components/components.dart';
import 'package:social_app/shared/cubit/cubitLogin/cubit.dart';
import 'package:social_app/shared/cubit/cubitLogin/states.dart';
import 'package:social_app/shared/network/local/cacheHelper.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginErrorState)
            ShowToast(
              text: state.error,
              state: ToastStates.ERROR,
            );
          //
          if (state is LoginSuccessState) {
            // navigateAndFinish(
            //   context,
            //   LayoutApp(),
            // );

//
//
            CacheHelper.saveDate(
              key: "uId",
              value: state.uId,
            ).then(
              (value) {
                print("-----> " + state.uId);
                navigateAndFinish(
                  context,
                  LayoutApp(),
                );
              },
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Login",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Text(
                          "login now to communicate with friends",
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: Colors.grey,
                                  ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),

                        /// The `defaultFormField` function is being called with several parameters to create a form
                        /// field for entering an email address. Here is a breakdown of the parameters being passed:
                        defaultFormField(
                          textEditingController: emailController,
                          prefix: Icons.email,
                          type: TextInputType.emailAddress,
                          validation: (String? value) {
                            if (value!.isEmpty) {
                              return "Please enter your email address";
                            }
                            return null;
                          },
                          label: "Email",
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        defaultFormField(
                          textEditingController: passwordController,
                          prefix: Icons.lock,
                          sufixs: LoginCubit.get(context).suffix,
                          isPassword: LoginCubit.get(context).isPasswordShow,
                          sufixFunction: () {
                            LoginCubit.get(context).changePasswordVisibility();
                          },
                          onSubmitted: (value) {
                            if (formKey.currentState!.validate()) {
                              LoginCubit.get(context).userLogin(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                          type: TextInputType.emailAddress,
                          validation: (String? value) {
                            if (value!.isEmpty) {
                              return "Please enter your password";
                            }
                            return null;
                          },
                          label: "Password",
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        ConditionalBuilder(
                          condition: state is! LoginLoadingState,
                          fallback: (context) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                          builder: (context) => defaultButton(
                            text: "login",
                            width: double.infinity,
                            back: HexColor("#FFBF2F"),
                            function: () {
                              if (formKey.currentState!.validate()) {
                                LoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don\'t have an account ?",
                            ),
                            defaultTextButton(
                              function: () {
                                /// The `navigateTo` function is likely a custom function in your codebase that
                                /// is used for navigating to a different screen or route within your Flutter
                                /// application.
                                navigateTo(
                                  context,
                                  RegisterScreen(),
                                );
                              },
                              text: "register",
                            ),
                          ],
                        ),
                      ],
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
