import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/bottomnavgator_screen/categories.dart';
import 'package:shopapp/bottomnavgator_screen/favorites.dart';
import 'package:shopapp/bottomnavgator_screen/shophome.dart';
import 'package:shopapp/bottomnavgator_screen/settings.dart';
import 'package:shopapp/shop_cubit/shopstate.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit() : super(ShopinitialState());
  static ShopCubit get(context) => BlocProvider.of(context);

  var currantIndex = 0;
  List<Widget> bottomScreen = [
    ShopHome(),
    ShopCatgories(),
    ShopFavorites(),
    ShopSettings(),
  ];
  void changeBottomScreen(int index) {
    currantIndex = index;
    emit(ShopChangeBottomState());
  }
}
