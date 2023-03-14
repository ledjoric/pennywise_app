import 'package:flutter/material.dart';

class GridViewBuilder extends StatelessWidget {
  final Widget listChild;
  final Axis? scrollDirection;
  final double? childAspectRatio;
  final ScrollPhysics? physics;
  const GridViewBuilder({
    super.key,
    required this.listChild,
    this.scrollDirection,
    this.childAspectRatio,
    this.physics,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: physics,
      scrollDirection: scrollDirection ?? Axis.vertical,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1, // set the number of columns to 1
        // mainAxisSpacing: 1, // set the spacing between each item
        childAspectRatio:
            childAspectRatio ?? 1, // set the aspect ratio of each item
      ),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return listChild;
      },
    );
  }
}
