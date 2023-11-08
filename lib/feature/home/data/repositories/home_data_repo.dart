import 'package:dartz/dartz.dart';
import 'package:sold_app/core/error/failure.dart';
import 'package:sold_app/feature/home/data/data_sources/home_data_sourse.dart';
import 'package:sold_app/feature/home/data/models/CartReponse.dart';
import 'package:sold_app/feature/home/domain/entities/CategoriesEntity.dart';
import 'package:sold_app/feature/home/domain/entities/ProductEntity.dart';
import 'package:sold_app/feature/home/domain/repositories/home_domain_repo.dart';

class HomeDataRepo implements HomeDomainRepo {
  HomeDataSourse homeDataSourse;

  HomeDataRepo(this.homeDataSourse);

  @override
  Future<Either<Failures, CategoriesOrBrandEntity>> getBrands() {
    return homeDataSourse.getBrands();
  }

  @override
  Future<Either<Failures, CategoriesOrBrandEntity>> getCategories() {
    return homeDataSourse.getCategories();
  }

  @override
  Future<Either<Failures, ProductEntity>> getProducts() {
    return homeDataSourse.getProducts();
  }

  @override
  Future<Either<Failures, CartResponse>> addToCart(String productId) {
    return homeDataSourse.addToCart(productId);
  }
}
