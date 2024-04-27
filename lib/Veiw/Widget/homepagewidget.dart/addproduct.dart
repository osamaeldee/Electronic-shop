import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CarShop extends StatefulWidget {
  final Map<String, dynamic> car;

  const CarShop({Key? key, required this.car}) : super(key: key);

  @override
  State<CarShop> createState() => _CarShopState();
}

class _CarShopState extends State<CarShop> {
  List<Map<String, dynamic>> savedProducts = [];

  @override
  void initState() {
    super.initState();
    loadSavedProducts();
  }

  void loadSavedProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedProducts2 = prefs.getStringList('savedProducts');
    if (savedProducts2 != null) {
      setState(() {
        savedProducts = savedProducts2
            .map((product1) => Map<String, dynamic>.from(json.decode(product1)))
            .toList();
      });
    }
  }

  Future<void> saveProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> productsJson =
        savedProducts.map((product) => json.encode(product)).toList();
    await prefs.setStringList('savedProducts', productsJson);
  }

  void removeAllSavedProducts() async {
    setState(() {
      savedProducts.clear();
    });
    await saveProducts();
  }

  bool isProductSaved(String title) {
    return savedProducts.any((product) => product['title'] == title);
  }

  void addToSavedProducts(String title) {
    setState(() {
      savedProducts.add(widget.car);
      saveProducts();
    });
  }

  void removeFromSavedProducts(String title) {
    setState(() {
      savedProducts.removeWhere((product) => product['title'] == title);
      saveProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    String title = widget.car['title'];
    String brand = widget.car['brand'];
    int price = widget.car['price'];
    final List<dynamic> images = widget.car['images'];
    final String imageUrl = images.isNotEmpty ? images.first : '';

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 202, 186, 186),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("CarShop!"),
        actions: [
          IconButton(
            onPressed: removeAllSavedProducts,
            icon: Icon(
              Icons.delete_forever,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12.0),
                        bottomLeft: Radius.circular(12.0),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            brand,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            'Price: \$$price',
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (isProductSaved(title)) {
                        removeFromSavedProducts(title);
                      } else {
                        addToSavedProducts(title);
                      }
                    },
                    icon: Icon(
                      isProductSaved(title)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: isProductSaved(title) ? Colors.red : null,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Display saved products
          Expanded(
            child: ListView.builder(
              itemCount: savedProducts.length,
              itemBuilder: (context, index) {
                String savedTitle = savedProducts[index]['title'];
                String savedBrand = savedProducts[index]['brand'];
                int savedPrice = savedProducts[index]['price'];
                List<dynamic> savedImages = savedProducts[index]['images'];
                String savedImageUrl =
                    savedImages.isNotEmpty ? savedImages.first : '';

                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: ListTile(
                      title: Text(savedTitle),
                      subtitle:
                          Text('Brand: $savedBrand | Price: \$$savedPrice'),
                      leading: Image.network(
                        savedImageUrl,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              removeFromSavedProducts(savedTitle);
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              addToSavedProducts(savedTitle);
                            },
                            icon: const Icon(
                              Icons.add_circle_outline,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
