import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/Veiw/Widget/homepagewidget.dart/appbar.dart';
import 'package:untitled1/Veiw/Widget/homepagewidget.dart/sections.dart';
import 'package:untitled1/Veiw/Widget/products.dart';
import 'package:untitled1/Veiw/jason/Jason.dart';
import 'package:untitled1/core/constant/ImageAssets..dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<ProviderProducts>(context).fetchproducts();
    return MaterialApp(
      title: 'Professional AppBar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBar: CustomAppBar(),
        body: ListView(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Color.fromARGB(255, 0, 23, 233),
                    height: 250,
                    width: double.infinity,
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          AppImageAssets.des12,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    color: Color.fromARGB(255, 81, 121, 207),
                    height: 100,
                    child: const SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Sections(
                            iconData: Icons.calendar_today,
                            text: "Calendar",
                          ),
                          Sections(
                            iconData: Icons.shopping_cart,
                            text: "Shopping Cart",
                          ),
                          Sections(
                            iconData: Icons.attach_money,
                            text: "Payment",
                          ),
                          Sections(
                            iconData: Icons.settings,
                            text: "Settings",
                          ),
                          Sections(
                            iconData: Icons.person,
                            text: "Profile",
                          ),
                          Sections(
                            iconData: Icons.camera_alt,
                            text: "Camera",
                          ),
                          Sections(
                            iconData: Icons.chat_bubble,
                            text: "Chat",
                          ),
                          Sections(
                            iconData: Icons.map,
                            text: "Map",
                          ),
                          Sections(
                            iconData: Icons.music_note,
                            text: "Music",
                          ),
                          Sections(
                            iconData: Icons.movie,
                            text: "Movie",
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      top: 10,
                    ),
                    child: const Column(
                      children: [
                        Text(
                          '  Best selling products',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Pro(
                    products: Provider.of<ProviderProducts>(context).products,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
