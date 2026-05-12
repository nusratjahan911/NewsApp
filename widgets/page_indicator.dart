import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../models/slider_model.dart';

class PageIndicatorWidget extends StatelessWidget {
  const PageIndicatorWidget({
    super.key,
    required this.activeIndex,
    required this.sliders,
  });

  final int activeIndex;
  final List<SliderModel> sliders;

  @override
  Widget build(BuildContext context) {
    if (sliders.isEmpty) {
      return const SizedBox();
    }
    final safeIndex = activeIndex >= sliders.length ? 0 : activeIndex;

    return AnimatedSmoothIndicator(
      activeIndex: safeIndex,
      count: sliders.length,
      effect: WormEffect(
        dotWidth: 8,
        dotHeight: 8,
        spacing: 6,
        dotColor: Colors.blue,
      ),
    );
  }
}
