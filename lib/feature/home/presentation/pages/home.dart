import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/routes/routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../data/data_sources/home_data_sourse.dart';
import '../manager/cubit.dart';
import '../manager/states.dart';

class HomeScreen extends StatelessWidget {
// LoginEntity loginEntity;
// HomeScreen(this.loginEntity);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(HomeRemoteDto())
        ..getCategories()
        ..getBrands()
        ..getProducts(),
      // ..getProducts(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
          // if (state is HomeGetProductsErrorState()) {
          //   showDialog(
          //     context: context,
          //     builder: (context) => AlertDialog(
          //       title: Text("Error"),
          //       content: Text(state.failures.message),
          //     ),
          //   );
          // }
          if (state is HomeLoadingState) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Center(child: CircularProgressIndicator()),
              ),
            );
          } else if (state is HomeGetCategoriesSuccessState) {}
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Badge(
                    alignment: AlignmentDirectional.topCenter,
                    label:
                        Text(HomeCubit.get(context).numOfItemCart.toString()),
                    //  HomeCubit.get(context).numOfItemsInCart.toString()),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.cartScreen);
                        },
                        icon: const Icon(
                          Icons.shopping_cart,
                          size: 30,
                          color: AppColors.primary,
                        )),
                  ),
                )
              ],
              title: Image.asset(
                AppImages.logo,
                width: 66.w,
                color: AppColors.primary,
                height: 22.h,
              ),
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: HomeCubit.get(context).bottomNavIndex,
              onTap: (value) {
                HomeCubit.get(context).changeBottomNav(value);
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: "",
                    backgroundColor: AppColors.primary),
                BottomNavigationBarItem(
                    icon: Icon(Icons.category_outlined),
                    label: "",
                    backgroundColor: AppColors.primary),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_border),
                    label: "",
                    backgroundColor: AppColors.primary),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: "",
                    backgroundColor: AppColors.primary),
              ],
            ),
            body: HomeCubit.get(context)
                .tabs[HomeCubit.get(context).bottomNavIndex],
          );
        },
      ),
    );
  }
}
