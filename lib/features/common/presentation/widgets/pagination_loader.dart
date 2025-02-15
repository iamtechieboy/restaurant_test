import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_test/core/util/extensions/extensions.dart'; 

class PaginationLoader extends StatefulWidget {
  const PaginationLoader({super.key});

  @override
  State<PaginationLoader> createState() => _PaginationLoaderState();
}

class _PaginationLoaderState extends State<PaginationLoader> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(seconds: 1), vsync: this)..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedBuilder(
          animation: _controller,
          builder: (ctx, child) {
            return Transform.rotate(
              angle: _controller.value * pi,
              child: child,
            );
          },
          child: const Icon(CupertinoIcons.refresh_bold),
        ),
        const Gap(4),
        Text(
          'Loading...',
          style: context.textTheme.headlineSmall?.copyWith(color: Colors.grey),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
