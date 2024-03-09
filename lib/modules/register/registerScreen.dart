import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:social_app/layout/home/layoutApp.dart';
import 'package:social_app/modules/login/loginScreen.dart';
import 'package:social_app/shared/components/components.dart';
import 'package:social_app/shared/cubit/cubitRegister/cubit.dart';
import 'package:social_app/shared/cubit/cubitRegister/states.dart';
import 'package:social_app/shared/network/local/cacheHelper.dart';

class RegisterScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RgisterCubit(),
      child: BlocConsumer<RgisterCubit, RegisterStates>(
          listener: (context, state) {
        if (state is RegisterCreateUserSuccessState) {
          navigateAndFinish(
            context,
            LayoutApp(),
          );
          // if (state is RegisterCreateUserSuccessState) {
          //   CacheHelper.saveDate(
          //     key: 'uId',
          //     value:state.,
          //   ).then(
          //         (value) {
          //       navigateAndFinish(
          //         context,
          //         LayoutApp(),
          //       );
          //     },
          //   );
          // }
        //   // if (state.loginModel?.status ?? false) {
        //   //   print(state.loginModel?.message);
        //   //   print(state.loginModel?.data?.token);
        //   //   CacheHelper.saveDate(
        //   //           key: "token", value: state.loginModel?.data?.token)
        //   //       .then((value) {
        //   //     token = state.loginModel!.data!.token!;
        //   //     navigateAndFinish(
        //   //       context,
        //   //       ShopLayout(),
        //   //     );
        //   //   });
        //   //   ShowToast(
        //   //     text: state.loginModel!.message ?? "",
        //   //     state: ToastStates.SUCCESS,
        //   //   );
        //   // } else {
        //   //   print(state.loginModel?.message);
        //   //   ShowToast(
        //   //     text: state.loginModel!.message ?? "",
        //   //     state: ToastStates.ERROR,
        //   //   );
          // }
        }
      }, builder: (context, state) {
        return Scaffold(
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
                        "REGISTER",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Text(
                        "Register now to communicate with friends",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Colors.grey,
                            ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),

                      /// The `defaultFormField` function is being called with several parameters to create a form
                      /// field for entering an email address. Here is a breakdown of the parameters being passed:
                      defaultFormField(
                        textEditingController: nameController,
                        prefix: Icons.person,
                        type: TextInputType.name,
                        validation: (String? value) {
                          if (value!.isEmpty) {
                            return "Please enter your name ";
                          }
                          return null;
                        },
                        label: "Name",
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      defaultFormField(
                        textEditingController: phoneController,
                        prefix: Icons.phone,
                        type: TextInputType.number,
                        validation: (String? value) {
                          if (value!.isEmpty) {
                            return "Please enter your phone ";
                          }
                          return null;
                        },
                        label: "Phone",
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      defaultFormField(
                        textEditingController: emailController,
                        prefix: Icons.email,
                        type: TextInputType.emailAddress,
                        validation: (String? value) {
                          if (value!.isEmpty) {
                            return "Please enter your phone ";
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
                        // sufixs: ShopCubit.get(context).suffix,
                        // isPassword: ShopCubit.get(context).isPasswordShow,
                        // sufixFunction: () {
                        //   // ShopRgisterCubit.get(context)
                        //   //     .changePasswordVisibility();
                        // },
                        // onSubmitted: (value) {
                        //   // if (formKey.currentState!.validate()) {
                        //   //   RgisterCubit.get(context).userLogin(
                        //   //     email: emailController.text,
                        //   //     password: passwordController.text,
                        //   //   );
                        //   // }
                        // },
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
                        // condition: true,
                        condition: state is! RegisterLoadingState,
                        fallback: (context) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        builder: (context) => defaultButton(
                          text: "Register",
                          width: double.infinity,
                          back: HexColor("#FFBF2F"),
                          function: () {
                            if (formKey.currentState!.validate()) {
                              RgisterCubit.get(context).userRegister(
                                email: emailController.text,
                                password: passwordController.text,
                                name: nameController.text,
                                phone: phoneController.text,
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
                          Text(
                            "your have an account ?",
                          ),
                          defaultTextButton(
                            function: () {
                              navigateTo(
                                context,
                                LoginScreen(),
                              );
                            },
                            text: "Login",
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
      }),
    );
  }
}
