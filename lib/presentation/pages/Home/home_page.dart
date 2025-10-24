import 'package:flutter/material.dart';

class HomePage
    extends
        StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'HomePage Page',
        ),
      ),
      backgroundColor: Color(
        0XFF4CAF50,
      ),
      body: const Center(
        child: Text(
          'Welcome to the HomePage Page!',
        ),
      ),
    );
  }
}
