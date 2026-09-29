import 'package:flutter/material.dart';

import 'carrito_page.dart';
import 'productos_page.dart';

class DetalleCarritoPage extends StatelessWidget {
  const DetalleCarritoPage({required this.carrito, super.key});

  final Carrito carrito;

  @override
  Widget build(BuildContext context) {
    final total = carrito.products.fold<double>(
      0,
      (sum, item) =>
          sum + (_findProduct(item.productId)?.price ?? 0) * item.quantity,
    );

    return Scaffold(
      appBar: AppBar(title: Text('Carrito #${carrito.id}')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text('Cliente', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 8),
          Text('ID de usuario: ${carrito.userId}'),
          Text(
            'Fecha: ${carrito.date.day}/${carrito.date.month}/${carrito.date.year}',
          ),
          const SizedBox(height: 24),
          Text('Productos', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 8),
          ...carrito.products.map((item) => _CartProductTile(item: item)),
          const Divider(height: 32),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Total: \$${total.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  static Product? _findProduct(int productId) {
    for (final product in ProductosPage.products) {
      if (product.id == productId) return product;
    }
    return null;
  }
}

class _CartProductTile extends StatelessWidget {
  const _CartProductTile({required this.item});

  final ProductoCarrito item;

  @override
  Widget build(BuildContext context) {
    final product = DetalleCarritoPage._findProduct(item.productId);
    final price = product?.price ?? 0;

    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: SizedBox(
        width: 64,
        height: 64,
        child: product == null
            ? const Icon(Icons.image_not_supported_outlined)
            : Image.network(
                product.image,
                fit: BoxFit.contain,
                errorBuilder: (_, _, _) =>
                    const Icon(Icons.image_not_supported_outlined),
              ),
      ),
      title: Text(product?.title ?? 'Producto #${item.productId}'),
      subtitle: Text('\$${price.toStringAsFixed(2)} x ${item.quantity}'),
      trailing: Text(
        '\$${(price * item.quantity).toStringAsFixed(2)}',
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
