import 'package:flutter/material.dart';

import '../api/cart_api.dart';
import '../api/cart_model.dart';
import '../api/product_api.dart';
import '../api/product_model.dart';
import '../api/user_api.dart';
import '../api/user_model.dart';

class DetalleCarritoPage extends StatefulWidget {
  const DetalleCarritoPage({required this.carrito, super.key});

  final Carrito carrito;

  @override
  State<DetalleCarritoPage> createState() => _DetalleCarritoPageState();
}

class _DetalleCarritoPageState extends State<DetalleCarritoPage> {
  late Future<_CartDetail> cartDetailFuture;

  @override
  void initState() {
    super.initState();
    cartDetailFuture = _loadCartDetail();
  }

  Future<_CartDetail> _loadCartDetail() async {
    final cart = await CartApi().getCart(widget.carrito.id);
    final user = await UserApi().getUser(cart.userId);
    final products = await Future.wait(
      cart.products.map(
        (item) async => _CartProduct(
          item: item,
          product: await ProductApi().getProduct(item.productId),
        ),
      ),
    );

    return _CartDetail(cart: cart, user: user, products: products);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Carrito #${widget.carrito.id}')),
      body: FutureBuilder<_CartDetail>(
        future: cartDetailFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          final detail = snapshot.data!;
          final total = detail.products.fold<double>(
            0,
            (sum, item) => sum + item.product.price * item.item.quantity,
          );

          return ListView(
            padding: const EdgeInsets.all(24),
            children: [
              Text('Cliente', style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 8),
              Text('Nombre: ${detail.user.fullName}'),
              Text('Correo: ${detail.user.email}'),
              const SizedBox(height: 24),
              Text(
                'Productos',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              ...detail.products.map((item) => _CartProductTile(item: item)),
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
          );
        },
      ),
    );
  }
}

class _CartDetail {
  const _CartDetail({
    required this.cart,
    required this.user,
    required this.products,
  });

  final Carrito cart;
  final User user;
  final List<_CartProduct> products;
}

class _CartProduct {
  const _CartProduct({required this.item, required this.product});

  final ProductoCarrito item;
  final Product product;
}

class _CartProductTile extends StatelessWidget {
  const _CartProductTile({required this.item});

  final _CartProduct item;

  @override
  Widget build(BuildContext context) {
    final total = item.product.price * item.item.quantity;

    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: SizedBox(
        width: 64,
        height: 64,
        child: Image.network(
          item.product.image,
          fit: BoxFit.contain,
          errorBuilder: (_, _, _) =>
              const Icon(Icons.image_not_supported_outlined),
        ),
      ),
      title: Text(item.product.title),
      subtitle: Text(
        '\$${item.product.price.toStringAsFixed(2)} x ${item.item.quantity}',
      ),
      trailing: Text(
        '\$${total.toStringAsFixed(2)}',
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
