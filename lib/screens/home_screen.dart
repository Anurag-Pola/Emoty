import 'package:flutter/material.dart';
import 'Pie_Chart.dart';
import 'bar_chart.dart';
import './monthly_page.dart';
import './weekly_page.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              overflow: Overflow.visible,
              children: [
                Container(
                  color: Color(0xFFF99797),
                  height: 200,
                ),
                Positioned(
                  top: 120,
                  left: 200,
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColor,
                    radius: 75,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 100,
            ),
            Switcht(),
            BarChartSample3(),
            Chart(),
            SizedBox(
              height: 10,
            ),
            Button(
              name: "Weekly",
            ),
            SizedBox(
              height: 10,
            ),
            Button(
              name: "Monthly",
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Recordings/Hour",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Counter(),
                SizedBox(
                  width: 10,
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int number = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: Text(
            number.toString(),
            style: TextStyle(fontSize: 25),
          ),
        ),
        Column(
          children: [
            GestureDetector(
              child: Icon(
                Icons.arrow_drop_up,
                size: 30,
              ),
              onTap: () {
                setState(() {
                  number = number + 1;
                });
              },
            ),
            GestureDetector(
              child: Icon(
                Icons.arrow_drop_down,
                size: 30,
              ),
              onTap: () {
                setState(() {
                  number = number - 1;
                  if (number < 0) {
                    number = 0;
                  }
                });
              },
            ),
          ],
        )
      ],
    );
  }
}

class Button extends StatelessWidget {
  const Button({
    Key key,
    @required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  name == "Weekly" ? WeeklyScreen() : MonthlyScreen()),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: w * 0.3),
        padding: EdgeInsets.symmetric(vertical: h * 0.02, horizontal: w * 0.08),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Color(0xFF63DCC7),
        ),
        child: Text(
          name,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class Switcht extends StatefulWidget {
  @override
  _SwitchtState createState() => _SwitchtState();
}

class _SwitchtState extends State<Switcht> {
  var val = false;
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text("Emotion Recognition"),
      onChanged: (h) {
        setState(() {
          val = h;
        });
      },
      value: val,
    );
  }
}
