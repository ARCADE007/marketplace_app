import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marketplace/ui/category_detail.dart';
import 'package:marketplace/ui/youtube.dart';

class ArtistDetails extends StatelessWidget {
  final String? title;
  final dynamic data;
  const ArtistDetails({Key? key, required this.title, this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 100, 90, 163),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (_) =>
                        CatogaryDetails(title: "${data['category']}")));
          },
        ),
        title: Text(
          title!,
        ),
        backgroundColor: const Color.fromARGB(255, 54, 49, 148),
      ),

      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Hero(
              transitionOnUserGestures: true,
              tag: data['imgUrl'],
              child: Image.network(
                data['imgUrl'],
                height: 260,
                fit: BoxFit.fill,
              ),
            ),
          ),
          // buttonArrow(context),
          scroll(),
        ],
      ),
    );
  }

  scroll() {
    return DraggableScrollableSheet(
        initialChildSize: 0.6,
        maxChildSize: 1.0,
        minChildSize: 0.6,
        builder: (context, scrollController) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 5,
                          width: 35,
                          color: const Color.fromARGB(255, 54, 49, 148),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "${data['fullname']}",
                    style: const TextStyle(fontSize: 40, color: Colors.black),
                  ),
                  Text(
                    "${data['tags']}",
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      height: 4,
                    ),
                  ),
                  const Text(
                    "Description",
                    style: TextStyle(fontSize: 25, color: Colors.black),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${data['description']}",
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      height: 4,
                    ),
                  ),
                  const Text(
                    "Highlights",
                    style: TextStyle(fontSize: 25, color: Colors.black),
                    textAlign: TextAlign.start,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: YoutubePlayerExample(videoUrl: data['youtubeLink']),
                  ),
                  const Text(
                    "Social Links",
                    style: TextStyle(fontSize: 25, color: Colors.black),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () async {
                          await Clipboard.setData(
                            ClipboardData(
                              text: "${data['mail']}",
                            ),
                          ).then(
                            (value) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Link copied to clipboard !"),
                                ),
                              );
                            },
                          );
                        },
                        child: Image.asset(
                          'assets/mail.png',
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      InkWell(
                        onTap: () async {
                          await Clipboard.setData(
                            ClipboardData(
                              text: "${data['instagram']}",
                            ),
                          ).then(
                            (value) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Link copied to clipboard !"),
                                ),
                              );
                            },
                          );
                        },
                        child: Image.asset(
                          'assets/instagram.png',
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      InkWell(
                        onTap: () async {
                          await Clipboard.setData(
                            ClipboardData(
                              text: "${data['website']}",
                            ),
                          ).then(
                            (value) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Link copied to clipboard !"),
                                ),
                              );
                            },
                          );
                        },
                        child: Image.asset(
                          'assets/website.png',
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      InkWell(
                        onTap: () async {
                          await Clipboard.setData(
                            ClipboardData(
                              text: "${data['youtube']}",
                            ),
                          ).then(
                            (value) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Link copied to clipboard !"),
                                ),
                              );
                            },
                          );
                        },
                        child: Image.asset(
                          'assets/youtube.png',
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 80,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
