import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viajes/config/constants/sizes.dart';
import 'package:viajes/presentation/provider/excursions/excursions_provider.dart';
import 'package:viajes/presentation/widgets/client/appBar/appbar.dart';
import 'package:viajes/presentation/widgets/client/products/cart_item.dart';
import 'package:viajes/presentation/widgets/shared/add_remove_button.dart';
import 'package:viajes/presentation/widgets/texts/t_product_price_text.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final cartItem = ref.watch(cartProvider);
    final total = ref.watch(cartProvider.notifier).total;
    return Scaffold(
      appBar: TAppBar(
          showBackArrow: true,
          title: Text(
            'Cart',
            style: Theme.of(context).textTheme.headlineSmall,
          )),
      body: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: ListView.separated(
              shrinkWrap: true,
              itemCount: cartItem.length,
              separatorBuilder: (_, __) => const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
              itemBuilder: (_, index) => Column(
                    children: [
                      TCartItem(cartItem: cartItem[index]),
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 70,
                          ),
                          //* Remove
                          TCartItemQuantityWithAddRemove(
                            quantity: cartItem[index].quantity,
                            onAdd: () {
                              ref.read(cartProvider.notifier).updateQuantity(
                                  cartItem[index],
                                  cartItem[index].quantity + 1);
                            },
                            onRemove: () {
                              if (cartItem[index].quantity > 1) {
                                ref.read(cartProvider.notifier).updateQuantity(
                                    cartItem[index],
                                    cartItem[index].quantity - 1);
                              }
                            },
                          ),
                          const Spacer(),
                          TProductPriceText(
                              price: cartItem[index].excursion.price.toString(),
                              maxlines: 1)
                        ],
                      )
                    ],
                  ))),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child:
            ElevatedButton(onPressed: () {}, child: Text('Checkout \$$total')),
      ),
    );
  }
}
