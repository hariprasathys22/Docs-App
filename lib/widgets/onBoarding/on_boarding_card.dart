import 'package:docs_ui/data/on_boading_list.dart';
import 'package:flutter/material.dart';

class OnBoardingCard extends StatelessWidget {
  const OnBoardingCard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    return Column(
      children:
          onBoardingItems.map((item) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: Container(
                height: 80,
                width: width > 1024 ? 500 : width,
                decoration: BoxDecoration(
                  color: const Color(0xffFFFFFF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    children: [
                      Icon(item.icon, size: 30, color: Color(0xffE500AC)),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.title,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              item.description,
                              style: TextStyle(fontSize: 12),
                              softWrap: true,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
    );
  }
}
