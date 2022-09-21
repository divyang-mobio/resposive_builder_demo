import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SizerScreen extends StatefulWidget {
  const SizerScreen({Key? key}) : super(key: key);

  @override
  State<SizerScreen> createState() => _SizerScreenState();
}

class _SizerScreenState extends State<SizerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sizer Builder page")),
      body: Sizer(builder: (context, orientation, deviceType) {
        return Center(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 3.w),
            padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 3.w),
            child: Text("Sizer",
                style: TextStyle(color: Colors.pink, fontSize: 10.sp)),
          ),
        );
      }),
    );
  }
}
