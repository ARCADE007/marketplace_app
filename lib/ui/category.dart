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
      backgroundColor: const Color.fromARGB(255, 100, 90, 163),
      body: Container(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
            shrinkWrap: true,
            itemCount: 9,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
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
                        Image.asset(categoryImages[index]),
                        Text(categoriesList[index]),
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
