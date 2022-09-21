import 'dart:ui';
import 'package:flutter/material.dart';

Row bodyDesktop({required Color color, required String builder}) {
  return Row(
    children: [
      const SizedBox(width: 10),
      const Flexible(flex: 1, child: LoginData(isMobile: false)),
      Flexible(
          flex: 1,
          child: body(color: color, type: "Desktop", builder: builder)),
    ],
  );
}

Row bodyTablet({required Color color, required String builder}) {
  return Row(
    children: [
      const SizedBox(width: 10),
      const Flexible(flex: 2, child: LoginData(isMobile: false)),
      Flexible(
          flex: 1, child: body(color: color, type: "Tablet", builder: builder)),
    ],
  );
}

LoginData bodyMobile({required Color color, required String builder}) {
  return const LoginData(isMobile: true);
}

Center body(
    {required Color color, required String type, required String builder}) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(builder, style: TextStyle(color: color)),
        Text(type, style: TextStyle(color: color, fontSize: 20)),
      ],
    ),
  );
}

Container backGroundImage(BuildContext context) {
  return Container(
      height: MediaQuery
          .of(context)
          .size
          .height * 1,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/background_image.jpeg"),
            fit: BoxFit.cover),
      ),
      child: null);
}

class LoginData extends StatefulWidget {
  const LoginData({Key? key, required this.isMobile}) : super(key: key);

  final bool isMobile;

  @override
  State<LoginData> createState() => _LoginDataState();
}

class _LoginDataState extends State<LoginData> {
  bool showPassword = true;

  void vaw() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
        child: SizedBox(
          height:
              widget.isMobile ? MediaQuery.of(context).size.height * .7 : 600,
          width: widget.isMobile ? MediaQuery.of(context).size.width * .9 : 500,
          child: Form(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 65),
                  const Text("SIGN IN",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 70),
                  SizedBox(
                    width: widget.isMobile
                        ? MediaQuery.of(context).size.width * .9
                        : 450,
                    child: TextFormField(
                      maxLength: 15,
                      style: const TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                          counter: const Offstage(),
                          fillColor: const Color.fromRGBO(0, 0, 0, 0.3),
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  const BorderSide(color: Colors.white)),
                          hintText: "Your Name",
                          hintStyle: const TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          prefixIcon: const Icon(Icons.account_circle_outlined,
                              color: Colors.white)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: widget.isMobile
                        ? MediaQuery.of(context).size.width * .9
                        : 450,
                    child: TextFormField(
                      obscureText: showPassword,
                      style: const TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        fillColor: const Color.fromRGBO(0, 0, 0, 0.3),
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(color: Colors.white)),
                        hintText: "Password",
                        hintStyle: const TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        prefixIcon:
                            const Icon(Icons.lock_outline, color: Colors.white),
                        suffixIcon: IconButton(
                            icon: showPassword == true
                                ? const Icon(
                                    Icons.remove_red_eye_outlined,
                                    color: Colors.white,
                                  )
                                : const Icon(
                                    Icons.remove_red_eye,
                                    color: Colors.white,
                                  ),
                            onPressed: vaw),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  LayoutBuilder(builder: (_ , constraints) {
                    if(constraints.maxWidth <= 500) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Text(
                            "Forgot Password",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white),
                          ),
                          Text(
                            "New Account",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white),
                          ),
                        ],
                      );
                    } else {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Text(
                            "Forgot Password",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white),
                          ),
                          Text(
                            "Create a New Account",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white),
                          ),
                        ],
                      );
                    }
                  }),

                  const SizedBox(height: 20),
                  MaterialButton(
                    color: const Color.fromRGBO(0, 0, 0, 0.3),
                    minWidth: widget.isMobile
                        ? MediaQuery.of(context).size.width * .9
                        : 450,
                    height: 55,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    onPressed: () {},
                    child: const Text("Sign In",
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
