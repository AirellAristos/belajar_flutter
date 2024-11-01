import 'package:belajar_flutter/models/doctor_models.dart';
import 'package:belajar_flutter/pages/detailed_doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Doctor extends StatefulWidget {
  const Doctor({super.key});

  @override
  State<Doctor> createState() => _Doctor();
}

class _Doctor extends State<Doctor> {
  List<DoctorModels> dokter = [];

  @override
  void initState() {
    super.initState();
    _getInitialInfo();
  }

  void _getInitialInfo() {
    setState(() {
      dokter = DoctorModels.getDoctor();
      print(dokter.isNotEmpty);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      backgroundColor: Colors.white,
      body: dokter.isNotEmpty
          ? doctorSection() // Panggil doctorSection() di body untuk menampilkannya
          : Center(child: Text("Data dokter belum tersedia")), // Jika data dokter kosong
    );
  }

Widget doctorSection() {
  return ListView.builder(
    padding: EdgeInsets.symmetric(vertical: 10.0),
    itemCount: dokter.length,
    itemBuilder: (context, index) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailedDoctor(doctorName: dokter[index].doctors),
            ),
          );
        },
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.0), // Menambah padding internal untuk memperbesar kotak
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0), // Menambah jarak antar kotak
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage("assets/icons/Male-young-doctor-transparent-PNG.png"),
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dokter[index].doctors,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    dokter[index].keahlian,
                    style: TextStyle(fontSize: 13),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
  }

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    title: Text(
      "Dokter",
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


