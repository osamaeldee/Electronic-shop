import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/Veiw/screen/auth/Login.dart';
import 'package:untitled1/controller/Auth/logen_controller.dart';
import 'package:untitled1/main.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(50);
  Future<void> Signout() async {
    lognincontrollerImp.is_logged_in = false;

    await supabase.auth.signOut();
    Get.off(Logen());
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'welcome ecommerse',
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Color.fromARGB(255, 81, 121, 207),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
          onPressed: () {
            showSearchDialog(context);
          },
        ),
        IconButton(
          icon: const Icon(
            Icons.outbox_rounded,
            color: Colors.white,
          ),
          onPressed: () async {
            await Signout();
          },
        ),
      ],
    );
  }

  void showSearchDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const TextField(
                  decoration:
                      InputDecoration(hintText: 'Enter your search query'),
                ),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      child: const Text('Search'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: const Text('Cancel'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
