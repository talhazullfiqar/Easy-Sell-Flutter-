import 'package:flutter/material.dart';
import 'package:project_shop/Menu_Pages/product_detail_pages/product_detail_page.dart';
import 'package:project_shop/Menu_Pages/home_page_products.dart';

class ShirtsPage extends StatefulWidget {
  const ShirtsPage({super.key});
  @override
  MyShirtsPage createState() => MyShirtsPage();
}

class MyShirtsPage extends State<ShirtsPage> {
  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 26, 26, 26),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 26, 26, 26),
        elevation: 0.5,
        title: const Text(
          'Shirts',
          style: TextStyle(color: Colors.white),
        ),
        titleSpacing: 115.0,
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Productdetail product = Productdetail(
                        image: 'assets/images/shirts/shirts (1).jpg',
                        name: 'Cream T-Shirt',
                        price: 50,
                        description:
                            'Original Taged T-Shirt with half sleves For Summers',
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailPage(product: product),
                        ),
                      );
                    },
                    child: ProductWidget(
                      product: Product(
                        name: 'Cream T-Shirt',
                        price: 50,
                        image: ClipRRect(
                          borderRadius: BorderRadius.circular(17.0),
                          child: Image.asset(
                            'assets/images/shirts/shirts (1).jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  InkWell(
                    onTap: () {
                      Productdetail product = Productdetail(
                        image: 'assets/images/shirts/shirts (2).jpg',
                        name: 'Painted T-Shirt',
                        price: 150,
                        description:
                            'Half Sleve T-Shirt Painted with orignal Paints.',
                      );

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailPage(product: product),
                        ),
                      );
                    },
                    child: ProductWidget(
                      product: Product(
                        name: 'Painted T-Shirt',
                        price: 150,
                        image: ClipRRect(
                          borderRadius: BorderRadius.circular(17.0),
                          child: Image.asset(
                            'assets/images/shirts/shirts (2).jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Productdetail product = Productdetail(
                        image: 'assets/images/shirts/shirts (3).jpg',
                        name: 'Plain T-Shirt',
                        price: 400,
                        description: 'Plain T-Shirt with Full Sleves',
                      );

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailPage(product: product),
                        ),
                      );
                    },
                    child: ProductWidget(
                      product: Product(
                        name: 'Plain T-Shirt',
                        price: 400,
                        image: ClipRRect(
                          borderRadius: BorderRadius.circular(17.0),
                          child: Image.asset(
                            'assets/images/shirts/shirts (3).jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  InkWell(
                    onTap: () {
                      Productdetail product = Productdetail(
                        image: 'assets/images/shirts/shirts (4).jpg',
                        name: 'Thin T-Shirt',
                        price: 100,
                        description: 'Thin T-Shirt with half sleves',
                      );

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailPage(product: product),
                        ),
                      );
                    },
                    child: ProductWidget(
                      product: Product(
                        name: 'Thin T-Shirt',
                        price: 100,
                        image: ClipRRect(
                          borderRadius: BorderRadius.circular(17.0),
                          child: Image.asset(
                            'assets/images/shirts/shirts (4).jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Productdetail product = Productdetail(
                        image: 'assets/images/shirts/shirts (5).jpg',
                        name: 'Nike T-Shirt',
                        price: 400,
                        description: 'Nike T-Shirt for Sports.',
                      );

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailPage(product: product),
                        ),
                      );
                    },
                    child: ProductWidget(
                      product: Product(
                        name: 'Nike T-Shirt',
                        price: 400,
                        image: ClipRRect(
                          borderRadius: BorderRadius.circular(17.0),
                          child: Image.asset(
                            'assets/images/shirts/shirts (5).jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  InkWell(
                    onTap: () {
                      Productdetail product = Productdetail(
                        image: 'assets/images/shirts/shirts (6).webp',
                        name: 'Sweat Shirt',
                        price: 100,
                        description: 'Full sleve sweat shirt with dual colors.',
                      );

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailPage(product: product),
                        ),
                      );
                    },
                    child: ProductWidget(
                      product: Product(
                        name: 'Sweat Shirt',
                        price: 100,
                        image: ClipRRect(
                          borderRadius: BorderRadius.circular(17.0),
                          child: Image.asset(
                            'assets/images/shirts/shirts (6).webp',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Productdetail product = Productdetail(
                        image: 'assets/images/shirts/shirts (7).webp',
                        name: 'Sports T-Shirt',
                        price: 400,
                        description: 'Thin febric T-shirts for outdoor Sports',
                      );

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailPage(product: product),
                        ),
                      );
                    },
                    child: ProductWidget(
                      product: Product(
                        name: 'Sports T-Shirt',
                        price: 400,
                        image: ClipRRect(
                          borderRadius: BorderRadius.circular(17.0),
                          child: Image.asset(
                            'assets/images/shirts/shirts (7).webp',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  InkWell(
                    onTap: () {
                      Productdetail product = Productdetail(
                        image: 'assets/images/shirts/shirts (8).jpg',
                        name: 'CT T-Shirt',
                        price: 100,
                        description: 'Cartoonic Shirts for Girls.',
                      );

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailPage(product: product),
                        ),
                      );
                    },
                    child: ProductWidget(
                      product: Product(
                        name: 'CT T-Shirt',
                        price: 100,
                        image: ClipRRect(
                          borderRadius: BorderRadius.circular(17.0),
                          child: Image.asset(
                            'assets/images/shirts/shirts (8).jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          );
        },
      ),
    );
  }
}
