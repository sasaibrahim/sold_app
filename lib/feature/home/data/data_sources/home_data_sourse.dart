import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sold_app/core/utils/cach_helper.dart';
import 'package:sold_app/feature/home/data/models/CartReponse.dart';
import 'package:sold_app/feature/home/data/models/CategoryOrBrandModel.dart';
import 'package:sold_app/feature/home/data/models/ProductModel.dart';

import '../../../../core/api/end_points.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/utils/constants.dart';

abstract class HomeDataSourse {
  Future<Either<Failures, CategoryOrBrandModel>> getBrands();

  Future<Either<Failures, CategoryOrBrandModel>> getCategories();

  Future<Either<Failures, ProductModel>> getProducts();

  Future<Either<Failures, CartResponse>> addToCart(String productId);
}

class HomeRemoteDto implements HomeDataSourse {
  Dio dio = Dio();

  @override
  Future<Either<Failures, CategoryOrBrandModel>> getBrands() async {
    try {
      var response = await dio.get(
        "${Constants.baseApiUrl}${EndPoints.getAllBrands}",
      );
      CategoryOrBrandModel model = CategoryOrBrandModel.fromJson(response.data);
      return Right(model);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, CategoryOrBrandModel>> getCategories() async {
    try {
      var response = await dio.get(
        "${Constants.baseApiUrl}${EndPoints.getAllCategories}",
      );
      CategoryOrBrandModel model = CategoryOrBrandModel.fromJson(response.data);
      return Right(model);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, ProductModel>> getProducts() async {
    try {
      var response = await dio.get(
        "${Constants.baseApiUrl}${EndPoints.getAllProducts}",
      );
      ProductModel model = ProductModel.fromJson(response.data);
      return Right(model);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, CartResponse>> addToCart(String productId) async {
    var userToken = CacheHelper.getData("User");
    try {
      var response = await dio.get(
          "${Constants.baseApiUrl}${EndPoints.addToCart}",
          options: Options(headers: {"token": userToken}),
          data: {"productId": productId});
      CartResponse cartResponse = CartResponse.fromJson(response.data);
      return Right(cartResponse);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}

class HomeLocalDto implements HomeDataSourse {
  @override
  Future<Either<Failures, CategoryOrBrandModel>> getBrands() {
    // TODO: implement getBrands
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, CategoryOrBrandModel>> getCategories() {
    // TODO: implement getCategories
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, ProductModel>> getProducts() {
    // TODO: implement getProducts
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, CartResponse>> addToCart(String productId) {
    // TODO: implement addToCart
    throw UnimplementedError();
  }
}
