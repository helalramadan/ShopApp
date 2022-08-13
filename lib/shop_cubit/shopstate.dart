abstract class ShopState {}

class ShopinitialState extends ShopState {}

class ShopChangeBottomState extends ShopState {}
class ShopHomeLoadDataState extends ShopState {}
class ShopHomeSuccessDataState extends ShopState {}
class ShopHomeErrorDataState extends ShopState {
  final String error;

  ShopHomeErrorDataState(this.error);
}
