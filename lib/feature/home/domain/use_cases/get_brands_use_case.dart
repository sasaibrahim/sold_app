import 'package:dartz/dartz.dart';
import 'package:sold_app/feature/home/domain/entities/CategoriesEntity.dart';
import 'package:sold_app/feature/home/domain/repositories/home_domain_repo.dart';

import '../../../../core/error/failure.dart';

class GetBrandsUseCase {
  HomeDomainRepo homeDomainRepo;

  GetBrandsUseCase(this.homeDomainRepo);

  Future<Either<Failures, CategoriesOrBrandEntity>> call() =>
      homeDomainRepo.getBrands();
}
