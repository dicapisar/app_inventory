import 'package:app_inventory/widgets/widgets.dart';
import 'package:flutter/material.dart';

class OptionsMenu extends StatelessWidget {
  const OptionsMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var spaceBettwenOptions = width * 0.05;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: spaceBettwenOptions),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              OptionHomeMenu(
                title: 'Ingresar Articulos',
                pathImage: 'assets/images/input_items.png',
                singularName: 'Ingreso de Articulo',
              ),
              OptionHomeMenu(
                title: 'Retirar Articulos',
                pathImage: 'assets/images/output_items.png',
                singularName: 'Retiro de Articulo',
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              OptionHomeMenu(
                title: 'Articulos',
                pathImage: 'assets/images/items.png',
                singularName: 'Articulo',
              ),
              OptionHomeMenu(
                title: 'Proveedores',
                pathImage: 'assets/images/providers.png',
                singularName: 'Proveedor',
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              OptionHomeMenu(
                title: 'Marcas',
                pathImage: 'assets/images/brands.png',
                singularName: 'Marca',
              ),
              OptionHomeMenu(
                title: 'Tipos de Artículos',
                pathImage: 'assets/images/type_items.png',
                singularName: 'Tipo de Articulo',
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              OptionHomeMenu(
                title: 'Gráficas',
                pathImage: 'assets/images/graph.png',
                singularName: 'Grafica',
              ),
              OptionHomeMenu(
                title: 'Configuración',
                pathImage: 'assets/images/settings.png',
                singularName: 'Configuración',
              ),
            ],
          ),
        ],
      ),
    );
  }
}