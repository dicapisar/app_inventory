import 'package:app_inventory/components/components.dart';
import 'package:flutter/material.dart';

import '../themes/app_theme.dart';
import '../widgets/custom_input_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _key = GlobalKey();

    var size = MediaQuery.of(context).size;
    var width = size.width;

    Map<String, String> formValues = {'search': ''};

    return Container(
      child: Column(children: [
        AppBar(
          title: Text('Buscar'),
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 20, right: 5),
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
                AlertDialog alert = AlertDialog(
                  title: Text('Aplicar Filtro'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DateFilterOption(label: 'Fecha Inicio:'),
                      SizedBox(
                        height: 5,
                      ),
                      DateFilterOption(label: 'Fecha Final'),
                      SizedBox(
                        height: 5,
                      ),
                      RadioFilterOption(),
                      SizedBox(
                        height: 5,
                      ),
                      SelectListFilterOption(),
                    ],
                  ),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('Aplicar')),
                    TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('Cancelar')),
                  ],
                );
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return alert;
                  },
                );
              },
              child: Container(
                margin: EdgeInsets.only(left: 5, right: 20),
                width: width * 0.2,
                height: 50,
                decoration: BoxDecoration(
                  color: AppTheme.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Align(
                  child: Text('Filtrar',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      )),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
