import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sold_app/core/utils/app_images.dart';
import 'package:sold_app/feature/home/data/data_sources/home_data_sourse.dart';
import 'package:sold_app/feature/home/data/repositories/home_data_repo.dart';
import 'package:sold_app/feature/home/domain/entities/CategoriesEntity.dart';
import 'package:sold_app/feature/home/domain/repositories/home_domain_repo.dart';
import 'package:sold_app/feature/home/domain/use_cases/get_brands_use_case.dart';
import 'package:sold_app/feature/home/domain/use_cases/get_gategory_use_case.dart';
import 'package:sold_app/feature/home/domain/use_cases/get_products_use_case.dart';
import 'package:sold_app/feature/home/presentation/manager/states.dart';
import 'package:sold_app/feature/home/presentation/pages/tabs/category_tab.dart';
import 'package:sold_app/feature/home/presentation/pages/tabs/home_tab.dart';
import 'package:sold_app/feature/home/presentation/pages/tabs/profile_tab.dart';

import '../pages/tabs/fav_tab.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeDataSourse homeDataSourse;
  late HomeDomainRepo homeDomainRepo;

  HomeCubit(this.homeDataSourse) : super(HomeInitState()) {
    homeDomainRepo = HomeDataRepo(homeDataSourse);
  }

  static HomeCubit get(context) => BlocProvider.of(context);
  int bottomNavIndex = 0;
  List<Widget> tabs = [HomeTab(), CategoryTab(), FavTab(), ProfileTab()];
  List<DataEntity> categories = [];
  List<DataEntity> brands = [];

  List<String> sliders = [
    AppImages.slider1,
    AppImages.slider2,
    AppImages.slider3
  ];

  void changeBottomNav(int index) {
    emit(HomeInitState());
    bottomNavIndex = index;
    emit(ChangeBottomNavBar());
  }

  getProducts() async {
    emit(HomeLoadingState());
    GetProductsUseCase productsUseCase = GetProductsUseCase(homeDomainRepo);
    var result = await productsUseCase.call();
    result.fold((l) {
      emit(HomeGetProductsErrorState(l));
    }, (r) {
      emit(HomeGetProductsSuccessState(r));
    });
  }

  getBrands() async {
    emit(HomeLoadingState());
    GetBrandsUseCase getBrandsUseCase = GetBrandsUseCase(homeDomainRepo);
    var result = await getBrandsUseCase.call();
    result.fold((l) {
      emit(HomeGetBrandsErrorState(l));
    }, (r) {
      brands = r.data ?? [];
      emit(HomeGetBrandsSuccessState(r));
    });
  }

  getCategories() async {
    emit(HomeLoadingState());

    GetGategoriesUseCase gategoriesUseCase =
        GetGategoriesUseCase(homeDomainRepo);
    var result = await gategoriesUseCase.call();
    result.fold((l) {
      emit(HomeGetCategoriesErrorState(l));
    }, (r) {
      categories = r.data ?? [];
      emit(HomeGetCategoriesSuccessState(r));
    });
  }
}
