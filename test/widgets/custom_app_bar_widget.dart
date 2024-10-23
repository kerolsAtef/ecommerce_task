import 'package:e_commerce_task/core/utils/colors_manager.dart';
import 'package:e_commerce_task/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  testWidgets('CustomAppBar renders correctly with title', (WidgetTester tester) async {
    // Define the title for the app bar
    const appBarTitle = "Home";

    // Build the widget and trigger a frame
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812), // Design size
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp(
            home: Scaffold(
              appBar: CustomAppBar(title: appBarTitle),
            ),
          );
        },
      ),
    );

    // Verify that the CustomAppBar is rendered
    expect(find.byType(CustomAppBar), findsOneWidget);

    // Verify that the title is displayed correctly
    expect(find.text(appBarTitle), findsOneWidget);
    expect(find.text("Delivery Address"), findsOneWidget);

    // Verify the presence of the discount icon
    expect(find.byIcon(Icons.discount_outlined), findsOneWidget);

    // Verify the presence of the notification icon
    expect(find.byIcon(Icons.notification_important), findsOneWidget);

    // Verify the red notification dot by checking the container's presence and properties
    expect(find.byWidgetPredicate((widget) {
      if (widget is Container) {
        final BoxDecoration? decoration = widget.decoration as BoxDecoration?;
        return decoration != null &&
            decoration.color == ColorsManager.red && // Check for red color
            decoration.shape == BoxShape.circle; // Ensure it's a circle
      }
      return false;
    }), findsOneWidget);
  });
}
