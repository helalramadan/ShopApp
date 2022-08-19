abstract class ShopState {}

class ShopinitialState extends ShopState {}

class ShopChangeBottomState extends ShopState {}

class ShopHomeLoadDataState extends ShopState {}

class ShopHomeSuccessDataState extends ShopState {}

class ShopHomeErrorDataState extends ShopState {
  final String error;

  ShopHomeErrorDataState(this.error);
}

class ShopCatgoresSuccessState extends ShopState {}

class ShopCatgoresErrorState extends ShopState {
  final String error;

  ShopCatgoresErrorState(this.error);
}
