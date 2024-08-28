import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<String> images = [
    'assets/images/image-1.png',
    'assets/images/image-2.png',
    'assets/images/image-3.png',
    'assets/images/image-4.png',
    'assets/images/image-5.png',
    'assets/images/image-6.png',
  ];

  final List<String> titles = [
    'Gambar 1',
    'Gambar 2',
    'Gambar 3',
    'Gambar 4',
    'Gambar 5',
    'Gambar 6',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Grid',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Image Grid'),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: GridView.builder(
            itemCount: images.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.6,
                          child: PageView.builder(
                            itemCount: images.length,
                            itemBuilder: (BuildContext context, int pageIndex) {
                              return Column(
                                children: [
                                  Expanded(
                                    child: Image.asset(
                                      images[pageIndex],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    titles[pageIndex],
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Column(
                  children: [
                    Expanded(
                      child: Image.asset(
                        images[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      titles[index],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}