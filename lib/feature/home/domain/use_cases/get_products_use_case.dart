import 'package:dartz/dartz.dart';
import 'package:sold_app/core/error/failure.dart';
import 'package:sold_app/feature/home/domain/entities/ProductEntity.dart';
import 'package:sold_app/feature/home/domain/repositories/home_domain_repo.dart';

class GetProductsUseCase {
  HomeDomainRepo homeDomainRepo;

  GetProductsUseCase(this.homeDomainRepo);

  Future<Either<Failures, ProductEntity>> call() =>
      homeDomainRepo.getProducts();
}
