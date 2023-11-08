import 'package:dartz/dartz.dart';
import 'package:sold_app/core/error/failure.dart';
import 'package:sold_app/feature/home/data/models/CartReponse.dart';
import 'package:sold_app/feature/home/domain/repositories/home_domain_repo.dart';

class AddCartUseCase {
  HomeDomainRepo homeDomainRepo;

  AddCartUseCase(this.homeDomainRepo);

  Future<Either<Failures, CartResponse>> call(String productId) =>
      homeDomainRepo.addToCart(productId);
}
