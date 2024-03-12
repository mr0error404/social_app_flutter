// ignore_for_file: prefer_const_constructors

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/shared/components/components.dart';
import 'package:social_app/shared/cubit/cubitApp/cubit.dart';
import 'package:social_app/shared/cubit/cubitApp/states.dart';
import 'package:social_app/shared/style/icon_broken.dart';

class LayoutApp extends StatelessWidget {
  const LayoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              cubit.titles[cubit.currentIndex],
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  IconBroken.Notification,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  IconBroken.Search,
                ),
              ),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (int index) {
              cubit.changeBottomNav(index);
            },
            items: const [
              BottomNavigationBarItem(
                label: "Home",
                icon: Icon(
                  IconBroken.Home,
                ),
              ),
              BottomNavigationBarItem(
                label: "Chat",
                icon: Icon(
                  IconBroken.Chat,
                ),
              ),
              BottomNavigationBarItem(
                label: "Location",
                icon: Icon(
                  IconBroken.Location,
                ),
              ),
              BottomNavigationBarItem(
                label: "Settings",
                icon: Icon(
                  IconBroken.Setting,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(),
  //   );
  // }
}



//
//
//                        verified
//
//
// ConditionalBuilder(
//             condition: true,
//             fallback: (context) => Center(
//               child: CircularProgressIndicator(),
//             ),
//             builder: (context) {
//               // var model = AppCubit.get(context).model;
//               var model = FirebaseAuth.instance.currentUser!.emailVerified;
//               return Column(
//                 children: [
//                   //

//                   //
//                   //
//                   //
//                   //
//                   //

//                   // if (!model!.isEmailVerified!)
//                   if (!model)
//                     Container(
//                       color: Colors.amber.withOpacity(.5),
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 20.0,
//                         ),
//                         child: Row(
//                           children: [
//                             Icon(
//                               Icons.info_outline,
//                             ),
//                             SizedBox(
//                               width: 15.0,
//                             ),
//                             const Expanded(
//                                 child: Text("Please verify your Email ")),
//                             const SizedBox(
//                               width: 15.0,
//                             ),
//                             defaultTextButton(
//                               function: () {
//                                 FirebaseAuth.instance.currentUser!
//                                     .sendEmailVerification()
//                                     .then((value) {
//                                   ShowToast(
//                                     text: "check your email",
//                                     state: ToastStates.SUCCESS,
//                                   );
//                                 }).catchError((error) {
//                                   print(error.toString());
//                                 });
//                               },
//                               text: "Send",
//                             ),
//                           ],
//                         ),
//                       ),
//                     )
//                 ],
//               );
//             },
//           ),