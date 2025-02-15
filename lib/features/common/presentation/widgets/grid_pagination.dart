import 'package:flutter/cupertino.dart';
import 'package:formz/formz.dart';
    
class GridPaginator extends StatelessWidget {
  final FormzSubmissionStatus paginationStatus;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final int itemCount;
  final VoidCallback fetchMoreFunction;
  final bool hasMoreToFetch;
  final Widget errorWidget;
  final EdgeInsets? padding;
  final Widget? emptyWidget;
  final Widget Function(BuildContext context, int index)? separatorBuilder;
  final Axis scrollDirection;
  final Widget? loadingWidget;
  final SliverGridDelegate gridDelegate;
  final ScrollPhysics? physics;
  final Widget? paginationLoader;

  const GridPaginator({
    required this.paginationStatus,
    required this.itemBuilder,
    required this.itemCount,
    required this.fetchMoreFunction,
    required this.hasMoreToFetch,
    required this.errorWidget,
    required this.gridDelegate,
    this.padding = EdgeInsets.zero,
    this.scrollDirection = Axis.vertical,
    this.separatorBuilder,
    this.emptyWidget,
    this.loadingWidget,
    this.physics,
    this.paginationLoader,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (paginationStatus == FormzSubmissionStatus.inProgress) {
      return loadingWidget ?? const Center(child: CupertinoActivityIndicator());
    } else if (paginationStatus == FormzSubmissionStatus.failure) {
      return errorWidget;
    } else if (paginationStatus == FormzSubmissionStatus.success) {
      return itemCount == 0
          ? emptyWidget ?? const SizedBox.shrink()
          : GridView.builder(
              gridDelegate: gridDelegate,
              scrollDirection: scrollDirection,
              physics: physics ?? const BouncingScrollPhysics(),
              padding: padding,
              itemBuilder: (context, index) {
                if (itemCount == 0) {
                  return emptyWidget ?? const SizedBox.shrink();
                }
                if (index == itemCount) {
                  if (hasMoreToFetch) {
                    fetchMoreFunction();
                    return paginationLoader ?? const Center(child: CupertinoActivityIndicator());
                  } else {
                    return const SizedBox.shrink();
                  }
                }
                return itemBuilder(context, index);
              },
              itemCount: itemCount + 1,
              shrinkWrap: true,
            );
    } else {
      return const SizedBox.shrink();
    }
  }
}
