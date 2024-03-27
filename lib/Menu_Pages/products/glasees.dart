import 'package:flutter/material.dart';
import 'package:project_shop/Menu_Pages/product_detail_pages/product_detail_page.dart';
import '../home_page_products.dart';

class GlassesPage extends StatefulWidget {
  const GlassesPage({super.key});
  @override
  MyGlassesPage createState() => MyGlassesPage();
}

class MyGlassesPage extends State<GlassesPage> {
  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 26, 26, 26),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 26, 26, 26),
        elevation: 0.5,
        title: const Text(
          'Glasses',
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
                        image: 'assets/images/glasses/Cathy.jpg',
                        name: 'Cathy',
                        price: 50,
                        description: 'Cathy glasses for Women. ',
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
                        name: 'Cathy',
                        price: 50,
                        image: ClipRRect(
                          borderRadius: BorderRadius.circular(17.0),
                          child: Image.asset(
                            'assets/images/glasses/Cathy.jpg',
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
                        image: 'assets/images/glasses/Pacific_PT0820.jpg',
                        name: 'Pacific PT0820',
                        price: 150,
                        description: 'Pacific glasses for Men and Women.',
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
                        name: 'Pacific PT0820',
                        price: 150,
                        image: ClipRRect(
                          borderRadius: BorderRadius.circular(17.0),
                          child: Image.asset(
                            'assets/images/glasses/Pacific_PT0820.jpg',
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
                        image: 'assets/images/glasses/Rayban_4408.jpg',
                        name: 'Rayban 4408',
                        price: 400,
                        description: 'Rayban glasses for Men and Women.',
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
                        name: 'Rayban 4408',
                        price: 400,
                        image: ClipRRect(
                          borderRadius: BorderRadius.circular(17.0),
                          child: Image.asset(
                            'assets/images/glasses/Rayban_4408.jpg',
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
                        image: 'assets/images/glasses/Rayban_5348.jpg',
                        name: 'Rayban 5348',
                        price: 100,
                        description: 'Rayban glasses for Men.',
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
                        name: 'Rayban 5348',
                        price: 100,
                        image: ClipRRect(
                          borderRadius: BorderRadius.circular(17.0),
                          child: Image.asset(
                            'assets/images/glasses/Rayban_5348.jpg',
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
                        image: 'assets/images/glasses/Rayban_5668.jpg',
                        name: 'Rayban 5668',
                        price: 400,
                        description: 'Rayban glasses for Men and Women.',
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
                        name: 'Rayban 5668',
                        price: 400,
                        image: ClipRRect(
                          borderRadius: BorderRadius.circular(17.0),
                          child: Image.asset(
                            'assets/images/glasses/Rayban_5668.jpg',
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
                        image: 'assets/images/glasses/Rayban_5808.jpg',
                        name: 'Rayban 5808',
                        price: 100,
                        description: 'Rayban glasses for Men.',
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
                        name: 'Rayban 5808',
                        price: 100,
                        image: ClipRRect(
                          borderRadius: BorderRadius.circular(17.0),
                          child: Image.asset(
                            'assets/images/glasses/Rayban_5808.jpg',
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 40,
                  ),
                  InkWell(
                    onTap: () {
                      Productdetail product = Productdetail(
                        image: 'assets/images/glasses/Vision_588.jpg',
                        name: 'Vision 588',
                        price: 400,
                        description: 'Vision glasses for Men and Women.',
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
                        name: 'Vision 588',
                        price: 400,
                        image: ClipRRect(
                          borderRadius: BorderRadius.circular(17.0),
                          child: Image.asset(
                            'assets/images/glasses/Vision_588.jpg',
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
