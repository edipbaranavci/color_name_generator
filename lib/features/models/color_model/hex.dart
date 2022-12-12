import 'package:equatable/equatable.dart';

class Hex with EquatableMixin {
  String? value;
  String? clean;

  Hex({
    this.value,
    this.clean,
  });

  @override
  List<Object?> get props => [value, clean];

  Hex copyWith({
    String? value,
    String? clean,
  }) {
    return Hex(
      value: value ?? this.value,
      clean: clean ?? this.clean,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'value': value,
      'clean': clean,
    };
  }

  factory Hex.fromJson(Map<String, dynamic> json) {
    return Hex(
      value: json['value'] as String?,
      clean: json['clean'] as String?,
    );
  }
}
