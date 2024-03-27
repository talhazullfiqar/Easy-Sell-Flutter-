import 'package:flutter/material.dart';
import '../home_page_products.dart';
import 'package:project_shop/Menu_Pages/product_detail_pages/sale_product_detail_page.dart';

class ShoesSalePage extends StatefulWidget {
  const ShoesSalePage({super.key});
  @override
  MyShoesSalePage createState() => MyShoesSalePage();
}

class MyShoesSalePage extends State<ShoesSalePage> {
  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 26, 26, 26),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 26, 26, 26),
        elevation: 0.5,
        title: const Text(
          'Shoes',
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
                        image: 'assets/images/shoes/shoe (1).jpg',
                        name: 'Nike Jogers',
                        price: 50,
                        newprice: 40,
                        description: 'Nike Jogers for Women. ',
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
                        name: 'Nike Jogers',
                        price: 40,
                        image: ClipRRect(
                          borderRadius: BorderRadius.circular(17.0),
                          child: Image.asset(
                            'assets/images/shoes/shoe (1).jpg',
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
                        image: 'assets/images/shoes/shoe (2).jpg',
                        name: 'High Ankel Sneakers',
                        price: 150,
                        newprice: 100,
                        description: 'Nike High Ankele Sneakers for Men',
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
                        name: 'High Ankel Sneakers',
                        price: 150,
                        image: ClipRRect(
                          borderRadius: BorderRadius.circular(17.0),
                          child: Image.asset(
                            'assets/images/shoes/shoe (2).jpg',
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
                        image: 'assets/images/shoes/shoe (3).jpg',
                        name: 'Bata Sneakers',
                        price: 400,
                        newprice: 200,
                        description: 'Bata Super Soft Sneakers.',
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
                        name: 'Bata Sneakers',
                        price: 400,
                        image: ClipRRect(
                          borderRadius: BorderRadius.circular(17.0),
                          child: Image.asset(
                            'assets/images/shoes/shoe (3).jpg',
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
                        image: 'assets/images/shoes/shoe (4).jpg',
                        name: 'Nike Mini Sneakers',
                        price: 100,
                        newprice: 50,
                        description:
                            'Special Mini Sneakers From Nike for Smooth Walks.',
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
                        name: 'Nike Mini Sneakers',
                        price: 100,
                        image: ClipRRect(
                          borderRadius: BorderRadius.circular(17.0),
                          child: Image.asset(
                            'assets/images/shoes/shoe (4).jpg',
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
