import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class GraphHorizontalBars extends StatefulWidget {
  GraphHorizontalBars({Key? key}) : super(key: key);

  @override
  State<GraphHorizontalBars> createState() => _GraphHorizontalBarsState();
}

class _GraphHorizontalBarsState extends State<GraphHorizontalBars> {
  var data = <OrdinalSales>[];

  @override
  void initState() {
    data.add(OrdinalSales('2014', 5));
    data.add(OrdinalSales('2015', 25));
    data.add(OrdinalSales('2016', 100));
    data.add(OrdinalSales('2017', 75));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final series1 = charts.Series<OrdinalSales, String>(
      id: 'Sales',
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      domainFn: (OrdinalSales sales, _) => sales.year,
      measureFn: (OrdinalSales sales, _) => sales.sales,
      data: data,
    );

    final series2 = charts.Series<OrdinalSales, String>(
      id: 'Sales',
      colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
      domainFn: (OrdinalSales sales, _) => sales.year,
      measureFn: (OrdinalSales sales, _) => sales.sales,
      data: data,
    );

    return Container(
      child: charts.BarChart(
        [series1, series2],
        animationDuration: Duration(milliseconds: 300),
        vertical: false,
      ),
    );
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
