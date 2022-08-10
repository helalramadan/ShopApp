import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/shop_cubit/shopcubit.dart';
import 'package:shopapp/shop_cubit/shopstate.dart';

class ShopHome extends StatelessWidget {
  const ShopHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {},
      builder: (context, state) {
        // var cubit = ShopCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Text('Helloo'),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.grey,
            onTap: (index) {
              ShopCubit.get(context).changeBottomScreen(index);
            },
            currentIndex: ShopCubit.get(context).currantIndex,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.apps), label: "Catgoryes"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: "Favorites"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: "Settings"),
            ],
          ),
        );
      },
    );
  }
}
