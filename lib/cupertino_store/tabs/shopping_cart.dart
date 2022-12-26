import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/cupertino_store/models/app_state.dart';
import 'package:flutter_samples/cupertino_store/utils/styles.dart';
import 'package:flutter_samples/cupertino_store/widgets/cart_item.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({super.key});

  @override
  ShoppingCartState createState() => ShoppingCartState();
}

class ShoppingCartState extends State<ShoppingCart> {
  String? name;
  String? email;
  String? location;
  String? pin;
  DateTime dateTime = DateTime.now();
  final NumberFormat _currencyFormat = NumberFormat.currency(symbol: r'$');

  SliverChildBuilderDelegate _buildDelegate(AppState model) {
    return SliverChildBuilderDelegate((_, int index) {
      final int productIndex = index - 5;
      switch (index) {
        case 0:
          return CustomTextField(
            placeholder: 'Name',
            icon: CupertinoIcons.person_solid,
            onChange: (value) => setState(() => name = value),
          );
        case 1:
          return CustomTextField(
            placeholder: 'Email',
            icon: CupertinoIcons.mail_solid,
            onChange: (value) => setState(() => email = value),
          );
        case 2:
          return CustomTextField(
            placeholder: 'Location',
            icon: CupertinoIcons.location_solid,
            onChange: (value) => setState(() => location = value),
          );
        case 3:
          return DateTimePicker(
            dateTime: dateTime,
            onPick: (value) => setState(() => dateTime = value),
          );
        case 4:
          return ClearCartButton(model: model);
        default:
          if (model.productsInCart.length > productIndex) {
            return CartItem(
              index: index,
              product: model.getProductById(
                model.productsInCart.keys.toList()[productIndex],
              ),
              quantity: model.productsInCart.values.toList()[productIndex],
              lastItem: productIndex == model.productsInCart.length - 1,
              formatter: _currencyFormat,
            );
          } else if (model.productsInCart.keys.length == productIndex &&
              model.productsInCart.isNotEmpty) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Shipping '
                      '${_currencyFormat.format(model.shippingCost)}',
                      style: Styles.productRowItemPrice,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Tax ${_currencyFormat.format(model.tax)}',
                      style: Styles.productRowItemPrice,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Total ${_currencyFormat.format(model.totalCost)}',
                      style: Styles.productRowTotal,
                    ),
                    const SizedBox(height: 10),
                  ],
                )
              ],
            );
          }
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: CustomScrollView(
            slivers: [
              const CupertinoSliverNavigationBar(
                largeTitle: Text('Shopping Cart'),
              ),
              SliverSafeArea(
                sliver: SliverList(delegate: _buildDelegate(value)),
              )
            ],
          ),
        );
      },
    );
  }
}

class ClearCartButton extends StatelessWidget {
  const ClearCartButton({super.key, required this.model});

  final AppState model;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton.filled(
      onPressed: () async {
        if (model.productsInCart.isEmpty) return;
        await showCupertinoDialog<void>(
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(
              title: const Text('Are you sure want to clear?'),
              actions: <CupertinoDialogAction>[
                CupertinoDialogAction(
                  isDestructiveAction: true,
                  onPressed: () {
                    model.clearCart();
                    Navigator.pop(context);
                  },
                  child: const Text('Yes'),
                ),
                CupertinoDialogAction(
                  onPressed: () => Navigator.pop(context),
                  isDefaultAction: true,
                  child: const Text('No'),
                ),
              ],
            );
          },
        );
      },
      child: const Text('Clear Cart'),
    );
  }
}

class DateTimePicker extends StatelessWidget {
  const DateTimePicker({
    super.key,
    required this.dateTime,
    required this.onPick,
  });

  final DateTime dateTime;
  final Function(DateTime) onPick;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(children: [
        Row(children: [
          const Icon(
            CupertinoIcons.clock,
            color: CupertinoColors.systemGrey,
            size: 28,
          ),
          const SizedBox(width: 6),
          const Text(
            'Delivery time',
            style: Styles.deliveryTimeLabel,
          ),
          const Spacer(),
          Text(
            DateFormat.yMMMd().add_jm().format(dateTime),
            style: Styles.deliveryTime,
          ),
        ]),
        const Divider(height: 8.0),
        SizedBox(
          height: 200,
          child: CupertinoDatePicker(
            backgroundColor: CupertinoColors.systemGrey6,
            initialDateTime: dateTime,
            onDateTimeChanged: onPick,
          ),
        ),
      ]),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.icon,
    required this.placeholder,
    required this.onChange,
  });

  final IconData icon;
  final String placeholder;
  final ValueChanged<String> onChange;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      autocorrect: false,
      onChanged: onChange,
      placeholder: placeholder,
      decoration: Styles.boxDecoration,
      textCapitalization: TextCapitalization.words,
      clearButtonMode: OverlayVisibilityMode.editing,
      prefix: Icon(icon, size: 28, color: CupertinoColors.systemGrey),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
    );
  }
}
