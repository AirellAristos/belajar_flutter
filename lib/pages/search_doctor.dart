import 'package:belajar_flutter/models/doctor_models.dart';
import 'package:belajar_flutter/pages/detailed_doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchDoctor extends StatefulWidget {
  final String? location;
  final String? spesialis;
  final String? doctorName;
  
   // Tipe nullable

  SearchDoctor({this.location, this.spesialis, this.doctorName}); // Tidak perlu required
  

  @override
  State<SearchDoctor> createState() => _SearchDoctor();
}

class _SearchDoctor extends State<SearchDoctor> {
  List<DoctorModels> doctor = [];
  Map<String, dynamic> availableDoctor = {};

  @override
  void initState() {
    super.initState();
    _getInitialInfo();
  }

  void _getInitialInfo() {
    setState(() {
      doctor = DoctorModels.getDoctor();

      //Jika search hanya lokasi
      if(widget.location != null && widget.spesialis == null && widget.doctorName == null ){
        print('Jika search hanya lokasi');
        doctor.forEach((doc) {
          if(doc.rumahSakit == widget.location) {
            availableDoctor = {
              "doctor" : doc.doctors,
              "speciality" : doc.keahlian,
              "location" : doc.rumahSakit,
              "schedule" : doc.schedule
            };
          }
        });
      }

      //Jika search hanya spesialis
      if(widget.location == null && widget.spesialis != null && widget.doctorName == null ){
        print('Jika search hanya spesialis');
        doctor.forEach((doc) {
          if(doc.keahlian == widget.spesialis) {
            availableDoctor = {
              "doctor" : doc.doctors,
              "speciality" : doc.keahlian,
              "location" : doc.rumahSakit,
              "schedule" : doc.schedule
            };
          }
        });
      }

      //Jika search hanya dokter
      if(widget.location == null && widget.spesialis == null && widget.doctorName != null ){
        print('Jika search hanya dokter');
        doctor.forEach((doc) {
          if(doc.doctors == widget.doctorName) {
            availableDoctor = {
              "doctor" : doc.doctors,
              "speciality" : doc.keahlian,
              "location" : doc.rumahSakit,
              "schedule" : doc.schedule
            };
          }
        });
      }


      //Jika search lokasi dan spesialis
      if(widget.location != null && widget.spesialis != null && widget.doctorName == null ){
        print('Jika search lokasi dan spesialis');
        doctor.forEach((doc) {
          if(doc.rumahSakit == widget.location && doc.keahlian == widget.spesialis) {
            availableDoctor = {
              "doctor" : doc.doctors,
              "speciality" : doc.keahlian,
              "location" : doc.rumahSakit,
              "schedule" : doc.schedule
            };
          }
        });
      }

      //Jika search lokasi dan nama
      if(widget.location != null && widget.spesialis == null && widget.doctorName != null ){
        print('Jika search lokasi dan nama');
        doctor.forEach((doc) {
          if(doc.rumahSakit == widget.location && doc.doctors == widget.doctorName) {
            availableDoctor = {
              "doctor" : doc.doctors,
              "speciality" : doc.keahlian,
              "location" : doc.rumahSakit,
              "schedule" : doc.schedule
            };
          }
        });
      }      

      //Jika search spesialis dan dokter
      if(widget.location == null && widget.spesialis != null && widget.doctorName != null ){
        print('Jika search spesialis dan dokter');
        doctor.forEach((doc) {
          if(doc.keahlian == widget.spesialis && doc.doctors == widget.doctorName) {
            availableDoctor = {
              "doctor" : doc.doctors,
              "speciality" : doc.keahlian,
              "location" : doc.rumahSakit,
              "schedule" : doc.schedule
            };
          }
        });
      }

      //Jika search semua
      if(widget.location != null && widget.spesialis != null && widget.doctorName != null ){
        print('Jika search semua');
        doctor.forEach((doc) {
          if(doc.rumahSakit == widget.location && doc.keahlian == widget.spesialis && doc.doctors == widget.doctorName) {
            availableDoctor = {
              "doctor" : doc.doctors,
              "speciality" : doc.keahlian,
              "location" : doc.rumahSakit,
              "schedule" : doc.schedule
            };
          }
        });
      }      

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      backgroundColor: Colors.white,
      body: 
      Center(child: Text("Ini Pendaftaran Ke Dokter"),)
      // availableDoctor.isNotEmpty
      //     ? doctorSection()
      //     : Center(child: Text("Data dokter belum tersedia")),
    );
  }

// Widget doctorSection() {
//   return ListView.builder(
//     padding: EdgeInsets.symmetric(vertical: 10.0),
//     itemCount: availableDoctor.length,
//     itemBuilder: (context, index) {
//       return GestureDetector(
//         onTap: () {
//           // Navigator.push(
//           //   context,
//           //   MaterialPageRoute(
//           //     builder: (context) => DetailedDoctor(doctorName: dokter[index].doctors),
//           //   ),
//           // );
//         },
//         child: Container(
//           width: double.infinity,
//           padding: EdgeInsets.all(16.0), // Menambah padding internal untuk memperbesar kotak
//           margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0), // Menambah jarak antar kotak
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(8.0),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.3),
//                 spreadRadius: 2,
//                 blurRadius: 5,
//                 offset: Offset(0, 3),
//               ),
//             ],
//           ),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               CircleAvatar(
//                 radius: 24,
//                 backgroundImage: AssetImage("assets/icons/Male-young-doctor-transparent-PNG.png"),
//               ),
//               SizedBox(width: 20),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     dokter[index].doctors,
//                     style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     dokter[index].keahlian,
//                     style: TextStyle(fontSize: 13),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       );
//     },
//   );
//   }

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


