import 'package:dartz/dartz.dart';


abstract class PropertyRemoteDataSource {
  Future<Unit> callApi();
}

class PropertyRemoteDataSourceImpl implements PropertyRemoteDataSource {
  PropertyRemoteDataSourceImpl();

  @override
  Future<Unit> callApi() async {
    // send api request here
    return Future.value(unit);
  }

}


  