import '../../domain/entities/property.dart';

class PropertyModel extends Property {
  const PropertyModel(
      {required String data})
      : super(data: data);

  PropertyModel copyWith({
    String? data,
  }) {
    return PropertyModel(
      data: data ?? this.data  ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    "data": data,
  };

  factory PropertyModel.fromJson(Map<String, dynamic> json) => PropertyModel(
    data: json["data"],
  );
}

