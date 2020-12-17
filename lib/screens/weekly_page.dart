import 'package:flutter/material.dart';
import 'Pie_Chart.dart';
import 'bar_chart.dart';

class WeeklyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF99797),
        elevation: 0,
        title: Text("Weekly Analysis"),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            BarChartSample3(),
            Chart(),
          ],
        ),
      ),
    );
  }
}
