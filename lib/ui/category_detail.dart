import 'package:chips_choice/chips_choice.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:marketplace/services/firestore_services.dart';
import 'package:marketplace/ui/artist_detail.dart';
import 'package:marketplace/ui/category.dart';

import '../consts/firebase_consts.dart';

class CatogaryDetails extends StatefulWidget {
  final String? title;
  const CatogaryDetails({Key? key, required this.title}) : super(key: key);

  @override
  State<CatogaryDetails> createState() => _CatogaryDetailsState();
}

class _CatogaryDetailsState extends State<CatogaryDetails> {
  String? tag;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => const Category()));
          },
        ),
        title: Text(widget.title!),
        backgroundColor: const Color.fromARGB(255, 54, 49, 148),
      ),
      body: Column(
        children: [
          ChipsChoice<String>.single(
            value: tag,
            onChanged: (val) => setState(() => tag = val),
            choiceItems: C2Choice.listFrom<String, String>(
              source: locations,
              value: (i, v) => v,
              label: (i, v) => v,
            ),
          ),
          StreamBuilder(
            stream: FirestoreServices.getArtistsByCategory(widget.title, tag),
            builder: (
              BuildContext context,
              AsyncSnapshot<QuerySnapshot> snapshot,
            ) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.red),
                  ),
                );
              } else if (snapshot.data!.docs.isEmpty) {
                return const Center(
                  child: Text("No product found !"),
                );
              } else {
                var data = snapshot.data!.docs;

                return Expanded(
                  child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: data.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              mainAxisSpacing: 0,
                              crossAxisSpacing: 8,
                              mainAxisExtent: 300),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 20.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => ArtistDetails(
                                            title: "${data[index]['fullname']}",
                                            data: data[index],
                                          )));
                            },
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Hero(
                                    transitionOnUserGestures: true,
                                    tag: data[index]['imgUrl'],
                                    child: Image.network(
                                      data[index]['imgUrl'],
                                      height: 300,
                                      width: double.infinity,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: -20,
                                  right: 40,
                                  child: Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              color: Color.fromARGB(
                                                  255, 108, 99, 255),
                                              spreadRadius: 2,
                                              blurRadius: 4,
                                              offset: Offset(0, 0))
                                        ],
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      //
                                      height: 50,
                                      width: 200,
                                      child: Column(children: [
                                        Text(
                                          "${data[index]['fullname']}",
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0)),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "${data[index]['tags']}",
                                          style: const TextStyle(
                                              fontSize: 14,
                                              color: Color.fromARGB(
                                                  255, 58, 58, 61)),
                                        ),
                                      ])),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
