import 'package:belajar_flutter/models/location_models.dart';
import 'package:belajar_flutter/pages/detailed_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LocationPage extends StatefulWidget {
  LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  List<LocationModels> location = [];

  @override
  void initState() {
    super.initState();
    _getInitialInfo();
  }

  void _getInitialInfo() {
    setState(() {
      location = LocationModels.getLocation();
    });
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: buildAppBar(),
    backgroundColor: Colors.white,
    body: location.isEmpty
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: location.length,
            itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailedLocation(rumahSakit: location[index].rumahSakit),
                  ),
                );
              },
              child: buildLocationCard(location[index]), // Card content
            );
            },
          ),
  );
}


  AppBar buildAppBar() {
    return AppBar(
      title: Text(
        "Location",
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
          Navigator.pushNamed(context, '/homePage');
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

  // Widget to build each card for location
  Widget buildLocationCard(LocationModels location) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              location.rumahSakit,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              location.alamat,
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.phone, color: Colors.blue, size: 20),
                SizedBox(width: 8),
                Text(location.noTelpon),
              ],
            ),
            SizedBox(height: 4),
            Row(
              children: [
                SvgPicture.asset('assets/icons/whatsapp-svgrepo-com.svg',
                  width: 19,
                  height: 19),
                SizedBox(width: 8),
                Text(location.noWa),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
