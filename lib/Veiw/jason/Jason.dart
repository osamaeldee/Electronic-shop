import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled1/Veiw/jason/URL.dart';

class ProviderProducts extends ChangeNotifier {
  List<dynamic> products = [];

  List<dynamic> get product => products;

  Future<void> fetchproducts() async {
    final response = await http.get(Uri.parse(URL.allproducts));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      products = data['products'];
    }
  }
}
