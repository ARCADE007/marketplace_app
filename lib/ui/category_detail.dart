import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:marketplace/services/firestore_services.dart';

class CatogaryDetails extends StatelessWidget {
  final String? title;
  const CatogaryDetails({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
        backgroundColor: Color.fromARGB(255, 58, 50, 107),
      ),
      body: StreamBuilder(
        stream: FirestoreServices.getArtists(title),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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

            return Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 100, 90, 163),
                    spreadRadius: 10,
                    blurRadius: 2,
                  ),
                ],
              ),
              padding: const EdgeInsets.all(40),
              child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: data.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 40,
                      crossAxisSpacing: 8,
                      mainAxisExtent: 400),
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: GestureDetector(
                        // onTap: () {
                        //   Navigator.pushReplacement(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (_) => const Cat));
                        // },
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            children: [
                              Image.network(
                                data[index]['imgUrl'],
                                fit: BoxFit.scaleDown,
                              ),
                              Text("${data[index]['fullname']}"),
                              Text("${data[index]['tags']}"),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            );
          }
        },
      ),
    );
  }
}
