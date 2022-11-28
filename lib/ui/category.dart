import 'package:flutter/material.dart';
import 'package:marketplace/consts/strings.dart';
import 'package:marketplace/ui/category_detail.dart';
import 'package:marketplace/consts/images.dart';

const categoriesList = [
  musics,
  dances,
  theatres,
  painters,
  designers,
  writers,
  photographys,
  tattoos,
  graffittis
];
const categoryImages = [
  music,
  dance,
  actor,
  painter,
  designer,
  writer,
  photography,
  tattoo,
  graffiti
];

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Category",
        ),
        backgroundColor: const Color.fromARGB(255, 54, 49, 148),
      ),
      backgroundColor: const Color.fromARGB(255, 108, 99, 255),
      body: Container(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
            shrinkWrap: true,
            itemCount: 9,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                mainAxisExtent: 200),
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                CatogaryDetails(title: categoriesList[index])));
                  },
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Image.asset(
                          categoryImages[index],
                          height: 150,
                          fit: BoxFit.scaleDown,
                        ),
                        Text(
                          categoriesList[index],
                          style: const TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 100, 90, 163)),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
