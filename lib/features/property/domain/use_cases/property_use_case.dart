import 'package:dartz/dartz.dart';
import '../repositories/property_repository.dart';


class PropertyUseCase {
  final PropertyRepository repository;

  PropertyUseCase(this.repository);

  Future<Either<Exception, Unit>> call() async {
    return await repository.callApi();
  }
}

