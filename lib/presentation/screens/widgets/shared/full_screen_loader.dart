import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> getLoadingMessages() {
    final messages = <String>[
      'Buscando algo que ver...',
      'Preparando palomitas...',
      'Escogiendo bebida...',
      '¿Nachos?',
      'Ya falta poco...',
      'Igual se rompió algo...',
    ];
    return Stream.periodic(
            const Duration(milliseconds: 1500), (step) => messages[step])
        .take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircularProgressIndicator(
          strokeWidth: 2,
        ),
        const SizedBox(
          height: 10,
        ),
        StreamBuilder(
          stream: getLoadingMessages(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text('Cargando...');
            return Text(snapshot.data!);
          },
        )
      ],
    ));
  }
}
