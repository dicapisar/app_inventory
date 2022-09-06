import 'package:app_inventory/components/components.dart';
import 'package:app_inventory/themes/app_theme.dart';
import 'package:flutter/material.dart';

class OptionsFilter extends StatelessWidget {
  const OptionsFilter({Key? key}) : super(key: key);

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