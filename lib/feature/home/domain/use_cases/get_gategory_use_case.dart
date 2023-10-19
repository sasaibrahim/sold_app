import 'package:dartz/dartz.dart';
import 'package:sold_app/core/error/failure.dart';
import 'package:sold_app/feature/home/domain/repositories/home_domain_repo.dart';

import '../entities/CategoriesEntity.dart';

class GetGategoriesUseCase {
  HomeDomainRepo homeDomainRepo;

  GetGategoriesUseCase(this.homeDomainRepo);

  Future<Either<Failures, CategoriesOrBrandEntity>> call() =>
      homeDomainRepo.getCategories();
}
