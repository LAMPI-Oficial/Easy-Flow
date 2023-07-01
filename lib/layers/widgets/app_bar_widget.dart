import 'package:flutter/material.dart';

class AppBarWidget extends PreferredSize {
  final int value;
  final String subtitle;

  AppBarWidget({
    super.key,
    required this.value,
    required this.subtitle,
  }) : super(
            preferredSize: const Size(double.infinity, kToolbarHeight + 40),
            child: Container());

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size(double.infinity, kToolbarHeight + 40),
      child: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        flexibleSpace: Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Cadastro",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
              Text(
                subtitle,
                style: const TextStyle(
                    fontFamily: 'Outfit',
                    color: Color(
                      0xFF6C6A6A,
                    ),
                    fontWeight: FontWeight.w400),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 50,
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child: LinearProgressIndicator(
                          value: value >= 1 ? 1 : 0,
                          minHeight: 8,
                          backgroundColor:
                              const Color.fromRGBO(199, 211, 235, 1),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    SizedBox(
                      width: 50,
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child: LinearProgressIndicator(
                          value: value >= 2 ? 1 : 0,
                          minHeight: 8,
                          backgroundColor:
                              const Color.fromRGBO(199, 211, 235, 1),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    SizedBox(
                      width: 50,
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child: LinearProgressIndicator(
                          value: value >= 3 ? 1 : 0,
                          minHeight: 8,
                          backgroundColor:
                              const Color.fromRGBO(199, 211, 235, 1),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    SizedBox(
                      width: 50,
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child: LinearProgressIndicator(
                          value: value >= 4 ? 1 : 0,
                          minHeight: 8,
                          backgroundColor:
                              const Color.fromRGBO(199, 211, 235, 1),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
