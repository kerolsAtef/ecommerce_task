import 'package:e_commerce_task/core/utils/colors_manager.dart';
import 'package:e_commerce_task/presentation/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CategoryItem renders correctly and responds to tap', (WidgetTester tester) async {
    // Define a mock function for the onTap callback
    bool isTapped = false;
    void mockOnTap() {
      isTapped = true;
    }

    // Build the widget and trigger a frame
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812), // Design size
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: CategoryItem(
                  path: 'assets/images/electronics.png', // Ensure you have a test image
                  onTapFun: mockOnTap,
                  selected: true, // Change this to test both true and false
                ),
              ),
            ),
          );
        },
      ),
    );


    // Verify that the category item is rendered with the correct image
    expect(find.byType(CategoryItem), findsOneWidget);
    expect(find.byType(GestureDetector), findsOneWidget);
    expect(find.byType(Container), findsOneWidget);

    // Tap the CategoryItem and verify the onTap callback is called
    await tester.tap(find.byType(GestureDetector));
    await tester.pump(); // Rebuild the widget after the state has changed

    // Check if the mock function was called
    expect(isTapped, true);
  });
}