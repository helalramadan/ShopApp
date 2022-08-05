import 'package:shopapp/models/shoploginmodels.dart';

abstract class ShopeLoginState {}

class loginInitialState extends ShopeLoginState {}

class loginLoadingState extends ShopeLoginState {}

class loginSuccessState extends ShopeLoginState {
  final ShopLoginModels loginModel;

  loginSuccessState(this.loginModel);
}

class loginErrorState extends ShopeLoginState {
  final String error;

  loginErrorState(this.error);
}

class loginChangeState extends ShopeLoginState {}
