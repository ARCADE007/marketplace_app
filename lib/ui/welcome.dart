import 'package:flutter/material.dart';
import 'package:marketplace/ui/category.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 255, 255, 255),
                  Color.fromARGB(255, 255, 255, 255),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp)),
        child: Center(
          child: Stack(
            children: [
              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/logo.png',
                      height: 200,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 180,
                bottom: 10,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/Character.png',
                      width: 1000,
                    ),
                  ],
                ),
              ),
              Positioned(
                  bottom: -10,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const Category()));
                      },
                      child: Container(
                        height: 50,
                        decoration: const BoxDecoration(
                          // color:'#bc84e8',
                          color: Color.fromARGB(255, 108, 99, 255),

                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        child: const Center(
                          child: Text(
                            'Explore',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
