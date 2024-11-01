import 'package:flutter/material.dart';

class DoctorModels {
  String doctors;
  String rumahSakit;
  String keahlian;
  List<Map<String, dynamic>> schedule; // Array of schedule maps

  DoctorModels({
    required this.doctors,
    required this.rumahSakit,
    required this.keahlian,
    required this.schedule, // Schedule list
  });

  static List<DoctorModels> getDoctor() {
    List<DoctorModels> doctor = [];

  doctor.add(
    DoctorModels(
      doctors: "Dr. John Doe",
      rumahSakit: "Rumah Sakit A",
      keahlian: "Ahli Jantung & Pembuluh Darah",
      schedule: [
        {
          "day": "Senin",
          "time": "10:00-14:00",
          "available": true,
        },
        {
          "day": "Selasa",
          "time": "07:00-12:00",
          "available": true,
        },
        {
          "day": "Rabu",
          "time": "08:00-13:00",
          "available": true,
        },
        {
          "day": "Kamis",
          "time": "09:00-15:00",
          "available": true,
        },
        {
          "day": "Jumat",
          "time": "10:00-14:00",
          "available": true,
        },
        {
          "day": "Sabtu",
          "time": "08:00-12:00",
          "available": false,
        },
        {
          "day": "Minggu",
          "time": "Libur",
          "available": false,
        },
      ],
    ),
  );

  doctor.addAll([
    DoctorModels(
      doctors: "Dr. Alice Smith",
      rumahSakit: "Rumah Sakit B",
      keahlian: "Spesialis Anak",
      schedule: [
        {"day": "Senin", "time": "09:00-13:00", "available": true},
        {"day": "Selasa", "time": "08:00-12:00", "available": true},
        {"day": "Rabu", "time": "10:00-14:00", "available": true},
        {"day": "Kamis", "time": "07:00-11:00", "available": true},
        {"day": "Jumat", "time": "09:00-12:00", "available": true},
        {"day": "Sabtu", "time": "Libur", "available": false},
        {"day": "Minggu", "time": "Libur", "available": false},
      ],
    ),
    DoctorModels(
      doctors: "Dr. Bob Johnson",
      rumahSakit: "Rumah Sakit C",
      keahlian: "Spesialis Bedah",
      schedule: [
        {"day": "Senin", "time": "13:00-18:00", "available": true},
        {"day": "Selasa", "time": "07:00-10:00", "available": true},
        {"day": "Rabu", "time": "08:00-11:00", "available": true},
        {"day": "Kamis", "time": "14:00-19:00", "available": true},
        {"day": "Jumat", "time": "10:00-14:00", "available": true},
        {"day": "Sabtu", "time": "09:00-12:00", "available": true},
        {"day": "Minggu", "time": "Libur", "available": false},
      ],
    ),
    DoctorModels(
      doctors: "Dr. Carol Taylor",
      rumahSakit: "Rumah Sakit A",
      keahlian: "Spesialis Kulit dan Kelamin",
      schedule: [
        {"day": "Senin", "time": "11:00-15:00", "available": true},
        {"day": "Selasa", "time": "09:00-13:00", "available": true},
        {"day": "Rabu", "time": "14:00-18:00", "available": true},
        {"day": "Kamis", "time": "10:00-14:00", "available": true},
        {"day": "Jumat", "time": "07:00-11:00", "available": true},
        {"day": "Sabtu", "time": "Libur", "available": false},
        {"day": "Minggu", "time": "Libur", "available": false},
      ],
    ),
    DoctorModels(
      doctors: "Dr. David Lee",
      rumahSakit: "Rumah Sakit B",
      keahlian: "Spesialis Saraf",
      schedule: [
        {"day": "Senin", "time": "08:00-12:00", "available": true},
        {"day": "Selasa", "time": "07:00-11:00", "available": true},
        {"day": "Rabu", "time": "09:00-13:00", "available": true},
        {"day": "Kamis", "time": "14:00-18:00", "available": true},
        {"day": "Jumat", "time": "10:00-14:00", "available": true},
        {"day": "Sabtu", "time": "Libur", "available": false},
        {"day": "Minggu", "time": "Libur", "available": false},
      ],
    ),
    DoctorModels(
      doctors: "Dr. Emma Thomas",
      rumahSakit: "Rumah Sakit C",
      keahlian: "Spesialis Gizi",
      schedule: [
        {"day": "Senin", "time": "10:00-14:00", "available": true},
        {"day": "Selasa", "time": "09:00-12:00", "available": true},
        {"day": "Rabu", "time": "08:00-12:00", "available": true},
        {"day": "Kamis", "time": "13:00-17:00", "available": true},
        {"day": "Jumat", "time": "09:00-11:00", "available": true},
        {"day": "Sabtu", "time": "Libur", "available": false},
        {"day": "Minggu", "time": "Libur", "available": false},
      ],
    ),
    DoctorModels(
      doctors: "Dr. Frank Wilson",
      rumahSakit: "Rumah Sakit A",
      keahlian: "Spesialis THT",
      schedule: [
        {"day": "Senin", "time": "08:00-13:00", "available": true},
        {"day": "Selasa", "time": "10:00-15:00", "available": true},
        {"day": "Rabu", "time": "09:00-14:00", "available": true},
        {"day": "Kamis", "time": "07:00-11:00", "available": true},
        {"day": "Jumat", "time": "13:00-17:00", "available": true},
        {"day": "Sabtu", "time": "Libur", "available": false},
        {"day": "Minggu", "time": "Libur", "available": false},
      ],
    ),
    DoctorModels(
      doctors: "Dr. George Harris",
      rumahSakit: "Rumah Sakit B",
      keahlian: "Spesialis Gigi",
      schedule: [
        {"day": "Senin", "time": "07:00-12:00", "available": true},
        {"day": "Selasa", "time": "10:00-14:00", "available": true},
        {"day": "Rabu", "time": "08:00-13:00", "available": true},
        {"day": "Kamis", "time": "09:00-12:00", "available": true},
        {"day": "Jumat", "time": "11:00-15:00", "available": true},
        {"day": "Sabtu", "time": "Libur", "available": false},
        {"day": "Minggu", "time": "Libur", "available": false},
      ],
    ),
    DoctorModels(
      doctors: "Dr. Hannah Brown",
      rumahSakit: "Rumah Sakit C",
      keahlian: "Spesialis Kandungan",
      schedule: [
        {"day": "Senin", "time": "13:00-17:00", "available": true},
        {"day": "Selasa", "time": "08:00-12:00", "available": true},
        {"day": "Rabu", "time": "09:00-14:00", "available": true},
        {"day": "Kamis", "time": "10:00-13:00", "available": true},
        {"day": "Jumat", "time": "12:00-16:00", "available": true},
        {"day": "Sabtu", "time": "Libur", "available": false},
        {"day": "Minggu", "time": "Libur", "available": false},
      ],
    ),
    DoctorModels(
      doctors: "Dr. Ian Green",
      rumahSakit: "Rumah Sakit A",
      keahlian: "Spesialis Rehabilitasi",
      schedule: [
        {"day": "Senin", "time": "10:00-14:00", "available": true},
        {"day": "Selasa", "time": "09:00-12:00", "available": true},
        {"day": "Rabu", "time": "08:00-13:00", "available": true},
        {"day": "Kamis", "time": "11:00-15:00", "available": true},
        {"day": "Jumat", "time": "09:00-12:00", "available": true},
        {"day": "Sabtu", "time": "Libur", "available": false},
        {"day": "Minggu", "time": "Libur", "available": false},
      ],
    ),
    DoctorModels(
      doctors: "Dr. Jack Martin",
      rumahSakit: "Rumah Sakit B",
      keahlian: "Spesialis Kesehatan Mental",
      schedule: [
        {"day": "Senin", "time": "08:00-13:00", "available": true},
        {"day": "Selasa", "time": "07:00-11:00", "available": true},
        {"day": "Rabu", "time": "09:00-12:00", "available": true},
        {"day": "Kamis", "time": "13:00-16:00", "available": true},
        {"day": "Jumat", "time": "10:00-13:00", "available": true},
        {"day": "Sabtu", "time": "Libur", "available": false},
        {"day": "Minggu", "time": "Libur", "available": false},
      ],
    ),
  ]);

    return doctor;
  }
}
