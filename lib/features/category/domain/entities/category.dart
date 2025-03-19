// Category model
class Category {
  final String id;
  final String name;
  final bool isActive;
  final Category? parentCategory;

  Category({
    required this.id,
    required this.name,
    required this.isActive,
    this.parentCategory,
  });

  Category copyWith({
    String? id,
    String? name,
    bool? isActive,
    Category? parentCategory,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      isActive: isActive ?? this.isActive,
      parentCategory: parentCategory ?? this.parentCategory,
    );
  }
}
