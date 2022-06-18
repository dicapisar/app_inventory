import 'package:flutter/material.dart';

class RadioFilterOption extends StatefulWidget {
  RadioFilterOption({Key? key}) : super(key: key);

  @override
  State<RadioFilterOption> createState() => _RadioFilterOptionState();
}

enum SingingCharacter { activo, desactivado, todos }

class _RadioFilterOptionState extends State<RadioFilterOption> {
  SingingCharacter? _character = SingingCharacter.activo;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 260,
      decoration: BoxDecoration(
          color: Colors.grey[100], borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10, top: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Estado: ',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
            ),
          ),
          ListTile(
            title: const Text('Activado'),
            leading: Radio<SingingCharacter>(
              value: SingingCharacter.activo,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Desactivado'),
            leading: Radio<SingingCharacter>(
              value: SingingCharacter.desactivado,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Todos'),
            leading: Radio<SingingCharacter>(
              value: SingingCharacter.todos,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}