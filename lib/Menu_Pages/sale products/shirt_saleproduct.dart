import 'package:flutter/material.dart';
import 'package:project_shop/Menu_Pages/home_page_products.dart';
import 'package:project_shop/Menu_Pages/product_detail_pages/sale_product_detail_page.dart';

class ShirtsSalePage extends StatefulWidget {
  const ShirtsSalePage({super.key});
  @override
  MyShirtsSalePage createState() => MyShirtsSalePage();
}

class MyShirtsSalePage extends State<ShirtsSalePage> {
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
                      SaleProductdetail product = SaleProductdetail(
                        image: 'assets/images/shirts/shirts (2).jpg',
                        name: 'Painted T-Shirt',
                        price: 150,
                        newprice: 100,
                        description:
                            'Half Sleve T-Shirt Painted with orignal Paints.',
                      );

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              SaleProductDetailPage(product: product),
                        ),
                      );
                    },
                    child: ProductWidget(
                      product: Product(
                        name: 'Painted T-Shirt',
                        price: 100,
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
                  const SizedBox(
                    width: 40,
                  ),
                  InkWell(
                    onTap: () {
                      SaleProductdetail product = SaleProductdetail(
                        image: 'assets/images/shirts/shirts (3).jpg',
                        name: 'Plain T-Shirt',
                        price: 400,
                        newprice: 200,
                        description: 'Plain T-Shirt with Full Sleves',
                      );

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              SaleProductDetailPage(product: product),
                        ),
                      );
                    },
                    child: ProductWidget(
                      product: Product(
                        name: 'Plain T-Shirt',
                        price: 200,
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
                      SaleProductdetail product = SaleProductdetail(
                        image: 'assets/images/shirts/shirts (4).jpg',
                        name: 'Thin T-Shirt',
                        price: 100,
                        newprice: 50,
                        description: 'Thin T-Shirt with half sleves',
                      );

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              SaleProductDetailPage(product: product),
                        ),
                      );
                    },
                    child: ProductWidget(
                      product: Product(
                        name: 'Thin T-Shirt',
                        price: 50,
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
                  const SizedBox(
                    width: 40,
                  ),
                  InkWell(
                    onTap: () {
                      SaleProductdetail product = SaleProductdetail(
                        image: 'assets/images/shirts/shirts (8).jpg',
                        name: 'CT T-Shirt',
                        price: 100,
                        newprice: 70,
                        description: 'Cartoonic Shirts for Girls.',
                      );

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              SaleProductDetailPage(product: product),
                        ),
                      );
                    },
                    child: ProductWidget(
                      product: Product(
                        name: 'CT T-Shirt',
                        price: 70,
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
            ],
          );
        },
      ),
    );
  }
}
