import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/firebase_options.dart';
import 'package:social_app/layout/home/layoutApp.dart';
import 'package:social_app/modules/login/loginScreen.dart';
import 'package:social_app/modules/register/registerScreen.dart';
import 'package:social_app/shared/components/constant.dart';
import 'package:social_app/shared/cubit/MyBlocObserver.dart';
import 'package:social_app/shared/cubit/cubitApp/cubit.dart';
import 'package:social_app/shared/cubit/cubitRegister/cubit.dart';
import 'package:social_app/shared/cubit/cubitRegister/states.dart';
import 'package:social_app/shared/network/local/cacheHelper.dart';
import 'package:social_app/shared/style/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await CacheHelper.init();
  // تأكد من استكمال تهيئة SharedPreferences قبل استخدامها
  // bool isCacheHelperInitialized = await CacheHelper.init();

  // if (!isCacheHelperInitialized) {
  //   print("حدث خطأ أثناء تهيئة CacheHelper");
  //   return;
  // }
  await CacheHelper.init();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.debug,
    appleProvider: AppleProvider.debug,
  );

  Bloc.observer = MyBlocObserver();
// Widget widget = LoginScreen();
  uId = CacheHelper.getData(key: 'uId') ?? "";
  print("----- uId ------->" + uId + "|0");
  Widget widget;
  if (uId != null && uId.isNotEmpty) {
    widget = LayoutApp();
  } else {
    widget = LoginScreen();
  }
  runApp(MyApp(
    startWidget: widget,
  ));
}
// -------------------------------------------------------
// I/flutter (13296): ----- uId ------->0
// I/flutter (13296): -------not null ------
// I/flutter (13296): onCreate -- RgisterCubit

class MyApp extends StatelessWidget {
  final Widget? startWidget;
  MyApp({super.key, this.startWidget});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => RgisterCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => AppCubit()
            ..getUserData()
            ..getPosts(),
        ),
        // BlocProvider(
        //   create: (BuildContext context) => ShopCubit(),
        // ),
        // BlocProvider(
        //   create: (BuildContext context) => ShopCubitApp()
        //     ..getHomeData()
        //     ..getCategoriesData()
        //     ..getFavorites()
        //     ..getUserData(),
        // ),
      ],
      child: BlocConsumer<RgisterCubit, RegisterStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            theme: lightMode,
            darkTheme: darkTheme,
            themeMode: ThemeMode.light,
            home: Directionality(
              textDirection: TextDirection.ltr,
              child: startWidget!,
              // child: LoginScreen(),
            ),
          );
        },
      ),
    );
  }

  //        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFBD00)),
}
