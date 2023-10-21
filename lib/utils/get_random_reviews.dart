import 'dart:math';

import 'package:clot/models/product_review.dart';

List<ProductReview> getRandomReviews() {
  final amountOfReviews = Random().nextInt(4) + 1;

  return List.generate(amountOfReviews, (index) {
    final rating = Random().nextInt(4) + 1;
    return ProductReview(
      userName: "John Doe",
      rating: rating,
      comment:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    );
  });
}
