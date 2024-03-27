import 'package:flutter/material.dart';
import 'package:project_shop/Menu_Pages/home_page_products.dart';
import 'package:project_shop/Menu_Pages/product_detail_pages/sale_product_detail_page.dart';

class JacketsSalePage extends StatefulWidget {
  const JacketsSalePage({super.key});
  @override
  MyJacketsSalePage createState() => MyJacketsSalePage();
}

class MyJacketsSalePage extends State<JacketsSalePage> {
  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 26, 26, 26),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 26, 26, 26),
        elevation: 0.5,
        title: const Text(
          'Jackets',
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
                        image: 'assets/images/jackets/bomber_jacket.webp',
                        name: 'Bomber Jacket',
                        price: 50,
                        newprice: 40,
                        description:
                            'Over time, cargo pants have become a popular casual clothing choice. They offer a relaxed fit and are comfortable for everyday activities. ',
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
                        name: 'Bomber Jacket',
                        price: 40,
                        image: ClipRRect(
                          borderRadius: BorderRadius.circular(17.0),
                          child: Image.asset(
                            'assets/images/jackets/bomber_jacket.webp',
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
                        image: 'assets/images/jackets/denim_jacket.webp',
                        name: 'Denim Jacket',
                        price: 150,
                        newprice: 100,
                        description:
                            'Chinos are suitable for a range of casual and smart-casual occasions, making them a popular choice for everyday wear, outings, and social events.',
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
                        name: 'Denim Jacket',
                        price: 100,
                        image: ClipRRect(
                          borderRadius: BorderRadius.circular(17.0),
                          child: Image.asset(
                            'assets/images/jackets/denim_jacket.webp',
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
