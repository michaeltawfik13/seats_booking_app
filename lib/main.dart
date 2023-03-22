import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_services_binding/flutter_services_binding.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ticketres/Cubit/cubit/cubit.dart';
import 'package:ticketres/Cubit/cubit/states.dart';
import 'package:ticketres/Cubit/login_cubit/cubit.dart';
import 'package:ticketres/Cubit/login_cubit/states.dart';
import 'package:ticketres/screens/home_screen.dart';
import 'package:ticketres/screens/login_screen.dart';
import 'package:ticketres/screens/splash_screen.dart';
import 'package:ticketres/screens/webview.dart';
import 'package:ticketres/shared/components/constants.dart';
import 'package:ticketres/shared/network/local/cache_helper.dart';
import 'package:ticketres/shared/network/remote/dio_helper.dart';
import 'package:ticketres/shared/styles/themes.dart';

import 'package:ticketres/shared/bloc_observer.dart';
Future<void> main() async {


  // to be sure that all methods async are done
  WidgetsFlutterBinding.ensureInitialized();
  // /to intialize firebase
  await Firebase.initializeApp();
  DioHelper.init();
  await CacheHelper.init();

  bool? isDark = CacheHelper.getData(key: 'isDark');

  Widget? widget;

/*--------------------------------------------------------------------------------*/
  //Social App
  uId = CacheHelper.getData(key: 'uId');

  if(uId != null)
  {
    widget = MyHomePage();
  }else
  {
    widget = SocialLoginScreen();
  }

  //after that run app
  BlocOverrides.runZoned(
        () {
      runApp(MyApp(isDark, widget!));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  late final bool? isDark;
  //late final bool? onBoarding;
  final Widget startWidget;

  MyApp(this.isDark, this.startWidget);

  @override
  Widget build(BuildContext context) // manage design on the screen
  {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context) => SocialCubit()..getUsers()..getUserData()),
      ],
      child: BlocConsumer<SocialCubit, SocialStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              // home: Text('Hello World'),
                debugShowCheckedModeBanner: false,
                theme: lightTheme,
                darkTheme: darkTheme,
                //Colors.black),
                //themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
                themeMode: ThemeMode.light,
                home: SocialLoginScreen(),//startWidget
              //onBoarding! ? ShopLoginScreen():OnBoardingScreen(),
            );
          }),
    );
  }
}
