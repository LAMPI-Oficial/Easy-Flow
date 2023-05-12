import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dialogs {
  static loading(context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 40,
              height: 40,
              child: Platform.isIOS
                  ? CupertinoActivityIndicator(
                      radius: 20, color: Theme.of(context).colorScheme.primary)
                  : CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Aguarde...',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  static error(context, {required String title, required String message}) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        alignment: Alignment.center,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          height: 160,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                color: Color(0xFFFF3737),
                size: 50,
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black),
              ),
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
