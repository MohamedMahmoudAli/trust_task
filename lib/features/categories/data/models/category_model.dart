import '../../domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel({
    required super.id,
    required super.name,
    required super.image,
    required super.count,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['term_id'] ?? 0,
      name: json['name'] ?? '',
      image: json['category_image'] ?? '', // Based on custom-api/v1/categories
      count: json['count'] ?? 0,
    );
  }
}