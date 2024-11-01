import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class Appoinment extends StatefulWidget {
  const Appoinment({super.key});

  @override
  State<Appoinment> createState() => _AppoinmentState();
}

class _AppoinmentState extends State<Appoinment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      backgroundColor: Colors.white,
      body: Center(
        child: Text("ini Appointment"),
      ),
    );
  }


  AppBar buildAppBar(BuildContext context) {
  return AppBar(
    title: Text(
      "Appointment",
      style: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
    backgroundColor: Colors.white,
    elevation: 0.0,
    centerTitle: true,
    leading: GestureDetector(
      onTap: () {
        Navigator.pop(context); // Navigate back to the previous page
        print("Back button pressed");
      },
      child: Container(
        margin: EdgeInsets.all(10),
        alignment: Alignment.center,
        child: SvgPicture.asset(
          'assets/icons/left-arrow-2.svg',
          height: 20,
          width: 20,
        ),
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: Color(0xffF7F8F8),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}
}