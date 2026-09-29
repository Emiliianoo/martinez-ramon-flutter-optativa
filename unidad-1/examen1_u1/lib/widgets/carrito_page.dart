import 'package:flutter/material.dart';

import '../api/cart_api.dart';
import '../api/cart_model.dart';
import 'detalle_carrito_page.dart';

class CarritoPage extends StatefulWidget {
  const CarritoPage({super.key});

  @override
  State<CarritoPage> createState() => _CarritoPageState();
}

class _CarritoPageState extends State<CarritoPage> {
  final cartApi = CartApi();
  late Future<List<Carrito>> cartsFuture;

  @override
  void initState() {
    super.initState();
    cartsFuture = cartApi.getCarts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Carritos de compra')),
      body: FutureBuilder<List<Carrito>>(
        future: cartsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          final carts = snapshot.data ?? [];
          return ListView.separated(
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
          );
        },
      ),
    );
  }
}
