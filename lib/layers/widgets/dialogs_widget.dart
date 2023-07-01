import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Dialogs {
  static loading(context) {
    showDialog(
      context: context,
      builder: (context) => const Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 40,
              height: 40,
              child: CircularProgressIndicator.adaptive(),
            ),
            SizedBox(
              height: 20,
            ),
            AutoSizeText(
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
              AutoSizeText(
                title,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              AutoSizeText(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Color(0xFF737373),
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static delete(
    context, {
    required String name,
    required Function() onPressed,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: Text(
          'Excluir ${name.toLowerCase()}',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        title: const Text(
          'Tem certeza de que deseja excluir?\n Esta ação não pode ser desfeita.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
          ),
        ),
        content: SizedBox(
          height: 30,
          child: Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text(
                    'Cancelar',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const VerticalDivider(),
              Expanded(
                child: TextButton(
                    onPressed: () => onPressed(), child: const Text('Sim')),
              ),
            ],
          ),
        ),
        contentPadding: const EdgeInsets.all(16),
      ),
    );
  }

  static save(
    context, {
    required Function() discard,
    required Function() save,
  }) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              icon: const Text(
                'Alterações não salvas',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              title: const Text(
                'Você tem certeza que deseja sair e descartar as alterações?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              content: SizedBox(
                  height: 30,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text(
                            'Cancelar',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const VerticalDivider(
                        width: 0,
                      ),
                      Expanded(
                        child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              discard();
                            },
                            child: const Text('Descartar')),
                      ),
                      const VerticalDivider(
                        width: 0,
                      ),
                      Expanded(
                        child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              save();
                            },
                            child: const Text('Salvar')),
                      ),
                    ],
                  )),
              contentPadding: const EdgeInsets.all(16),
            ));
  }
}
