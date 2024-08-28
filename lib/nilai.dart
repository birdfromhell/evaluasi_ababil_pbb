import 'package:flutter/material.dart';
import 'dart:io';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Evaluasi Ababil',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EvaluationPage(),
    );
  }
}

class EvaluationPage extends StatefulWidget {
  @override
  _EvaluationPageState createState() => _EvaluationPageState();
}

class _EvaluationPageState extends State<EvaluationPage> {
  String nama = '';
  double nilaiHarian = 0;
  double nilaiUTS = 0;
  double nilaiUAS = 0;
  double nilaiAkhir = 0;
  String predikat = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Evaluasi Ababil'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nama:'),
            TextField(
              onChanged: (value) {
                setState(() {
                  nama = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            Text('Nilai Harian:'),
            TextField(
              onChanged: (value) {
                setState(() {
                  nilaiHarian = double.tryParse(value) ?? 0;
                });
              },
            ),
            SizedBox(height: 16.0),
            Text('Nilai Ujian Tengah Semester:'),
            TextField(
              onChanged: (value) {
                setState(() {
                  nilaiUTS = double.tryParse(value) ?? 0;
                });
              },
            ),
            SizedBox(height: 16.0),
            Text('Nilai Ujian Akhir Semester:'),
            TextField(
              onChanged: (value) {
                setState(() {
                  nilaiUAS = double.tryParse(value) ?? 0;
                });
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  nilaiAkhir = (nilaiHarian + nilaiUTS + nilaiUAS) / 3;
                  if (nilaiAkhir > 90) {
                    predikat = 'A';
                  } else if (nilaiAkhir >= 81 && nilaiAkhir <= 91) {
                    predikat = 'B';
                  } else if (nilaiAkhir >= 70 && nilaiAkhir <= 80) {
                    predikat = 'C';
                  } else {
                    predikat = 'D';
                  }
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Hasil Evaluasi $nama'),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Nilai Akhir: $nilaiAkhir'),
                            Text('Predikat: $predikat'),
                          ],
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Tutup'),
                          ),
                        ],
                      );
                    },
                  );
                });
              },
              child: Text('Hitung Nilai'),
            ),
          ],
        ),
      ),
    );
  }
}