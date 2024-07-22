import 'dart:convert';
import 'package:flutter/services.dart';

import '../../../../../gen/assets.gen.dart';
import '../../models/property_model.dart';

abstract class PropertyRemoteDataSource {
  Future<PropertyModel> getPropertysFromJson();
}

class PropertyRemoteDataSourceImpl implements PropertyRemoteDataSource {
  PropertyRemoteDataSourceImpl();

  @override
  Future<PropertyModel> getPropertysFromJson() async {
    // load the json file
    final jsonString = await rootBundle.loadString(Assets.api.property);

    // decode the json into list
    final Map<String, dynamic> jsonList = json.decode(jsonString);

    return PropertyModel.fromJson(jsonList);
  }
}
