import 'package:belajar_flutter/models/location_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/doctor_models.dart';

class DetailedDoctor  extends StatefulWidget {
  final String doctorName;

  DetailedDoctor({ required this.doctorName});
  
  @override
  State<DetailedDoctor > createState() => _DetailedDoctor();
}

class _DetailedDoctor extends State<DetailedDoctor> {
  List<DoctorModels> doctor = [];
  List<LocationModels> lokasi = [];
  Map<String, dynamic> selectedDoctor = {};
  int activeIndex = 0 ;

  @override
  void initState() {
    super.initState();
    _getInitialInfo();
    
  }

//081320056778
void _getInitialInfo() {
  setState(() {
    doctor = DoctorModels.getDoctor();
    lokasi = LocationModels.getLocation();
    doctor.forEach((doc) {
      if (doc.doctors == widget.doctorName) {
        selectedDoctor = {
          "rumahSakit": doc.rumahSakit,
          "keahlian": doc.keahlian,
          "jadwal": doc.schedule,
        };
      }
    });

    lokasi.forEach((loc) {
      if (selectedDoctor["rumahSakit"] == loc.rumahSakit) {
        selectedDoctor["alamat"] = loc.alamat;
      }
    });
    print(selectedDoctor["jadwal"][0]);

  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      backgroundColor: Colors.white,
      body:
      Column(
        children: [
          doctorProfileSection(),
          tabBar(),
          // SizedBox(height: 20),
          if (activeIndex == 0) doctorLocationSection(),
          if (activeIndex == 1) 
              Expanded(
                child: ListView.builder(
                  itemCount:  selectedDoctor["jadwal"].length,
                  itemBuilder: (context, index){
                    return 
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0,top: 15),
                      child: 
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(selectedDoctor["jadwal"][index]["day"],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                          ),),
                          Text(selectedDoctor["jadwal"][index]["time"])
                        ],
                      ),
                    );
                  }
                ) 
              ),
        ],
      )
        
        

    );
  }

Align doctorLocationSection() {
  return Align(
          alignment: Alignment.centerLeft,
          child: 
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if(selectedDoctor["rumahSakit"] != null && selectedDoctor["alamat"] != null)
                SizedBox(height: 20),
                  Text(selectedDoctor["rumahSakit"],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),),
                    SizedBox(height: 6),
                  Text(selectedDoctor["alamat"])
              ],
            ),
          ),
        );
}

Column doctorProfileSection() {
  return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Column(
            children: [
              SizedBox(height: 25),
              CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage("assets/icons/Male-young-doctor-transparent-PNG.png"),
              ),
              SizedBox(height: 16),
              Text(widget.doctorName,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(selectedDoctor["keahlian"],
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),

      ],
    );
}

AppBar buildAppBar(BuildContext context) { 
  return AppBar(
    title: Text(
      "Profil Dokter",
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

Padding tabBar() {
  return Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Row(
          children: [

            GestureDetector(
              onTap: () {
                print("Tombol Lokasi Ditekan");
                 setState(() {
                  activeIndex = 0; // Set ke 0 saat "Deskripsi" diaktifkan
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border(bottom: 
                    BorderSide(
                      color: activeIndex == 0 ? Colors.blueAccent : Colors.white,
                      width: 2,
                  ))
                ),
                child: Text("Lokasi", style: TextStyle(fontSize: 17)),
              ),
            ),
            SizedBox(width: 30),

            GestureDetector(
              onTap: () {
                print("Tombol Jadwal Ditekan");
                 setState(() {
                  activeIndex = 1; // Set ke 0 saat "Deskripsi" diaktifkan
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border(bottom: 
                    BorderSide(
                      color: activeIndex == 1 ? Colors.blueAccent : Colors.white,
                      width: 2,
                  ))
                ),
                child: Text("Jadwal", style: TextStyle(fontSize: 17)),
              ),
            ),
            SizedBox(width: 30),

          ],
        ),
      );
}
}