import 'package:flutter/material.dart';

class DateFilterOption extends StatelessWidget {
  final String label;

  const DateFilterOption({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(DateTime.now().year - 100),
                lastDate: DateTime(DateTime.now().year + 1))
            .then((value) {});
      },
      child: Container(
        padding: EdgeInsets.only(left: 10),
        height: 50,
        width: 260,
        decoration: BoxDecoration(
            color: Colors.grey[100], borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Text(
              label,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              width: 10,
            ),
            Text('01/01/2022')
          ],
        ),
      ),
    );
  }
}
