import 'package:equatable/equatable.dart';
import 'hex.dart';
import 'name.dart';

class ColorModel with EquatableMixin {
  Hex? hex;
  Name? name;

  ColorModel({
    this.hex,
    this.name,
  });

  @override
  List<Object?> get props => [hex, name];

  ColorModel copyWith({
    Hex? hex,
    Name? name,
  }) {
    return ColorModel(
      hex: hex ?? this.hex,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'hex': hex,
      'name': name,
    };
  }

  factory ColorModel.fromJson(Map<String, dynamic> json) {
    return ColorModel(
      hex: json['hex'] == null
          ? null
          : Hex.fromJson(json['hex'] as Map<String, dynamic>),
      name: json['name'] == null
          ? null
          : Name.fromJson(json['name'] as Map<String, dynamic>),
    );
  }
}
