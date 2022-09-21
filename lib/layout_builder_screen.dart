import 'package:flutter/material.dart';
import 'components.dart';

class LayoutBuilderScreen extends StatefulWidget {
  const LayoutBuilderScreen({Key? key}) : super(key: key);

  @override
  State<LayoutBuilderScreen> createState() => _LayoutBuilderScreenState();
}

class _LayoutBuilderScreenState extends State<LayoutBuilderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Layout Builder page'),
          actions: [
            IconButton(
                onPressed: () => Navigator.pushNamed(context, '/sizer'),
                icon: const Icon(Icons.format_size))
          ]),
      body: Stack(
        alignment: Alignment.center,
        children: [
          backGroundImage(context),
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth >= 900) {
                return bodyDesktop(
                    color: Colors.blue, builder: "Layout Builder");
              }
              if (constraints.maxWidth >= 600 && constraints.maxWidth < 900) {
                return bodyTablet(color: Colors.red, builder: "Layout Builder");
              }
              if (constraints.maxWidth >= 200 && constraints.maxWidth < 600) {
                return bodyMobile(
                    color: Colors.green, builder: "Layout Builder");
              }
              return bodyDesktop(
                  color: Colors.purple, builder: "Layout Builder");
            },
          ),
        ],
      ),
    );
  }
}
