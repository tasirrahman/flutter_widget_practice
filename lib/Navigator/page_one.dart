import 'package:flutter/material.dart';
import 'package:flutter_widget_practice/Navigator/page_two.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page One"),
      ),
      body: Center(
        child: TextButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => PageTwo()));
            },
            child: Text("Navigate to second page")),
      ),
    );
  }
}
