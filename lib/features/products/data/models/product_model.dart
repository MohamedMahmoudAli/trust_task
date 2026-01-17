import '../../domain/entities/product_details_entity.dart';

class ProductModel extends ProductDetailsEntity {
  const ProductModel({
    required super.id,
    required super.name,
    required super.description,
    required super.price,
    required super.image,
    super.addons,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json, List<AddonEntity> addons) {
    return ProductModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      price: json['price'] ?? '0.0',
      image: json['images']?[0]?['src'] ?? '',
      addons: addons,
    );
  }
}

class AddonModel extends AddonEntity {
  const AddonModel({required super.id, required super.name, required super.price});

  factory AddonModel.fromJson(Map<String, dynamic> json) {
    return AddonModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      price: json['price'] ?? '0.0',
    );
  }
}