import 'package:flutter/material.dart';

import 'flutter_blue_app.dart';

class ConnectPage extends StatelessWidget {
  const ConnectPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      appBar: AppBar(
        title: const Text('Connect Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FlutterBlueApp()),
                    );
                  },
                  child: Text('Connect'),
        ),
      ),
    );
  }
}