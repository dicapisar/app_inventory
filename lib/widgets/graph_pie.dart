import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class GraphPie extends StatefulWidget {
  GraphPie({Key? key}) : super(key: key);

  @override
  State<GraphPie> createState() => _GraphPieState();
}

class _GraphPieState extends State<GraphPie> {
  var data = <LinearSales>[];

  @override
  void initState() {
    data.add(LinearSales(1, 100));
    data.add(LinearSales(2, 75));
    data.add(LinearSales(3, 50));
    data.add(LinearSales(4, 25));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final series1 = charts.Series<LinearSales, int>(
      overlaySeries: false,
      displayName: "Ejemplo ",
      id: 'Sales',
      domainFn: (LinearSales sales, _) => sales.year,
      measureFn: (LinearSales sales, _) => sales.sales,
      data: data,
      labelAccessorFn: (LinearSales row, _) => '${row.year}: ${row.sales}',
    );

    return Container(
      child: charts.PieChart(
        [series1],
        animationDuration: Duration(milliseconds: 300),
      ),
    );
  }
}

/// Sample ordinal data type.
class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}
