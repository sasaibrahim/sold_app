import 'package:sold_app/feature/home/domain/entities/CategoriesEntity.dart';
import 'package:sold_app/feature/home/domain/entities/ProductEntity.dart';

import '../../../../core/error/failure.dart';

abstract class HomeStates {}

class HomeInitState extends HomeStates {}

class HomeLoadingState extends HomeStates {}

class HomeGetBrandsSuccessState extends HomeStates {
  CategoriesOrBrandEntity model;

  HomeGetBrandsSuccessState(this.model);
}

class HomeGetCategoriesSuccessState extends HomeStates {
  CategoriesOrBrandEntity model;

  HomeGetCategoriesSuccessState(this.model);
}

class HomeGetProductsSuccessState extends HomeStates {
  ProductEntity model;

  HomeGetProductsSuccessState(this.model);
}

class HomeGetBrandsErrorState extends HomeStates {
  Failures failures;

  HomeGetBrandsErrorState(this.failures);
}

class HomeGetProductsErrorState extends HomeStates {
  Failures failures;

  HomeGetProductsErrorState(this.failures);
}

class HomeGetCategoriesErrorState extends HomeStates {
  Failures failures;

  HomeGetCategoriesErrorState(this.failures);
}

class ChangeBottomNavBar extends HomeStates {}
