import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLobsterFont = false;

  void _switchFont() {
    setState(() {
      _isLobsterFont = !_isLobsterFont;
    });
  }

  @override
  Widget build(BuildContext context) {
    const double buttonBorderRadius = 25;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: _isLobsterFont
            ? ThemeData.light().textTheme.apply(fontFamily: 'Lobster')
            : ThemeData.light().textTheme.apply(fontFamily: 'Noto Mono'),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Fontsy Fonter Font Switcher",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          // Quelle: https://stackoverflow.com/a/70683851
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blueAccent, Colors.purpleAccent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blueAccent, Colors.purpleAccent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Fontsy Fonter Font Switcher',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Current font: ${_isLobsterFont ? "Lobster" : "Noto Mono"}',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 30),
                  GestureDetector(
                    onTap: _switchFont,
                    child: Stack(
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(buttonBorderRadius),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black38,
                                blurRadius: 10,
                                spreadRadius: 5,
                              ),
                            ],
                          ),
                        ),
                        ClipRRect(
                          borderRadius:
                              BorderRadius.circular(buttonBorderRadius),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius:
                                  BorderRadius.circular(buttonBorderRadius),
                              onTap: _switchFont,
                              splashColor: Colors.blue.withOpacity(0.3),
                              child: Ink(
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/fontsy_fonter_switcher.jpeg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                width: 150,
                                height: 150,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Tappe das Bild, um den Font zu switchen',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
