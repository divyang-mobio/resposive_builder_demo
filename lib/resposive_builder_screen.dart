import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'components.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Responsive builder page'),
          actions: [
            IconButton(
                onPressed: () => Navigator.pushNamed(context, '/layout'),
                icon: const Icon(Icons.pages_sharp)),
            IconButton(
                onPressed: () => Navigator.pushNamed(context, '/sizer'),
                icon: const Icon(Icons.format_size))
          ]),
      body: Stack(
        alignment: Alignment.center,
        children: [
          backGroundImage(context),
          ResponsiveBuilder(
            builder: (context, sizingInformation) {
              if (sizingInformation.deviceScreenType ==
                  DeviceScreenType.desktop) {
                return bodyDesktop(
                    color: Colors.blue, builder: "Responsive Builder");
              }
              if (sizingInformation.deviceScreenType ==
                  DeviceScreenType.tablet) {
                return bodyTablet(
                    color: Colors.red, builder: "Responsive Builder");
              }
              if (sizingInformation.deviceScreenType ==
                  DeviceScreenType.mobile) {
                return bodyMobile(
                    color: Colors.green, builder: "Responsive Builder");
              }
              return bodyDesktop(
                  color: Colors.purple, builder: "Responsive Builder");
            },
          ),
        ],
      ),
    );
  }
}
