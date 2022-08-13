import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/bottomnavgator_screen/categories.dart';
import 'package:shopapp/bottomnavgator_screen/favorites.dart';
import 'package:shopapp/bottomnavgator_screen/settings.dart';
import 'package:shopapp/bottomnavgator_screen/shophome.dart';
import 'package:shopapp/models/shophomemodel.dart';
import 'package:shopapp/shared/dio_helper.dart';
import 'package:shopapp/shared/endpoint.dart';
import 'package:shopapp/shared/stayle/constans.dart';
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

  ShopHome_Model? homeModel;
  void getHomeModel() {
    emit(ShopHomeLoadDataState());
    DioHelper.getData(url: HOME, token: token).then((value) {
      homeModel = ShopHome_Model.fromJson(value.data);
      print(homeModel!.status);
      print(homeModel!.data!.banners[0].image);
      print("get Data Success");
      emit(
        ShopHomeSuccessDataState(),
      );
    }).catchError((error) {
      print("get Data Error");
      emit(
        ShopHomeErrorDataState(error.toString()),
      );
    });
  }
}
