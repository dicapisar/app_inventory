import 'package:app_inventory/models/item_detail.dart';
import 'package:app_inventory/models/models.dart';
import 'package:app_inventory/themes/app_theme.dart';
import 'package:app_inventory/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {


  final item1 = [
    1,
    'Titulo Ejemplo 1',
    'Bubtitulo Ejemplo 1',
    'Detalle Ejemplo 1',
    'Detalle Ejemplo 2',
    'Detalle Ejemplo 3',
    true
  ];
  final item2 = [
    1,
    'Titulo Ejemplo 2',
    'Bubtitulo Ejemplo 2',
    'Detalle Ejemplo 1',
    'Detalle Ejemplo 2',
    'Detalle Ejemplo 3',
    false
  ];
  final item3 = [
    1,
    'Titulo Ejemplo 3',
    'Bubtitulo Ejemplo 3',
    'Detalle Ejemplo 1',
    'Detalle Ejemplo 2',
    'Detalle Ejemplo 3',
    true
  ];
  final item4 = [
    1,
    'Titulo Ejemplo 4',
    'Bubtitulo Ejemplo 4',
    'Detalle Ejemplo 1',
    'Detalle Ejemplo 2',
    'Detalle Ejemplo 3',
    true
  ];
  final item5 = [
    1,
    'Titulo Ejemplo 5',
    'Bubtitulo Ejemplo 5',
    'Detalle Ejemplo 1',
    'Detalle Ejemplo 2',
    'Detalle Ejemplo 3',
    true
  ];
  final item6 = [
    1,
    'Titulo Ejemplo 6',
    'Bubtitulo Ejemplo 6',
    'Detalle Ejemplo 1',
    'Detalle Ejemplo 2',
    'Detalle Ejemplo 3',
    false
  ];
  final item7 = [
    1,
    'Titulo Ejemplo 7',
    'Bubtitulo Ejemplo 7',
    'Detalle Ejemplo 1',
    'Detalle Ejemplo 2',
    'Detalle Ejemplo 3',
    true
  ];

  final items = [];

  @override
  void initState() {
    items.add(item1);
    items.add(item2);
    items.add(item3);
    items.add(item4);
    items.add(item5);
    items.add(item6);
    items.add(item7);
    super.initState();
  }

  final Map<String, String> formValues = {
    'buscar': '',
  };

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final ListScreenArguments args =
        ModalRoute.of(context)!.settings.arguments as ListScreenArguments;

    var size = MediaQuery.of(context).size;
    var width = size.width;

    return Scaffold(
      key: _key,
      endDrawer: const Drawer(
        child: _OptionsFilter(),
      ),
      appBar: AppBar(
        title: Text(args.title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: const [
          Icon(
            Icons.more_vert_rounded,
            color: AppTheme.primary,
          ),
          SizedBox(
            width: 8,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 5),
                  width: width * 0.6,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Align(
                    child: CustomInputField(
                      formProperty: 'Buscar',
                      formValues: formValues,
                      prefixIcon: Icons.search,
                      labelText: 'Buscar',
                      hintText: 'Buscar',
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _key.currentState!.openEndDrawer();
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 5, right: 20),
                    width: width * 0.2,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppTheme.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Align(
                      child: Text(
                        'Filtrar',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              height: 670,
              width: width * 0.9,
              child: ListView.builder(
                itemCount: items.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (_, int index) => ItemList(
                    id: items[index][0],
                    title: items[index][1],
                    subTitle: items[index][2],
                    details: [
                      items[index][3],
                      items[index][4],
                      items[index][5],
                    ],
                    advise: items[index][6] == true
                        ? AdviseItemLIst('Alerta', Colors.green)
                        : null),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            'form',
            arguments: FormScreenArguments(
              'Creacion Nuevo ${args.singularName}',
            ),
          );
        },
        child: const Icon(
          Icons.add_outlined,
          size: 50,
        ),
      ),
    );
  }
}

class _OptionsFilter extends StatelessWidget {
  const _OptionsFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, String> formValues = {'user': 'Admin'};

    return Container(
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Container(
            height: 50,
            width: 260,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
              boxShadow: AppTheme.optionMenuDecoration.boxShadow,
            ),
            child: const Align(
                child: Text(
              'Opciones de Filtro',
              style: TextStyle(fontSize: 25),
            )),
          ),
          const SizedBox(
            height: 30,
          ),
          DateFilterOption(
            label: 'Fecha Inicio:',
          ),
          const SizedBox(
            height: 5,
          ),
          DateFilterOption(label: 'Fecha Fin:'),
          const SizedBox(
            height: 5,
          ),
          RadioFilterOption(),
          const SizedBox(
            height: 5,
          ),
          const SelectListFilterOption(),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () => {Navigator.pop(context)},
            child: const SizedBox(
              width: 200,
              height: 50,
              child: Center(
                  child: Text(
                'Aplicar Filtro',
                style: TextStyle(fontSize: 20),
              )),
            ),
          )
        ],
      ),
    );
  }
}
