import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../shared/custom_bottom_bar/custom_bottom_bar.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({
    required this.customAppBar,
    required this.body,
    this.floatingActionButton,
    Key? key,
  }) : super(key: key);

  final Widget body;
  final Widget customAppBar;
  final Widget? floatingActionButton;

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(54),
        child: widget.customAppBar,
      ),
      body: widget.body,
      floatingActionButton: widget.floatingActionButton,
      resizeToAvoidBottomInset: false,
    );
  }
}
