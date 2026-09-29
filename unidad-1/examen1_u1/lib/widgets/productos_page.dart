import 'package:flutter/material.dart';

class Product {
  const Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final ProductRating rating;

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      title: json['title'] as String,
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String,
      category: json['category'] as String,
      image: json['image'] as String,
      rating: ProductRating.fromJson(json['rating'] as Map<String, dynamic>),
    );
  }
}

class ProductRating {
  const ProductRating({required this.rate, required this.count});

  final double rate;
  final int count;

  factory ProductRating.fromJson(Map<String, dynamic> json) {
    return ProductRating(
      rate: (json['rate'] as num).toDouble(),
      count: json['count'] as int,
    );
  }
}

class ProductosPage extends StatelessWidget {
  const ProductosPage({super.key});

  static const products = <Product>[
    Product(
      id: 1,
      title: 'Fjallraven - Foldsack No. 1 Backpack',
      price: 109.95,
      description:
          'Your perfect pack for everyday use and walks in the forest.',
      category: "men's clothing",
      image: 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
      rating: ProductRating(rate: 3.9, count: 120),
    ),
    Product(
      id: 2,
      title: 'Mens Casual Premium Slim Fit T-Shirts',
      price: 22.3,
      description: 'Slim-fitting style with a light and comfortable fabric.',
      category: "men's clothing",
      image: 'https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg',
      rating: ProductRating(rate: 4.1, count: 259),
    ),
    Product(
      id: 3,
      title: 'Mens Cotton Jacket',
      price: 55.99,
      description: 'A comfortable cotton jacket for everyday wear.',
      category: "men's clothing",
      image: 'https://fakestoreapi.com/img/71li-uj0tUL._AC_UX679_.jpg',
      rating: ProductRating(rate: 4.7, count: 500),
    ),
    Product(
      id: 4,
      title: 'Mens Casual Slim Fit',
      price: 15.99,
      description: 'A slim fit top with a soft and comfortable finish.',
      category: "men's clothing",
      image: 'https://fakestoreapi.com/img/71YXzeOuslL._AC_UY879_.jpg',
      rating: ProductRating(rate: 2.1, count: 430),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Productos')),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: products.length,
        separatorBuilder: (_, _) => const Divider(height: 1, indent: 96),
        itemBuilder: (context, index) => _ProductTile(product: products[index]),
      ),
    );
  }
}

class _ProductTile extends StatelessWidget {
  const _ProductTile({required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: SizedBox(
        width: 64,
        height: 80,
        child: Image.network(
          product.image,
          fit: BoxFit.contain,
          errorBuilder: (_, _, _) =>
              const Icon(Icons.image_not_supported_outlined),
        ),
      ),
      title: Text(product.title, maxLines: 2, overflow: TextOverflow.ellipsis),
      subtitle: Text(
        '${product.category} - \$${product.price.toStringAsFixed(2)}',
      ),
    );
  }
}
