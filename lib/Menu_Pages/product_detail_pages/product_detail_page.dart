import 'package:flutter/material.dart';
import 'package:project_shop/Menu_Pages/cart_page.dart';

CartPageState cartpage = CartPageState();

class Productdetail {
  final String image;
  final String name;
  final double price;
  final String description;

  Productdetail({
    required this.image,
    required this.name,
    required this.price,
    required this.description,
  });
}

class ProductDetailPage extends StatefulWidget {
  final Productdetail product;

  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  ProductDetailPageState createState() => ProductDetailPageState();
}

class ProductDetailPageState extends State<ProductDetailPage> {
  final Map<String, Color> colorMap = {
    'Black': Colors.black,
    'Brown': Colors.brown,
    'White': Colors.white,
    'Blue': Colors.blue,
    'Red': Colors.red,
  };

  String selectedColor = 'White';

  @override
  Widget build(BuildContext context) {
    Productdetail product = widget.product;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 26, 26, 26),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(400.0),
        child: AppBar(
          iconTheme: const IconThemeData(color: Colors.orange),
          flexibleSpace: FlexibleSpaceBar(
            background: FadeInImage(
              placeholder: const AssetImage('assets/placeholder_image.png'),
              image: AssetImage(product.image),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 16), // Adjust left padding as needed
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              product.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '\$${product.price}',
              style: const TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 92, 205, 96),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Select Color:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: colorMap.keys.map(
                  (colorName) {
                    return buildColorOption(
                      colorName,
                      colorMap[colorName]!,
                      selectedColor == colorName,
                      (value) {
                        setState(() {
                          selectedColor = colorName;
                        });
                      },
                    );
                  },
                ).toList(),
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Product Description:',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      product.description,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton.extended(
                  elevation: 0,
                  extendedPadding: const EdgeInsets.symmetric(
                    horizontal: 70,
                  ),
                  label: const Text(
                    'Add to cart',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.orange,
                  icon: const Icon(
                    Icons.shopping_cart,
                    size: 24.0,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      Items productToAdd = Items(
                        name: widget.product.name,
                        price: widget.product.price,
                        imagePath: widget.product.image,
                      );

                      cartpage.addItemToCart(productToAdd);

                      // Show a SnackBar to indicate that the item has been added to the cart
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Item added to cart'),
                          duration: Duration(
                              seconds: 2), // You can adjust the duration
                        ),
                      );
                    });
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildColorOption(
    String colorName,
    Color color,
    bool isSelected,
    ValueChanged<bool> onChanged,
  ) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            onChanged(!isSelected);
          },
          child: Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: isSelected ? color : Colors.transparent,
              border: Border.all(
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          colorName,
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}
