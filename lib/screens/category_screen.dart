import 'package:flutter/material.dart';
import 'package:news_app/components/primary_button_component.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<String> newsType = [
    "Latest News",
    "News Archive",
    "News Sources",
    "Crypto News"
  ];
  List<String> selectedCat = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Select Your Category",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.close_rounded,
              color: Colors.black,
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {},
              child: const Text("SKIP"),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: AppBar().preferredSize.height,
        width: double.maxFinite,
        padding: const EdgeInsets.all(4),
        child: PrimaryButtonComponent(
          primaryText: "Continue",
          onPrimaryClick: selectedCat.isEmpty ? null : () {},
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: <Color>[
              Colors.blue.shade300,
              Colors.purple.shade300,
              Colors.indigo.shade100,
             ],
          ),
        ),
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          itemCount: newsType.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (_, index) {
            String textValue = newsType[index];
            bool isSelected = selectedCat.contains(textValue);
            return GestureDetector(
              onTap: () {
                String value = newsType[index];
                selectedCat.contains(value)
                    ? selectedCat.remove(value)
                    : selectedCat.add(value);
                setState(() {});
              },
              child: AnimatedContainer(
                duration: const Duration(microseconds: 200),
                decoration: BoxDecoration(
                  // gradient: LinearGradient(
                  //   begin: Alignment.bottomCenter,
                  //   end: Alignment.topCenter,
                  //   colors: <Color>[
                  //     Colors.blue.shade500,
                  //     Colors.purple.shade300,
                  //   ]
                  // ),
                  borderRadius: BorderRadius.circular(10),
                  color: isSelected ? Colors.blueAccent : Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(.7),
                      blurRadius: 4,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    textValue,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
