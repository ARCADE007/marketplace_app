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
              padding: const EdgeInsets.all(12),
              child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: data.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      mainAxisExtent: 500),
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
                                data[index]['imgUrl'][0],
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
