import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Button Color Change',
      home: ButtonColorChangeScreen(),
    );
  }
}

class ButtonColorChangeScreen extends StatefulWidget {
  @override
  _ButtonColorChangeScreenState createState() => _ButtonColorChangeScreenState();
}

class _ButtonColorChangeScreenState extends State<ButtonColorChangeScreen> {
  MySnackBar(message, context) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
  List<String> buttonSizes = ['S', 'M', 'L', 'XL','XXL', 'XXXL'];
  String? selectedSize;

  void handleButtonTap(String size) {
    setState(() {
      selectedSize = size;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Size Selector'),
        centerTitle: true,
      ),
      body: Center(
        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 4, // Change the number of columns as needed
          padding: EdgeInsets.all(16.0),
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
          children: buttonSizes.map((size) {
            return ElevatedButton(
              onPressed: () {
                MySnackBar("You have pressed size: ${size}", context);
                return handleButtonTap(size);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: size == selectedSize ? Colors.amber : Colors.grey, // Change color based on selection

              ),
              child: Text(size),
            );
          }).toList(),
        ),
      ),
    );
  }
}
