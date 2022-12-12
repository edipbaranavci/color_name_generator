import 'package:equatable/equatable.dart';

class Name with EquatableMixin {
  String? value;
  String? closestNamedHex;
  bool? exactMatchName;
  int? distance;

  Name({
    this.value,
    this.closestNamedHex,
    this.exactMatchName,
    this.distance,
  });

  @override
  List<Object?> get props => [value, closestNamedHex, exactMatchName, distance];

  Name copyWith({
    String? value,
    String? closestNamedHex,
    bool? exactMatchName,
    int? distance,
  }) {
    return Name(
      value: value ?? this.value,
      closestNamedHex: closestNamedHex ?? this.closestNamedHex,
      exactMatchName: exactMatchName ?? this.exactMatchName,
      distance: distance ?? this.distance,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'value': value,
      'closestNamedHex': closestNamedHex,
      'exactMatchName': exactMatchName,
      'distance': distance,
    };
  }

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      value: json['value'] as String?,
      closestNamedHex: json['closest_named_hex'] as String?,
      exactMatchName: json['exact_match_name'] as bool?,
      distance: json['distance'] as int?,
    );
  }
}
