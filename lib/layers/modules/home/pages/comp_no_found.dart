import 'package:flutter/material.dart';

class CompNoFound extends StatelessWidget {
  const CompNoFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsetsDirectional.symmetric(horizontal: 50, vertical: 10),
      alignment: Alignment.center,
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Image.asset(
                "assets/images/scan_delete.png",
                color: const Color(0xFF4A6F91),
              ),
            ),
            const Text.rich(
              style: TextStyle(
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
              TextSpan(
                children: [
                  TextSpan(
                    text: "Poxa, ainda não ",
                    style: TextStyle(
                      color: Color(0xFF4A6F90),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: "temos isso que você pesquisou ",
                    style: TextStyle(
                      color: Color(0xFF4A6F91),
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: "tente outro",
                    style: TextStyle(
                      color: Color(0xFF4A6F90),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
