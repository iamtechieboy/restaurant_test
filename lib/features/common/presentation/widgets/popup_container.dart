import 'package:flutter/material.dart';
import 'package:restaurant_test/core/util/enums/extensions.dart';
import 'package:restaurant_test/core/util/extensions/extensions.dart';

class PopUpContainer extends StatefulWidget {
  final PopUpStatus status;
  final VoidCallback? onCancel;
  final String message;

  const PopUpContainer({super.key, required this.status, required this.message, required this.onCancel});

  @override
  State<PopUpContainer> createState() => _PopUpContainerState();
}

class _PopUpContainerState extends State<PopUpContainer> with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 3), value: 1)..reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            offset: const Offset(0, 3),
            blurRadius: 22,
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 8),
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: widget.status.color,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: Colors.white.withOpacity(0.36)),
            ),
            child: const Icon(Icons.check)
          ),
          Expanded(
            child: Text(widget.message, style: context.textTheme.headlineLarge, textAlign: TextAlign.start),
          ),
          if (!widget.status.isWarning) ...{
            AnimatedBuilder(
              animation: animationController,
              builder: (BuildContext context, Widget? child) {
                if (animationController.value == 0) {
                  return const SizedBox(
                    height: 28,
                    width: 28,
                  );
                }
                return GestureDetector(
                  onTap: widget.onCancel,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Transform.flip(
                        flipX: true,
                        child: SizedBox(
                          height: 28,
                          width: 28,
                          child: CircularProgressIndicator(
                            color: Colors.grey,
                            strokeWidth: 1.6,
                            value: animationController.value,
                          ),
                        ),
                      ),
                      const Icon(Icons.close)
                    ],
                  ),
                );
              },
            )
          }
        ],
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
      