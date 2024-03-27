import 'package:flutter/material.dart';
import 'package:project_shop/Menu_Pages/products/glasees.dart';
import 'package:project_shop/Menu_Pages/products/jackets.dart';
import 'package:project_shop/Menu_Pages/products/pents.dart';
import 'package:project_shop/Menu_Pages/products/shirts.dart';
import 'package:project_shop/Menu_Pages/sale%20products/jacket_saleproduct.dart';
import 'package:project_shop/Menu_Pages/sale%20products/pent_saleproduct.dart';
import 'package:project_shop/Menu_Pages/sale%20products/shirt_saleproduct.dart';
import 'package:project_shop/Menu_Pages/sale%20products/shoe_saleproducts.dart';
import 'package:project_shop/Menu_Pages/products/shoes.dart';
import 'home_page_products.dart';
import 'package:project_shop/Menu_Pages/product_detail_pages/product_detail_page.dart';

class HomeMenu extends StatefulWidget {
  const HomeMenu({super.key});
  @override
  MyHomePage createState() => MyHomePage();
}

class MyHomePage extends State<HomeMenu> with TickerProviderStateMixin {
  int assetsCurrentIndex = 0;
  int itemProductsCurrentIndex = 0;

  @override
  Widget build(context) {
    List<InkWell> assets = [
      InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ShirtsSalePage(),
            ),
          );
        },
        child: Image.asset(
          'assets/images/sales/sale (4).jpg',
          fit: BoxFit.cover,
        ),
      ),
      InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ShoesSalePage(),
            ),
          );
        },
        child: Image.asset(
          'assets/images/sales/sale (3).jpg',
          fit: BoxFit.cover,
        ),
      ),
      InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PentsSalePage(),
            ),
          );
        },
        child: Image.asset(
          'assets/images/sales/sale (1).jpg',
          fit: BoxFit.cover,
        ),
      ),
      InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const JacketsSalePage(),
            ),
          );
        },
        child: Image.asset(
          'assets/images/sales/sale (2).jpg',
          fit: BoxFit.cover,
        ),
      ),
    ];

    List<InkWell> itemProducts = [
      InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ShoesPage(),
            ),
          );
        },
        child: Image.asset(
          'assets/images/1 (10).jpg',
          fit: BoxFit.cover,
        ),
      ),
      InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ShirtsPage(),
            ),
          );
        },
        child: Image.asset(
          'assets/images/1 (5).jpg',
          fit: BoxFit.cover,
        ),
      ),
      InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PentsPage(),
            ),
          );
        },
        child: Image.asset(
          'assets/images/pent.jpg',
          fit: BoxFit.cover,
        ),
      ),
      InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const JacketsPage(),
            ),
          );
        },
        child: Image.asset(
          'assets/images/jacket.jpg',
          fit: BoxFit.cover,
        ),
      ),
      InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const GlassesPage(),
            ),
          );
        },
        child: Image.asset(
          'assets/images/glasses.jpg',
          fit: BoxFit.cover,
        ),
      ),
    ];
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 26, 26, 26),
      appBar: AppBar(
        // foregroundColor: Colors.black,
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
            'Shop',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Column(
            children: [
              // UPSIDE PANEL OF THE HOME PAGE
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                ],
              ),
              SizedBox(
                height: 240,
                width: MediaQuery.of(context).size.width,
                child: PageView.builder(
                  padEnds: false,
                  physics: const BouncingScrollPhysics(),
                  itemCount: assets.length,
                  controller: PageController(viewportFraction: 0.9),
                  onPageChanged: (value) {
                    assetsCurrentIndex = value;
                    setState(() {});
                  },
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(8),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        // color: color[index],
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: InkWell(
                        child: assets[index],
                      ),
                    );
                  },
                ),
              ),
              TabPageSelector(
                indicatorSize: 8,
                controller: TabController(
                  length: assets.length,
                  vsync: this,
                  initialIndex: assetsCurrentIndex,
                ),
                selectedColor: Colors.orange,
                color: Colors.grey,
                borderStyle: BorderStyle.none,
              ),
              const Divider(
                color: Color.fromARGB(60, 158, 158, 158),
                height: 40,
                thickness: 2,
                indent: 50,
                endIndent: 55,
              ),
              // ITEMS MENU OF THE HOME PAGE
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Products',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 90,
                //width: 200,
                width: MediaQuery.of(context).size.width,
                child: PageView.builder(
                  padEnds: false,
                  physics: const BouncingScrollPhysics(),
                  itemCount: itemProducts.length,
                  controller: PageController(viewportFraction: 0.4),
                  onPageChanged: (value) {
                    itemProductsCurrentIndex = value;
                    setState(() {});
                  },
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(5),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        // color: color[index],
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: InkWell(
                        child: itemProducts[index],
                      ),
                    );
                  },
                ),
              ),
              const Divider(
                color: Color.fromARGB(60, 158, 158, 158),
                height: 40,
                thickness: 2,
                indent: 50,
                endIndent: 55,
              ),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Seasonal',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
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
                        image: 'assets/images/black_shirt.jpg',
                        name: 'Black T-Shirt',
                        price: 50,
                        description: 'Nike T-shirt for both Men and Women.',
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
                        name: 'Black T-Shirt',
                        price: 50,
                        image: ClipRRect(
                          borderRadius: BorderRadius.circular(17.0),
                          child: Image.asset(
                            'assets/images/black_shirt.jpg',
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
                        image: 'assets/images/track_suit.jpg',
                        name: 'Track Suit',
                        price: 150,
                        description: 'Nike Track Suit for both Men and Women.',
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
                        name: 'Track Suit',
                        price: 150,
                        image: ClipRRect(
                          borderRadius: BorderRadius.circular(17.0),
                          child: Image.asset(
                            'assets/images/track_suit.jpg',
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
                        image: 'assets/images/jackets.jpg',
                        name: ' Leather Jacket',
                        price: 400,
                        description: 'Leather Jacket with Full Fur inside',
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
                        name: ' Leather Jacket',
                        price: 400,
                        image: ClipRRect(
                          borderRadius: BorderRadius.circular(17.0),
                          child: Image.asset(
                            'assets/images/jackets.jpg',
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
                        image: 'assets/images/jeans_pent.jpg',
                        name: 'Jeans',
                        price: 100,
                        description: 'Jeans pent for both Men and Women.',
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
                        name: 'Jeans',
                        price: 100,
                        image: ClipRRect(
                          borderRadius: BorderRadius.circular(17.0),
                          child: Image.asset(
                            'assets/images/jeans_pent.jpg',
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
