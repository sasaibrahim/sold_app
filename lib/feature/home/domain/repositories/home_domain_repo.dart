import 'package:dartz/dartz.dart';
import 'package:sold_app/core/error/failure.dart';
import 'package:sold_app/feature/home/domain/entities/CategoriesEntity.dart';
import 'package:sold_app/feature/home/domain/entities/ProductEntity.dart';

abstract class HomeDomainRepo {
  Future<Either<Failures, CategoriesOrBrandEntity>> getCategories();

  Future<Either<Failures, CategoriesOrBrandEntity>> getBrands();

  Future<Either<Failures, ProductEntity>> getProducts();
}
