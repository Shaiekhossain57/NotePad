import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class CategoriesShimmar extends StatelessWidget {
  const CategoriesShimmar({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Row(

          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Colors.white,
                ),
                height: 40.0,
                width: 70.0,
                // Shimmer background color
              ),
            ),

            SizedBox(width: 10.0),

            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Colors.white,
                ),
                height: 40.0,
                width: 70.0,
                // Shimmer background color
              ),
            ),

            SizedBox(width: 10.0),

            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Colors.white,
                ),
                height: 40.0,
                width: 70.0,
                // Shimmer background color
              ),
            ),

            SizedBox(width: 10.0),

            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Colors.white,
                ),
                height: 40.0,
                width: 70.0,
                // Shimmer background color
              ),
            ),

            SizedBox(width: 10.0),

            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                ),
                height: 40.0,
                width: 70.0,
                // Shimmer background color
              ),
            ),

            SizedBox(width: 10.0),

          ],
        ),
      ),
    );
  }
}
