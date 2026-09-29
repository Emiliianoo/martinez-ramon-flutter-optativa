class ProductoCarrito {
  const ProductoCarrito({required this.productId, required this.quantity});

  final int productId;
  final int quantity;

  factory ProductoCarrito.fromJson(Map<String, dynamic> json) {
    return ProductoCarrito(
      productId: json['productId'] as int,
      quantity: json['quantity'] as int,
    );
  }
}

class Carrito {
  const Carrito({
    required this.id,
    required this.userId,
    required this.date,
    required this.products,
  });

  final int id;
  final int userId;
  final DateTime date;
  final List<ProductoCarrito> products;

  factory Carrito.fromJson(Map<String, dynamic> json) {
    return Carrito(
      id: json['id'] as int,
      userId: json['userId'] as int,
      date: DateTime.parse(json['date'] as String),
      products: (json['products'] as List<dynamic>)
          .map(
            (product) =>
                ProductoCarrito.fromJson(product as Map<String, dynamic>),
          )
          .toList(),
    );
  }
}
