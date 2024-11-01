import 'package:belajar_flutter/models/doctor_models.dart';
import 'package:belajar_flutter/models/location_models.dart';
import 'package:belajar_flutter/pages/detailed_doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';


class DetailedLocation extends StatefulWidget {
  final String rumahSakit;

  // Constructor to receive the data
  DetailedLocation({required this.rumahSakit});

  @override
  State<DetailedLocation> createState() => _DetailedLocationState();
}

class _DetailedLocationState extends State<DetailedLocation> {
  List<LocationModels> location = [];
  List<DoctorModels> doctor = [];
  List<dynamic> lokasiRumahSakit = [];
  List<List<String>> dokterSesuaiLokasi = [];
  int activeIndex = 0 ;
    

  @override
  void initState() {
    super.initState();
    _getInitialInfo();
    
  }

  void _getInitialInfo() {
    setState(() {
      location = LocationModels.getLocation();
      doctor = DoctorModels.getDoctor();
      location.forEach((loc) {
        if(loc.rumahSakit == widget.rumahSakit){
          lokasiRumahSakit.add(loc.rumahSakit);
          lokasiRumahSakit.add(loc.alamat);
          lokasiRumahSakit.add(loc.noTelpon);
          lokasiRumahSakit.add(loc.noWa);
          lokasiRumahSakit.add(loc.layanan);
        }
      });

      doctor.forEach((doc) {
        if(doc.rumahSakit == widget.rumahSakit){
          dokterSesuaiLokasi.add([doc.doctors, doc.keahlian]);
        }
      });
    });
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

    Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: buildAppBar(context),
    backgroundColor: Colors.white,
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        mapMethod(),
        SizedBox(height: 10,),
        tabBar(),

        SizedBox(height: 20),
        
        if(activeIndex == 0) descriptionSection(),
        if (activeIndex == 1) contactSection(),
        if(activeIndex == 2) doctorSection(),

      ],
    ),
  );
}

Expanded doctorSection() {
  return Expanded(
        child: ListView(
          children: [
            SizedBox(width: 10),
              if(dokterSesuaiLokasi.length != null)
                ListView.builder(
                  shrinkWrap : true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: dokterSesuaiLokasi.length,
                  itemBuilder: (context, index) {
                    return 
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailedDoctor(doctorName: dokterSesuaiLokasi[index][0]),
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
                              ]
                            ),
                        child: 
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 24,
                              backgroundImage: AssetImage("assets/icons/Male-young-doctor-transparent-PNG.png"),
                              
                            ),
                            SizedBox(width: 20,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(dokterSesuaiLokasi[index][0],
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold
                                  ),),
                                Text(dokterSesuaiLokasi[index][1],
                                  style: TextStyle(
                                    fontSize: 13
                                  ))
                              ],
                            ),
                          ],
                        ),
                      
                      ),
                    );
                  }
                )
          ],
        )
      );
}

Container mapMethod() {
  return Container(
    child: Image.asset(
      'assets/icons/mapsExample.png',
      height: 300,
      fit: BoxFit.cover,
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
                print("Tombol Deskripsi Ditekan");
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
                child: Text("Deskripsi", style: TextStyle(fontSize: 17)),
              ),
            ),
            SizedBox(width: 30),

            GestureDetector(
              onTap: () {
                print("Tombol Kontak Ditekan");
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
                child: Text("Kontak", style: TextStyle(fontSize: 17)),
              ),
            ),
            SizedBox(width: 30),

            GestureDetector(
              onTap: () {
                print("Tombol Dokter Ditekan");
                 setState(() {
                  activeIndex = 2; // Set ke 0 saat "Deskripsi" diaktifkan
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border(bottom: 
                    BorderSide(
                      color: activeIndex == 2 ? Colors.blueAccent : Colors.white,
                      width: 2,
                  ))
                ),
                child: Text("Dokter", style: TextStyle(fontSize: 17)),
              ),
            ),
            SizedBox(width: 30),
          ],
        ),
      );
}

Expanded contactSection() {
  return Expanded(
          child: ListView(
            // padding: EdgeInsets.only(left: 15.0),
            children: [
              SizedBox(width: 10),
              if (lokasiRumahSakit.length > 3)
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return 
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _makePhoneCall(lokasiRumahSakit[2]);
                          },
                          child: Container(
                            width: double.infinity, // Mengatur agar kotak memiliki lebar penuh
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
                              ]
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.phone, color: Colors.blue, size: 20),
                                    SizedBox(width: 8),
                                      Text("Nomor Telepon",style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                    ),),
                                  ],
                                ),
                                SizedBox(height: 3),
                                Padding(
                                  padding: const EdgeInsets.only(left: 29.0),
                                  child: Text(
                                    lokasiRumahSakit[2] ?? "Data tidak tersedia",
                                    style: TextStyle(fontSize: 16),
                                    ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        GestureDetector(
                          onTap: (){
                            print("Tombol Wa Ditekan");
                            _launchInBrowser(Uri.parse("https://wa.me/"+lokasiRumahSakit[3]));
                          },
                          child: Container(
                            width: double.infinity, // Mengatur agar kotak memiliki lebar penuh
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
                              ]
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SvgPicture.asset('assets/icons/whatsapp-svgrepo-com.svg',
                                    width: 19,
                                    height: 19),
                                    SizedBox(width: 8),
                                    Text("Nomor Whatsapp",
                                      style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                    ),),
                                  ],
                                ),
                                SizedBox(height: 3),
                                Padding(
                                  padding: const EdgeInsets.only(left: 25.0),
                                  child: Text(
                                    lokasiRumahSakit[3] ?? "Data tidak tersedia",
                                    style: TextStyle(fontSize: 16),
                                    ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                      ],
                    );
                  },
                )
              else
                Text("Data kontak tidak tersedia"),
            ],
          ),
        );
}

Expanded descriptionSection() {
  return Expanded(
        child: ListView(
          padding: EdgeInsets.only(left: 15.0),
          children: [
            Text(
              lokasiRumahSakit.isNotEmpty ? lokasiRumahSakit[0] : "Nama Rumah Sakit",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(lokasiRumahSakit.isNotEmpty ? lokasiRumahSakit[1] : "Alamat Rumah Sakit"),
            SizedBox(height: 20),
            Text("Layanan Yang Tersedia :"),
            if (lokasiRumahSakit.length > 4 && lokasiRumahSakit[4] is List<String>)
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: (lokasiRumahSakit[4] as List<String>).length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 25,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text("- " + (lokasiRumahSakit[4] as List<String>)[index],
                            style: TextStyle(
                            fontSize: 15,
                                                ),),
                        ),
                      ],
                    ),
                  );
                },
              )
            else
              Text("Data layanan tidak tersedia"),
          ],
        ),
      );
}

AppBar buildAppBar(BuildContext context) { 
  return AppBar(
    title: Text(
      "${widget.rumahSakit}",
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



