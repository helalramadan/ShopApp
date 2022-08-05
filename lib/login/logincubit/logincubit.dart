import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/login/logincubit/shopstate.dart';
import 'package:shopapp/models/shoploginmodels.dart';

import '../../shared/dio_helper.dart';
import '../../shared/endpoint.dart';

class ShopeLoginCubit extends Cubit<ShopeLoginState> {
  ShopeLoginCubit() : super(loginInitialState());

  static ShopeLoginCubit get(context) => BlocProvider.of(context);

  ShopLoginModels? loginModel;

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(loginLoadingState());
    DioHelper.postData(url: LOGIN, data: {'email': email, 'password': password})
        .then((value) {
      print(value.data);
      loginModel = ShopLoginModels.fromJson(value.data);
      // print(loginModel!.state);
      // print(loginModel!.message);
      // print(loginModel!.data!.token);
      emit(loginSuccessState(loginModel!));
    }).catchError((error) {
      print(error.toString());
      emit(loginErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changeIcon() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(loginChangeState());
  }
}
