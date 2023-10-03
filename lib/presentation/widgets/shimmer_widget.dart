import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Shimmer.fromColors(
            baseColor: const Color.fromARGB(255, 30, 29, 29),
            highlightColor: const Color.fromARGB(255, 36, 34, 34),
            child: Column(
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  color: const Color.fromARGB(255, 30, 29, 29),
                ),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 40),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Container(
                          height: 60,
                          width: 80,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              color: const Color.fromARGB(255, 30, 29, 29)),
                        ),
                        title: Container(
                          height: 10,
                          width: double.infinity,
                          color: const Color.fromARGB(255, 30, 29, 29),
                        ),
                        subtitle: Container(
                          height: 10,
                          width: double.infinity,
                          color: const Color.fromARGB(255, 30, 29, 29),
                        ),
                      );
                    },
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
