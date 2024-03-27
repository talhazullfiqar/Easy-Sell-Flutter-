import 'package:flutter/material.dart';

List<CartItem> cartItems = [];

class Items {
  final String name;
  final double price;
  final String imagePath;

  Items({required this.name, required this.price, required this.imagePath});
}

class CartItem {
  final Items product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() {
    return CartPageState();
  }
}

class CartPageState extends State<CartPage> {
  double calculateTotal() {
    double total = 0;
    for (CartItem item in cartItems) {
      total += item.product.price * item.quantity;
    }
    return total;
  }

  addItemToCart(product) {
    bool alreadyInCart = false;
    for (int i = 0; i < cartItems.length; i++) {
      CartItem item = cartItems[i];
      if (item.product.name == product.name) {
        item.quantity++;
        alreadyInCart = true;
        break;
      }
    }

    if (!alreadyInCart) {
      cartItems.add(CartItem(product: product));
    }
    // setState(() {});
  }

  void removeItemFromCart(CartItem item) {
    cartItems.remove(item);
    setState(() {});
  }

  void increaseItemCount(CartItem item) {
    setState(() {
      item.quantity++;
    });
  }

  void decreaseItemCount(CartItem item) {
    if (item.quantity > 1) {
      setState(
        () {
          item.quantity--;
        },
      );
    }
  }

  @override
  Widget build(context) {
    void showCheckoutDialog(String header, String errorMessage) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            elevation: 0,
            backgroundColor: const Color.fromARGB(255, 26, 26, 26),
            title: Text(
              header,
              style: const TextStyle(color: Colors.white),
            ),
            content: Text(
              errorMessage,
              style: const TextStyle(color: Colors.white),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'OK',
                  style: TextStyle(color: Colors.orange),
                ),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 26, 26, 26),
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(
              70,
              25,
            ),
          ),
        ),
        backgroundColor: Colors.orange,
        title: const Center(
          child: Text(
            'Cart',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                CartItem item = cartItems[index];
                return ListTile(
                  title: Text(
                    item.product.name,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  subtitle: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        color: Colors.white,
                        onPressed: () {
                          decreaseItemCount(item);
                        },
                      ),
                      Text(
                        'Quantity: ${item.quantity}',
                        style: const TextStyle(color: Colors.white),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add),
                        color: Colors.white,
                        onPressed: () {
                          increaseItemCount(item);
                        },
                      ),
                    ],
                  ),
                  leading: SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.asset(
                      item.product.imagePath, // Use the asset path
                      fit: BoxFit.cover,
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove_shopping_cart),
                    color: Colors.white,
                    onPressed: () {
                      removeItemFromCart(item);
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Total: \$${calculateTotal().toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          FloatingActionButton.extended(
            elevation: 0,
            extendedPadding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            label: const Text(
              'Checkout',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.orange,
            icon: const Icon(
              Icons.check_circle,
              size: 24.0,
              color: Colors.white,
            ),
            onPressed: () {
              setState(
                () {
                  if (cartItems.isEmpty) {
                    showCheckoutDialog('Oppss...', 'Cart is Empty');
                  } else if (cartItems.isNotEmpty) {
                    showCheckoutDialog('Checkedout',
                        'Thank you for shopping today.Your Order is on your way');
                    cartItems.removeRange(0, cartItems.length);
                  }
                },
              );
            },
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
