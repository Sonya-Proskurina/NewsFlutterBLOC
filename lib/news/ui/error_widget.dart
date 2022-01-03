import 'package:flutter/material.dart';

class ErrorListWidget extends StatelessWidget {
  const ErrorListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Ошибка! Пожалуйста, проверьте интернет соединение!',
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}
