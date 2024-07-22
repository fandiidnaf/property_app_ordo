import '../../domain/entities/property.dart';

class PropertyModel extends Property {
  PropertyModel({required super.property});

  PropertyModel copyWith({
    List<PropertyElement>? property,
  }) {
    return PropertyModel(
      property: property ?? this.property,
    );
  }

  Map<String, dynamic> toJson() => {
        "property": property.map((x) => x.toJson()).toList(),
      };

  factory PropertyModel.fromJson(Map<String, dynamic> json) {
    return PropertyModel(
      property: json["property"] == null
          ? []
          : List<PropertyElement>.from(
              json["property"]!.map((x) => PropertyElement.fromJson(x))),
    );
  }
}
