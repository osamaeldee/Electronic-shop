// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/Veiw/screen/home/Show%20products.dart';

class Pro extends StatelessWidget {
  final List<dynamic> products;

  Pro({Key? key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: products.map((item) {
        final String title = item['title'] ?? '';
        final String description = item['description'] ?? '';
        final double price = (item['price'] ?? 0).toDouble();
        final List<dynamic> images = item['images'];
        final String imageUrl = images.isNotEmpty ? images.first : '';

        return InkWell(
          onTap: () {
            Get.to(ShowProducts(data: item));
          },
          child: Card(
            color: const Color.fromARGB(255, 199, 190, 190),
            elevation: 4,
            margin: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                        const SizedBox(height: 5),
                        Text(
                          description,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(137, 255, 255, 255),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Price: $price',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
