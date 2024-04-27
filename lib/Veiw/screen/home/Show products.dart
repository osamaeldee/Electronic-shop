import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/Veiw/Widget/homepagewidget.dart/addproduct.dart';

class ShowProducts extends StatefulWidget {
  final Map<String, dynamic> data;
  ShowProducts({
    super.key,
    required this.data,
  });

  @override
  _ShowProductsState createState() => _ShowProductsState();
}

class _ShowProductsState extends State<ShowProducts> {
  late String mainImage;

  int num = 0;

  @override
  void initState() {
    super.initState();
    mainImage =
        widget.data['images'].isNotEmpty ? widget.data['images'].first : '';
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> itme = widget.data;
    String title = widget.data['title'];
    int stock = widget.data['stock'];
    String brand = widget.data['brand'];
    String category = widget.data['category'];
    int price = widget.data['price'];
    List<dynamic> images = widget.data['images'];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 228, 221, 221),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 207, 200, 200),
        title: Text(title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  mainImage = images.isNotEmpty ? images.first : '';
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: Offset(0, 15),
                      ),
                    ],
                    image: DecorationImage(
                      image: NetworkImage(mainImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            if (images.length > 1)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Other Images:',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                    const SizedBox(height: 3),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: images
                            .map<Widget>((image) => GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      mainImage = image;
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 7,
                                            offset: const Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                        image: DecorationImage(
                                          image: NetworkImage(image),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
            if (num > 0)
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  'Total Price: \$${num * price}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(top: 3, left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Title: $title',
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                  const SizedBox(height: 5),
                  Text('Stock: $stock',
                      style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                  Text('Brand: $brand',
                      style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                  Text('Category: $category',
                      style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                  Text('Price: \$$price',
                      style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 15)),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      num--;
                    });
                  },
                  icon: const Icon(Icons.remove_circle),
                ),
                Text(
                  num.toString(),
                  style: const TextStyle(fontSize: 20),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      num++;
                    });
                  },
                  icon: const Icon(Icons.add_circle_rounded),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    Get.to(CarShop(
                      car: itme,
                    ));
                    Get.snackbar(
                      'Added to cart',
                      'The product has been added to the cart successfully.',
                      backgroundColor: Colors.green,
                      colorText: Colors.white,
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color.fromARGB(255, 0, 255, 0),
                    ),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.shopping_cart_outlined,
                            size: 20,
                            color: Colors.black,
                          ),
                          SizedBox(width: 5),
                          Text(
                            "Add +",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
