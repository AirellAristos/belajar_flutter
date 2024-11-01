import 'package:flutter/material.dart';

class LocationModels {
  String rumahSakit;
  String alamat;
  String noTelpon;
  String noWa;
  List<String> layanan;

  LocationModels({
    required this.rumahSakit,
    required this.alamat,
    required this.noTelpon,
    required this.noWa,
    required this.layanan
  });

  static List<LocationModels> getLocation() {
    List<LocationModels> location = [];
    
    location.add(
      LocationModels(
        rumahSakit: "Rumah Sakit A", 
        alamat: "Jl. Raden Gilap No. 8, Palimanan, Cirebon", 
        noTelpon: "02263762056",
        noWa: "6281318076969",
        layanan: [
          "EP & Cathlab",
          "Klinik Jantung",
          "Klinik Rehabilitasi Medik",
          "Klinik Penyakit Dalam",
          "Klinik Penyakit Paru",
          "Instalasi Radiologi",
          "Instalasi Laboratorium",
          "Instalasi Farmasi",
          "Echocardiography Dewasa & Anak",
          "Electrocardiography",
          "Treadmill Test",
          "Holter Monitor",
          "CT Cardiac",
          "Rawat Inap",
          "IGD & Ambulance 24 Jam",
          "ICCU",
          "Medical Check Up"
        ]) //(022) 63762056
    );

    location.add(
      LocationModels(
        rumahSakit: "Rumah Sakit B", 
        alamat: "Jl. Ir. H. Juanda, Kedawung, Cirebon", 
        noTelpon: "02328611111",
        noWa:"6281318076969",
        layanan: [
          "EP & Cathlab",
          "Klinik Jantung",
          "Klinik Rehabilitasi Medik",
          "Klinik Penyakit Dalam",
          "Klinik Penyakit Paru",
          "Instalasi Radiologi",
          "Instalasi Laboratorium",
          "Instalasi Farmasi",
          "Echocardiography Dewasa & Anak",
          "Electrocardiography",
          "Treadmill Test",
          "Holter Monitor",
          "CT Cardiac",
          "Rawat Inap",
          "IGD & Ambulance 24 Jam",
          "ICCU",
          "Medical Check Up"
        ])
    );

    location.add(
      LocationModels(
        rumahSakit: "Rumah Sakit C", 
        alamat: "Jl. Raya Langut, Lohbener, KM 150 Indramayu", 
        noTelpon: "0231343405",
        noWa:"6281318076969",
        layanan: [
          "EP & Cathlab",
          "Klinik Jantung",
          "Klinik Rehabilitasi Medik",
          "Klinik Penyakit Dalam",
          "Klinik Penyakit Paru",
          "Instalasi Radiologi",
          "Instalasi Laboratorium",
          "Instalasi Farmasi",
          "Echocardiography Dewasa & Anak",
          "Electrocardiography",
          "Treadmill Test",
          "Holter Monitor",
          "CT Cardiac",
          "Rawat Inap",
          "IGD & Ambulance 24 Jam",
          "ICCU",
          "Medical Check Up"
        ])
    );

    return location;
    }
}