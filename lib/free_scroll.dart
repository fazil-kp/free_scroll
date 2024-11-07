import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// A widget that enables freeform scrolling and zooming of widgets within a constrained area.
///
/// The `FreeScroll` widget allows users to zoom in/out and scroll the content freely. The widget
/// supports pinch-to-zoom gestures as well as pointer scroll events for zooming. It also provides
/// customizable padding, spacing, and other layout configurations.
class FreeScroll extends HookWidget {
  /// The number of items in the scrollable area.
  final int itemCount;

  /// A function that builds the widget for each item.
  final IndexedWidgetBuilder itemBuilder;

  /// The background color of the scrollable area.
  final Color? backgroundColor;

  /// The minimum scale factor for zooming.
  final double? minScale;

  /// The maximum scale factor for zooming.
  final double? maxScale;

  /// The width of the scrollable area. If null, it will take the maximum width.
  final double? width;

  /// The height of the scrollable area. If null, it will take the maximum height.
  final double? height;

  /// The padding around the scrollable area.
  final EdgeInsets? padding;

  /// The spacing between items horizontally.
  final double? spacing;

  /// The spacing between items vertically.
  final double? runSpacing;

  /// Creates a new [FreeScroll] widget.
  const FreeScroll({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.backgroundColor,
    this.minScale = 1.0,
    this.maxScale = 3.0,
    this.width,
    this.height,
    this.padding = const EdgeInsets.all(20.0),
    this.spacing = 15.0,
    this.runSpacing = 15.0,
  });

  @override
  Widget build(BuildContext context) {
    final scale = useState(1.0); // Keeps track of the current scale factor.
    final offset =
        useState(Offset.zero); // Keeps track of the current offset (position).
    final startingFocalPoint =
        useState(Offset.zero); // The starting point of the scale gesture.
    final previousOffset =
        useState(Offset.zero); // The offset before scaling begins.

    /// Handles the start of the scale gesture.
    void onScaleStart(ScaleStartDetails details) {
      startingFocalPoint.value = details.focalPoint;
      previousOffset.value = offset.value;
    }

    /// Updates the scale and offset as the scale gesture progresses.
    void onScaleUpdate(ScaleUpdateDetails details) {
      scale.value =
          (scale.value * details.scale).clamp(minScale ?? 1.0, maxScale ?? 3.0);

      final Offset offsetDelta = details.focalPoint - startingFocalPoint.value;
      offset.value = previousOffset.value + offsetDelta;
    }

    /// Handles pointer scroll events to zoom in or out.
    void onPointerSignal(PointerSignalEvent event) {
      if (event is PointerScrollEvent) {
        scale.value = (scale.value + (event.scrollDelta.dy > 0 ? -0.1 : 0.1))
            .clamp(minScale ?? 1.0, maxScale ?? 3.0);
      }
    }

    return Listener(
      onPointerSignal: onPointerSignal, // Listens for pointer scroll events.
      child: GestureDetector(
        onScaleStart:
            onScaleStart, // Triggers on the start of the scaling gesture.
        onScaleUpdate: onScaleUpdate, // Triggers when the scale is updated.
        child: Container(
          width: width ??
              double
                  .infinity, // Use provided width or take the max available width.
          height: height ??
              double
                  .infinity, // Use provided height or take the max available height.
          color: backgroundColor ??
              Colors.grey[200], // Background color, defaults to light grey.
          child: Padding(
            padding: padding ??
                const EdgeInsets.all(
                    20.0), // Use provided padding or default to 20.0.
            child: ClipRect(
              // Clips the content to avoid overflowing.
              child: Transform(
                alignment:
                    Alignment.center, // The center will be used for zooming.
                transform: Matrix4.identity()
                  ..translate(offset.value.dx,
                      offset.value.dy) // Apply translation (scrolling).
                  ..scale(scale.value), // Apply scaling (zooming).
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: constraints
                            .maxWidth, // Ensure content fills the available width.
                        minHeight: constraints
                            .maxHeight, // Ensure content fills the available height.
                      ),
                      child: Wrap(
                        spacing: spacing ??
                            15.0, // Horizontal spacing between items.
                        runSpacing: runSpacing ??
                            15.0, // Vertical spacing between items.
                        children: List.generate(
                          itemCount, // Generate items based on the item count.
                          (index) => itemBuilder(context,
                              index), // Build each item using the itemBuilder.
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
