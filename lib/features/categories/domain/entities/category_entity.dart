import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final int id;
  final String name;
  final String image;
  final int count;

  const CategoryEntity({
    required this.id, 
    required this.name, 
    required this.image,
    required this.count,
  });

  @override
  List<Object?> get props => [id, name, image, count];
}