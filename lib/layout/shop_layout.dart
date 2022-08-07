import 'package:flutter/material.dart';
import 'package:shopapp/login/shop_login.dart';
import 'package:shopapp/shared/cache_helper.dart';
import 'package:shopapp/shared/companent.dart';

class ShopLayout_Screen extends StatelessWidget {
  const ShopLayout_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shary'),
        actions: [
          TextButton(
            onPressed: () {
              CacheHelper.removeData('token').then((value) {
                if (value!) navigetorAndFinish(context, ShopLoginScreen());
              });
            },
            child: Text(
              'SIGN OUT',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
