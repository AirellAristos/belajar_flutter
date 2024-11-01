import 'package:belajar_flutter/models/doctor_models.dart';
import 'package:belajar_flutter/models/location_models.dart';
import 'package:belajar_flutter/pages/search_doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Appoinment extends StatefulWidget {
  const Appoinment({super.key});

  @override
  State<Appoinment> createState() => _AppoinmentState();
}

class _AppoinmentState extends State<Appoinment> {
  List<LocationModels> lokasi = [];
  List<DoctorModels> dokter = [];
  String? selectedLocation;
  String? selectedSpeciality;
  String? doctorName;
  final TextEditingController dokterController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getInitialInfo();
  }

  void _getInitialInfo() {
    setState(() {
      lokasi = LocationModels.getLocation();
      dokter = DoctorModels.getDoctor();
    });
  }

  // Fungsi untuk menangani perubahan nilai
  void onChangedLocation(String? newValue) {
    setState(() {
      selectedLocation = newValue;
    });
  }

    void onChangeSpeciality(String? newValue) {
    setState(() {
      selectedSpeciality = newValue;
    });
  }

  // Fungsi untuk mendapatkan daftar DropdownMenuItem dari lokasi
  List<DropdownMenuItem<String>> getLocationDropdownItems() {
    return lokasi.map((location) {
      return DropdownMenuItem<String>(
        value: location.rumahSakit,
        child: Text(location.rumahSakit),
      );
    }).toList();
  }

  List<DropdownMenuItem<String>> getSpecialitiyDropdownItems() {
  return dokter.map((doctor) {
    return DropdownMenuItem<String>(
      value: doctor.keahlian,
      child: Text(doctor.keahlian),
      );
    }).toList();
  }

  void searchDoctor() {
    String doctorName = dokterController.text;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchDoctor(location: selectedLocation, spesialis: selectedSpeciality, doctorName: doctorName ),
      ),
    );
    // print("Nama Dokter: $doctorName");
  }



  @override
  void dispose() {
    // Membersihkan controller ketika widget dihancurkan untuk menghindari kebocoran memori
    dokterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      backgroundColor: Colors.white,
      body: 
      formSection(context),
      bottomNavigationBar: 
      Container(
        margin: EdgeInsets.only(bottom: 20.0),
        child: Padding(
            padding: EdgeInsets.all(16.0), // Padding untuk memberi jarak di sekitar tombol
            child: ElevatedButton(
              onPressed: searchDoctor,
              child: Text("Cari",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16
              ),),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 15), // Ukuran tombol lebih tinggi
                minimumSize: Size(double.infinity, 50), // Lebar penuh di bagian bawah
              ),
            ),
          ),
      ),
      );
}

Column formSection(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      SizedBox(height: 14),
      Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Cari & Daftar",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text("Cari Rumah Sakit, Dokter, atau Spesialis"),

            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Pilih Lokasi", 
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    )),
                Container(
                  width: MediaQuery.of(context).size.width - 20,
                  child: 
                  DropdownButtonFormField<String>(
                    value: selectedLocation,
                    isExpanded: true,
                    items: getLocationDropdownItems(), // Daftar item dropdown
                    onChanged: onChangedLocation,
                    dropdownColor: Colors.white, // Mengatur warna latar belakang dropdown
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey), // Warna underline saat tidak aktif
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey), // Warna underline saat aktif
                      ),
                    ),
                    hint: Text(
                        "Lokasi",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,),
                      ),
                    icon: Icon(Icons.arrow_drop_down), // Ikon dropdown
                  )
                ),
              ],
            ),

            SizedBox(height: 25),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Pilih Spesialis", 
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  )),
                Container(
                  width: MediaQuery.of(context).size.width - 20,
                  child: 
                  DropdownButtonFormField<String>(
                    value: selectedSpeciality,
                    isExpanded: true,
                    items: getSpecialitiyDropdownItems(), // Daftar item dropdown
                    onChanged: onChangeSpeciality,
                    dropdownColor: Colors.white, // Mengatur warna latar belakang dropdown
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey), // Warna underline saat tidak aktif
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey), // Warna underline saat aktif
                      ),
                    ),
                    hint: Text(
                        "Spesialis",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,),
                      ),
                    icon: Icon(Icons.arrow_drop_down), // Ikon dropdown
                  )
                ),
              ],
            ),

            SizedBox(height: 25),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Nama Dokter", 
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,)),
                  Container(
                    width: MediaQuery.of(context).size.width - 20,
                    child: TextField(
                      controller: dokterController,
                        decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                  )
              ],
            ),

          ],
        ),
      ),
    ],
  );
}

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      // title: 
      // Text(
      //   "",
      //   style: TextStyle(
      //     color: Colors.black,
      //     fontSize: 18,
      //     fontWeight: FontWeight.bold,
      //   ),
      // ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
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
