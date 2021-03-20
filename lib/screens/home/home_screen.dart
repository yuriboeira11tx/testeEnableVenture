import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:teste_enable_ventures/screens/home/widgets/simple_card.dart';
import 'package:teste_enable_ventures/screens/home/widgets/swiper_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseFirestore firebase = FirebaseFirestore.instance;
  double currentIndex = 0;
  int qtdSuggestions = 3;
  List<SwiperCard> listSuggestions = [];

  @override
  void initState() {
    super.initState();
    loadSuggestions();
  }

  // carregar sugestões do Firebase
  Future<void> loadSuggestions() async {
    QuerySnapshot querySnapshot =
        await firebase.collection("suggestions").get();

    for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
      var card = SwiperCard(
        jobAdTile: documentSnapshot.get("jobadtile"),
        company: documentSnapshot.get("company"),
        locations: documentSnapshot.get("locations"),
        salary: documentSnapshot.get("salary"),
        totalPositions: documentSnapshot.get("totalPositions"),
        date: documentSnapshot.get("date"),
      );

      setState(() {
        listSuggestions.add(card);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        elevation: 0.0,
        brightness: Brightness.dark,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage(
                    "https://4.bp.blogspot.com/-Jx21kNqFSTU/UXemtqPhZCI/AAAAAAAAh74/BMGSzpU6F48/s1600/funny-cat-pictures-047-001.jpg"),
                backgroundColor: Colors.grey,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Olá, ",
                      ),
                      Text(
                        "Usuário",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  "Sugestões de vagas para você",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: CarouselSlider(
                    items: listSuggestions,
                    options: CarouselOptions(
                        autoPlay: false,
                        aspectRatio: 2.0,
                        scrollDirection: Axis.horizontal,
                        viewportFraction: 1.0,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex = index.toDouble();
                          });
                        }),
                  )),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Visibility(
                    visible: qtdSuggestions > 0,
                    child: DotsIndicator(
                      dotsCount: qtdSuggestions,
                      position: currentIndex,
                      decorator: DotsDecorator(
                        activeColor: Colors.white,
                        color: Colors.black26,
                        size: Size.square(12.0),
                        activeSize: Size.square(12.0),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "#DicaDosRecrutadores",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    SizedBox(
                      width: 20.0,
                      height: 3.0,
                      child: Container(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                child: SimpleCard(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
