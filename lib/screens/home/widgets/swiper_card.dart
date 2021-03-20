import 'package:flutter/material.dart';

class SwiperCard extends StatelessWidget {
  final String company;
  final String date;
  final String jobAdTile;
  final List<dynamic> locations;
  final Map salary;
  final int totalPositions;

  SwiperCard(
      {this.company,
      this.date,
      this.jobAdTile,
      this.locations,
      this.salary,
      this.totalPositions});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  jobAdTile,
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
                Text(
                  date,
                  style: TextStyle(
                      color: Colors.amber, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  company,
                  style: TextStyle(),
                ),
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: Text(
                    locations.length > 1
                        ? "${totalPositions.toString()} vagas - ${locations.first} + ${locations.length - 1} cidades"
                        : "${totalPositions.toString()} vagas - ${locations.first}",
                    style: TextStyle(),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    "${salary["range"]}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Icon(
                  Icons.visibility,
                  color: Colors.blue,
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () => {},
                child: Text("ENVIAR CURRÍCULO"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
