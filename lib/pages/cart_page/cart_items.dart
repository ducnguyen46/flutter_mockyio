import 'package:flutter/material.dart';
import 'package:wdb106_sample/pages/cart_page/cart_bloc_provider.dart';
import 'package:wdb106_sample/pages/cart_page/cart_tile.dart';

class CartItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = CartBlocProvider.of(context);
    return StreamBuilder<List<CartItem>>(
      initialData: bloc.cartItems.value,
      stream: bloc.cartItems,
      builder: (context, snap) {
        return ListView(
          padding: const EdgeInsets.symmetric(vertical: 8),
          children: snap.data.map(
            (cartItem) {
              return CartTile(
                key: ValueKey(cartItem.item.id),
                cartItem: cartItem,
              );
            },
          ).toList(),
        );
      },
    );
  }
}
