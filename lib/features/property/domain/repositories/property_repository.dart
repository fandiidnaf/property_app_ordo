import 'package:dartz/dartz.dart';

import '../entities/property.dart';

abstract class PropertyRepository {
  Future<Either<Exception, Property>> getPropertys();
}
