import 'package:flutter/material.dart';

class DateFilterOption extends StatefulWidget {
  final String label;

  const DateFilterOption({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  State<DateFilterOption> createState() => _DateFilterOptionState();
}

class _DateFilterOptionState extends State<DateFilterOption> {
  @override
  Widget build(BuildContext context) {
    String date = "";
    return InkWell(
      onTap: () {
        showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(DateTime.now().year - 100),
                lastDate: DateTime(DateTime.now().year + 1))
            .then((value) {
          setState(() {
            date = "${value!.day}/${value.month}/${value.year}";
          });
        });
      },
      child: Container(
        padding: const EdgeInsets.only(left: 10),
        height: 50,
        width: 260,
        decoration: BoxDecoration(
            color: Colors.grey[100], borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Text(
              widget.label,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(date)
          ],
        ),
      ),
    );
  }
}
