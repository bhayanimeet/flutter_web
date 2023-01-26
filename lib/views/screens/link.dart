import 'package:flutter/material.dart';

class Link extends StatefulWidget {
  const Link({Key? key}) : super(key: key);

  @override
  State<Link> createState() => _LinkState();
}

class _LinkState extends State<Link> {
  @override
  Widget build(BuildContext context) {
    List link = ModalRoute.of(context)!.settings.arguments as List;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Bookmark List",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            setState(() {
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            });
          },
          child: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        elevation: 2,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: (link.isEmpty)
            ? const Center(child: Text("No bookmark any website"))
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  ...link.map(
                    (e) => Container(
                      padding: const EdgeInsets.only(left: 10),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "${link.indexOf(e) + 1})  $e",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
      ),
    );
  }
}
