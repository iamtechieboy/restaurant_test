import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:restaurant_test/features/common/presentation/widgets/pagination_loader.dart';

class ListPagination extends StatelessWidget {
  final FormzSubmissionStatus initialStatus;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final Widget Function(BuildContext context, int index)? separatorBuilder;
  final int itemCount;
  final VoidCallback fetchMoreFunction;
  final bool hasMoreToFetch;
  final Widget? errorWidget;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final EdgeInsets? padding;
  final Axis scrollDirection;
  final ScrollController? controller;

  const ListPagination({
    required this.initialStatus,
    required this.itemBuilder,
    this.separatorBuilder,
    this.errorWidget,
    required this.itemCount,
    required this.fetchMoreFunction,
    required this.hasMoreToFetch,
    this.shrinkWrap = false,
    this.padding,
    this.scrollDirection = Axis.vertical,
    super.key,
    this.physics,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    if (initialStatus.isInProgress) {
      return const Center(child: CircularProgressIndicator.adaptive());
    } else if (initialStatus.isFailure) {
      return errorWidget ?? const SizedBox.shrink();
    } else if (initialStatus.isSuccess) {
      return ListView.separated(
        controller: controller,
        padding: padding,
        scrollDirection: scrollDirection,
        shrinkWrap: shrinkWrap,
        physics: physics ?? const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          if (index == itemCount) {
            if (hasMoreToFetch) {
              fetchMoreFunction();
              return const Center(child: PaginationLoader());
            } else {
              return const SizedBox.shrink();
            }
          }
          return itemBuilder(context, index);
        },
        itemCount: itemCount + 1,
        separatorBuilder: separatorBuilder ?? (context, index) => const SizedBox.shrink(),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
    