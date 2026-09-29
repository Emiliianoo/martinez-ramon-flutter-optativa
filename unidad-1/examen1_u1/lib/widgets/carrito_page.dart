import 'package:flutter/material.dart';

import 'detalle_carrito_page.dart';

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

class CarritoPage extends StatelessWidget {
  const CarritoPage({super.key});

  static final carts = <Carrito>[
    Carrito(
      id: 1,
      userId: 1,
      date: DateTime(2020, 3, 2),
      products: [
        ProductoCarrito(productId: 1, quantity: 4),
        ProductoCarrito(productId: 2, quantity: 1),
        ProductoCarrito(productId: 3, quantity: 6),
      ],
    ),
    Carrito(
      id: 2,
      userId: 1,
      date: DateTime(2020, 1, 2),
      products: [
        ProductoCarrito(productId: 2, quantity: 4),
        ProductoCarrito(productId: 1, quantity: 10),
        ProductoCarrito(productId: 5, quantity: 2),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Carritos de compra')),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: carts.length,
        separatorBuilder: (_, _) => const Divider(height: 1, indent: 96),
        itemBuilder: (context, index) {
          final cart = carts[index];

          return ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 12,
            ),
            leading: Icon(
              Icons.shopping_cart,
              size: 56,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: Text('Cliente - ${cart.userId}'),
            subtitle: const Text('Click para ver detalles'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetalleCarritoPage(carrito: cart),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
