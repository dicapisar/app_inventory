import 'package:flutter/material.dart';

class SelectListFilterOption extends StatelessWidget {
  const SelectListFilterOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, String> formValues = {'user': 'Admin'};
    return Container(
      padding: EdgeInsets.only(top: 10, left: 10),
      height: 100,
      width: 260,
      decoration: BoxDecoration(
          color: Colors.grey[100], borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text('Usuario creador: ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
          ),
          DropdownButtonFormField<String>(
            value: 'Admin',
            items: const [
              DropdownMenuItem(
                value: 'Admin',
                child: Text('Admin'),
              ),
              DropdownMenuItem(
                value: 'Manager',
                child: Text('SuperUser'),
              ),
              DropdownMenuItem(
                value: 'Employee',
                child: Text('Developer'),
              ),
              DropdownMenuItem(
                value: 'Todos',
                child: Text('Todos'),
              ),
            ],
            onChanged: (value) {
              formValues['user'] = value ?? 'Admin';
            },
          ),
        ],
      ),
    );
  }
}