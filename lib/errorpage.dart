import 'package:flutter/material.dart';

class ErrorPage extends StatefulWidget {
  const ErrorPage({Key? key, this.exception}) : super(key: key);

  final Exception? exception;

  @override
  State<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tutorify'),
      ),
      body: Center(
        child: Text(widget.exception.toString()),
      ),
    );
  }
}