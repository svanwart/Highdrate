import 'package:flutter/material.dart';

import 'stats_page.dart';
import 'connect_page.dart';
import 'timeline_page.dart';
import 'settings_page.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: Theme.of(context).colorScheme.inversePrimary,
                padding: const EdgeInsets.all(5.0),
                margin: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                alignment: Alignment.center,
                child: Text('Highdrate',
                    style: Theme.of(context).textTheme.titleLarge),
              ),
              SizedBox(
                width: 105,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const StatsPage()),
                    );
                  },
                  child: Text('Stats'),
                ),
              ),
              const SizedBox(
                height: 3.0,
              ),
              SizedBox(
                width: 105,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ConnectPage()),
                    );
                  },
                  child: Text('Connect'),
                ),
              ),
              const SizedBox(
                height: 3.0,
              ),
              SizedBox(
                width: 105,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TimelinePage()),
                    );
                  },
                  child: Text('Timeline'),
                ),
              ),
              const SizedBox(
                height: 3.0,
              ),
              SizedBox(
                  width: 105,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SettingsPage()),
                      );
                    },
                    child: Text('Settings'),
                  )),
            ],
          ),
        ),
      );
  }
}