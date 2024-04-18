import 'dart:ffi';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_reactive_value/flutter_reactive_value.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'home_page.dart';
import '../widgets/characteristic_tile.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({Key? key}) : super(key: key);

  @override
  StatsPageState createState() => StatsPageState();
}

class StatsPageState extends State<StatsPage> {
  double measurement = 0;

  @override
  void initState() {
    super.initState();
    if (characteristic.value != null) {
      characteristic.value.lastValueStream.listen((newValue) {
        String data = utf8.decode(newValue);
        try {
          double _measurement = double.parse(data);
          print(_measurement);
          setState(() {
            measurement = _measurement;
          });
        } catch (e) {
          print(e);
        }
      });
    }
  }

  Widget build(BuildContext context) {
    double lastestMeasurement = 0.0;
    double previousMeasurement = 0.0;
    double percentageRecommendedIntake = 0.0;
    double percentAway = 100.00;
    double totalOunces = 0.0;
    List<double> allMeasurements = measurementList.reactiveValue(context);
    print("measurement list: $allMeasurements");
    if (allMeasurements.isNotEmpty) {
      lastestMeasurement = allMeasurements.last;
      print("last measurement in list: $lastestMeasurement");
      if (allMeasurements.length >= 2) {
        previousMeasurement = allMeasurements[allMeasurements.length - 2];
        print(
            "measurement before last measurement in list: $previousMeasurement");
        // if(previousMeasurement < lastestMeasurement) {
        //   totalOunces = totalOunces + (((lastestMeasurement - previousMeasurement).abs())/22.606*20).roundToDouble();
        // }
        totalOunces = totalOunces +
            (((lastestMeasurement - previousMeasurement).abs()) / 22.606 * 20)
                .roundToDouble();
      }
      if (allMeasurements.length < 2) {
        totalOunces =
            totalOunces + (lastestMeasurement / 22.606 * 20).roundToDouble();
      }
      //totalOunces = allMeasurements.length >= 2 ? (totalOunces + (((lastestMeasurement - previousMeasurement).abs())/22.606*20).roundToDouble()) : (totalOunces + (lastestMeasurement/22.606*20).roundToDouble()); // water bottle is 22.606 cm, 20 ounce water bottle
      print("total amount of ounces drank: $totalOunces");
      // percentageRecommendedIntake =
      //     (totalOunces / 110); // 91 ounces to 125 ounces of water per day
      // percentagReRecommendedIntake = 0;
      percentAway = (1 - percentageRecommendedIntake) * 100;

      // if (characteristic.value != null) {
      //   characteristic.value.lastValueStream.listen((newValue) {
      //     print('REALLY NEW VAL!!!!');
      //     String data = utf8.decode(newValue);
      //     try {
      //       double measurement = double.parse(data);
      //       print(measurement);
      //       // setState(() {
      //       //   percentageRecommendedIntake = percentageRecommendedIntake + 1;
      //       // });
      //     } catch (e) {
      //       print(e);
      //     }
      //   });
      // }
    }

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
                animation: false,
                animationDuration: 0,
                lineWidth: 25.0,
                percent: measurement / 100,
                radius: 125,
                progressColor: Theme.of(context).colorScheme.primary,
                backgroundColor: Colors.blue.shade100,
                circularStrokeCap: CircularStrokeCap.round,
                center: Text("${(measurement).roundToDouble()}%")),
          ),
          Text(
            "You have drunk $measurement ounces today and are ${percentAway.roundToDouble()}% away from drinking the daily recomended water intake.",
            overflow: null,
          ),
        ],
      )),
    );
  }
}
