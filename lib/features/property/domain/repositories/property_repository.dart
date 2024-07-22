import 'package:dartz/dartz.dart';


abstract class PropertyRepository {
  Future<Either<Exception, Unit>> callApi();
}

