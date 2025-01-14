import 'package:dartz/dartz.dart';

import '../entities/property.dart';
import '../repositories/property_repository.dart';

class PropertyUseCase {
  final PropertyRepository repository;

  PropertyUseCase(this.repository);

  Future<Either<Exception, Property>> call() async {
    return await repository.getPropertys();
  }
}
