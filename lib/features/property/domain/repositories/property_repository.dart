import 'package:dartz/dartz.dart';
import 'package:property_app/features/property/domain/entities/property.dart';

abstract class PropertyRepository {
  Future<Either<Exception, Property>> getPropertys();
}
