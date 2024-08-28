import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final TextEditingController baseController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final ValueNotifier<double> area = ValueNotifier<double>(0);

  void calculateArea() {
    double base = double.tryParse(baseController.text) ?? 0;
    double height = double.tryParse(heightController.text) ?? 0;
    double result = 0.5 * base * height;
    area.value = result;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('My App'),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoTextField(
                controller: baseController,
                keyboardType: TextInputType.number,
                placeholder: 'Base',
              ),
              SizedBox(height: 16),
              CupertinoTextField(
                controller: heightController,
                keyboardType: TextInputType.number,
                placeholder: 'Height',
              ),
              SizedBox(height: 16),
              CupertinoButton(
                child: Text('Calculate'),
                onPressed: calculateArea,
              ),
              SizedBox(height: 16),
              ValueListenableBuilder<double>(
                valueListenable: area,
                builder: (context, value, _) {
                  return Text('Area: $value');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
