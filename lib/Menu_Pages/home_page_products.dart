import 'package:flutter/material.dart';

class SingleProductRow extends StatelessWidget {
  final Product product;

  const SingleProductRow({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: ProductWidget(product: product),
        ),
      ],
    );
  }
}

class ProductWidget extends StatelessWidget {
  final Product product;

  const ProductWidget({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: SizedBox(
            width: 150,
            height: 150,
            child: product.image,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          product.name,
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(height: 3),
        Text(
          '\$${product.price.toStringAsFixed(2)}',
          style: const TextStyle(color: Color.fromARGB(255, 91, 208, 95)),
        ),
      ],
    );
  }
}

class Product {
  final String name;
  final double price;
  final ClipRRect image;

  Product({
    required this.name,
    required this.price,
    required this.image,
  });
}
