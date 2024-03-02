import 'package:flutter/material.dart';


class ConnectionLost extends StatelessWidget {
  const ConnectionLost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.wifi_off_outlined, size: 50, color: Colors.grey[300],),
            Text("Connection Lost", style: TextStyle(color: Colors.grey[100]),)
          ],
        ),
      ),
    );
  }
}