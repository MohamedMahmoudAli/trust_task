import 'package:equatable/equatable.dart';

class ProductDetailsEntity extends Equatable {
  final int id;
  final String name;
  final String description;
  final String price;
  final String image;
  final List<AddonEntity> addons;

  const ProductDetailsEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    this.addons = const [],
  });

  @override
  List<Object?> get props => [id, name, description, price, image, addons];
}

class AddonEntity extends Equatable {
  final int id;
  final String name;
  final String price;

  const AddonEntity({required this.id, required this.name, required this.price});

  @override
  List<Object?> get props => [id, name, price];
}