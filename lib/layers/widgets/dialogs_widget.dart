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
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              message,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
