import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/models/favorithomemodel.dart';
import 'package:shopapp/shop_cubit/shopcubit.dart';
import 'package:shopapp/shop_cubit/shopstate.dart';

import '../shared/stayle/colors.dart';

class ShopFavorites extends StatelessWidget {
  const ShopFavorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: state is! ShopGetLoadedFavoritesSuccessState,
          builder: (context) => ListView.separated(
              itemBuilder: (context, index) => buildFavoritItem(
                  ShopCubit.get(context).favoritGetModel!.data!.data![index],
                  context),
              separatorBuilder: (context, index) => Container(
                    width: double.infinity,
                    height: 1.0,
                    color: Colors.grey,
                  ),
              itemCount:
                  ShopCubit.get(context).favoritGetModel!.data!.data!.length),
          fallback: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  Widget buildFavoritItem(FavoritData model, context) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: 200.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(alignment: AlignmentDirectional.bottomStart, children: [
                Image(
                  height: 200.0,
                  image: NetworkImage(model.product!.image!),
                  // fit: BoxFit.cover,
                  width: 200,
                ),
                if (model.product!.discount != 0)
                  Container(
                    color: Colors.red,
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                      'discount'.toUpperCase(),
                      style:
                          const TextStyle(color: Colors.white, fontSize: 8.0),
                    ),
                  )
              ]),
              const SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.product!.name!,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 20.0,
                        height: 1.6,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Text(
                          model.product!.price.toString(),
                          style: const TextStyle(
                            color: defaultColor,
                            fontSize: 12.0,
                          ),
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        if (model.product!.discount != 0)
                          Text(
                            model.product!.oldPrice!.toString(),
                            style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12.0,
                                decoration: TextDecoration.lineThrough),
                          ),
                        const Spacer(),
                        IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              ShopCubit.get(context)
                                  .changeFavorites(model.product!.id!);
                              print(model.id!);
                            },
                            icon: CircleAvatar(
                              radius: 15.0,
                              backgroundColor: ShopCubit.get(context)
                                          .favorites[model.product!.id] ==
                                      true
                                  ? defaultColor
                                  : Colors.grey,
                              child: Icon(
                                color: Colors.white,
                                Icons.favorite_border,
                                size: 16.0,
                              ),
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
