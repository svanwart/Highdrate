import 'dart:ffi';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_reactive_value/flutter_reactive_value.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'home_page.dart';
import '../widgets/characteristic_tile.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({Key? key}) : super (key: key);

  @override
  StatsPageState createState() => StatsPageState();
}

class StatsPageState extends State<StatsPage> {
  Widget build(BuildContext context) {
    double lastestMeasurement = 0;
    List<double> allMeasurements = measurementList.reactiveValue(context);
    if(allMeasurements.isNotEmpty) {
      lastestMeasurement = allMeasurements.last;
    }
    print('lastestMeasurement: $lastestMeasurement');
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      appBar: AppBar(
        title: const Text('Stats Page'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0.0, 0, 0.0, 80.0),
              alignment: Alignment.center,
              child: CircularPercentIndicator(
                animation: true,
                animationDuration: 1000,
                lineWidth: 25.0, 
                percent: 0.4, 
                radius: 125,
                progressColor: Theme.of(context).colorScheme.primary,
                backgroundColor: Colors.blue.shade100,
                circularStrokeCap: CircularStrokeCap.round,
                center: Text('40 %')),
            ),
            Text('$lastestMeasurement'),
          ],
        )
      ),
    );
  }
}

// class StatsPage extends StatelessWidget {
//   const StatsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     int lastestMeasurement = 0;
//     List<int> allMeasurements = measurementList.reactiveValue(context);
//     if(allMeasurements.isNotEmpty) {
//       lastestMeasurement = allMeasurements.last;
//     }
//     print(lastestMeasurement);
//     return Scaffold(
//       backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//       appBar: AppBar(
//         title: const Text('Stats Page'),
//       ),
//       body: Center(
//         child: Text('$lastestMeasurement'),
//       ),
//     );
//   }
// }

