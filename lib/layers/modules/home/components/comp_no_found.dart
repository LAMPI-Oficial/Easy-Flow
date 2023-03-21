import 'package:flutter/material.dart';

class CompNoFound extends StatelessWidget {
  const CompNoFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 50),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Image.asset(
              "assets/images/scan_delete.png",
              color: const Color(0xFF4A6F91),
            ),
          ),
          // const
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
    );
  }
}
