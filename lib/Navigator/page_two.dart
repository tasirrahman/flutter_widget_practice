import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page Two"),
      ),
      body: Center(
        child: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, "/pagethree");
            },
            child: Text("Navigate to third page")),
      ),
    );
  }
}
