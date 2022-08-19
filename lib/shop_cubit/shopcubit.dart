import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/bottomnavgator_screen/categories.dart';
import 'package:shopapp/bottomnavgator_screen/favorites.dart';
import 'package:shopapp/bottomnavgator_screen/settings.dart';
import 'package:shopapp/bottomnavgator_screen/shophome.dart';
import 'package:shopapp/models/catgors_model.dart';
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
  Map<int, bool> favorits = {};
  void getHomeModel() {
    emit(ShopHomeLoadDataState());
    DioHelper.getData(url: HOME, token: token).then((value) {
      homeModel = ShopHome_Model.fromJson(value.data);
      homeModel!.data!.products.forEach((element) {
        favorits.addAll({element.id!: element.infavorites!});
      });
      // print(homeModel!.status);
      // print(homeModel!.data!.banners[0].image);
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

  CategoresModel? categoresModel;
  void getcategoresModel() {
    emit(ShopHomeLoadDataState());
    DioHelper.getData(
      url: CATEGORES,
    ).then((value) {
      categoresModel = CategoresModel.fromJson(value.data);

      print("get Catgores Success");
      emit(
        ShopCatgoresSuccessState(),
      );
    }).catchError((error) {
      print("get Catgores Error");
      emit(
        ShopCatgoresErrorState(error.toString()),
      );
    });
  }
}
