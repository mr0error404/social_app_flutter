// // ignore_for_file: unnecessary_const, deprecated_member_use, unused_local_variable

// import 'package:bloc/bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';


// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   Bloc.observer = MyBlocObserver();
//   DioHelper.init();


//   await CacheHelper.init();


//   Widget widget;
//   bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
//   token = CacheHelper.getData(key: 'token') ?? "";
//   print(token);
//   if (onBoarding != null) {
//     if (token != null)
//       widget = ShopLayout();
//     else
//       widget = LoginScreen();
//   } else {
//     widget = OnBordingScreen();
//   }

//   runApp(
//     MyApp(
//       startWidget: widget,
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   final Widget? startWidget;

//   MyApp({required this.startWidget});

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(
//           create: (BuildContext context) => ShopCubit(),
//         ),
//         BlocProvider(
//           create: (BuildContext context) => ShopCubitApp()
//             ..getHomeData()
//             ..getCategoriesData()
//             ..getFavorites()
//             ..getUserData(),
//         ),
//       ],
//       child: BlocConsumer<ShopCubit, ShopStates>(
//         listener: (context, state) {},
//         builder: (context, state) {
//           return MaterialApp(
//             theme: lightMode,
//             darkTheme: darkTheme,
//             themeMode: ThemeMode.light,
//             home: Directionality(
//               textDirection: TextDirection.ltr,
//               child: startWidget!,
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
