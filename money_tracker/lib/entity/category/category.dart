import 'package:flutter/material.dart';

///Категории
class CategoryExpenses {
  final int? id;
  final String name;
  final String colorHex;
  final Color color;

//<editor-fold desc="Data Methods">
  const CategoryExpenses({
    this.id,
    required this.name,
    required this.colorHex,
    required this.color,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryExpenses &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          colorHex == other.colorHex &&
          color == other.color);

  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode ^ colorHex.hashCode ^ color.hashCode;

  @override
  String toString() {
    return 'CategoryExpenses{ id: $id, name: $name, colorHex: $colorHex, color: $color,}';
  }

  CategoryExpenses copyWith({
    int? id,
    String? name,
    String? colorHex,
    Color? color,
  }) {
    return CategoryExpenses(
      id: id ?? this.id,
      name: name ?? this.name,
      colorHex: colorHex ?? this.colorHex,
      color: color ?? this.color,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'colorHex': colorHex,
      'color': color.value,
    };
  }

  factory CategoryExpenses.fromMap(Map<String, dynamic> map) {
    return CategoryExpenses(
      id: map['id'] as int,
      name: map['name'] as String,
      colorHex: map['colorHex'] as String,
      color: Color(map['color'] as int),
    );
  }

//</editor-fold>
}
