import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shopapp/layout/shop_layout.dart';
import 'package:shopapp/login/shop_login.dart';
import 'package:shopapp/onboard_screen/onbording_screen.dart';
import 'package:shopapp/shared/block_of_server.dart';
import 'package:shopapp/shared/cache_helper.dart';
import 'package:shopapp/shared/dio_helper.dart';

void main() {
  BlocOverrides.runZoned(
    //i need know it how to worke
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      DioHelper.init();
      await CacheHelper.init();
      Widget widget;
      bool? onBording = CacheHelper.getBoolean(key: 'onBording');
      String? token = CacheHelper.getBoolean(key: 'token');
      if (onBording != null) {
        if (token != null) {
          widget = ShopLayout_Screen();
        } else
          widget = ShopLoginScreen();
      } else
        widget = OnBoard_Screen();
      runApp(MyApp(widget));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  final Widget StartWidget;
  MyApp(
    this.StartWidget,
  ) : super();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: StartWidget,
    );
  }
}
