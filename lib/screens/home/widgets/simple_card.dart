import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SimpleCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
              children: [
                Flexible(
                  child: Text(
                    "Antes de enviar o seu currículo, que tal checar a última vez que você o atualizou? Uma informação a mais pode ser o ponta-pé que falta rumo à sua próxima entrevista de emprego.",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: OutlinedButton(
                    onPressed: () => {},
                    child: Text("CHECAR CURRÍCULO"),
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      side: BorderSide(color: Colors.blue, width: 1),
                    ),
                  ),
                ),
                Text("Achou útil?"),
                SvgPicture.network(
                    "https://raw.githubusercontent.com/Enable-Ventures/teste-apps/f5c698c8491e44a48026ef057adfd29b726b6806/api/assets/Icons/Action/thumb_up.svg"),
                SvgPicture.network(
                    "https://raw.githubusercontent.com/Enable-Ventures/teste-apps/f5c698c8491e44a48026ef057adfd29b726b6806/api/assets/Icons/Action/thumb_up%20Copy.svg"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
