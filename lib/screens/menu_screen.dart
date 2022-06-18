import 'package:app_inventory/components/options_menu.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 70),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: const Text(
              '¡Hola {{Nombre de Usuario}}!',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(height: 30),
          const OptionsMenu()
        ],
      ),
    );
  }
}