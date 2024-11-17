import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// A widget that enables freeform scrolling and zooming of widgets within a constrained area.
///
/// The `FreeScroll` widget allows users to zoom in/out and scroll the content freely. The widget
/// supports pinch-to-zoom gestures as well as pointer scroll events for zooming. It also provides
/// customizable padding, spacing, and other layout configurations.
class FreeScroll extends StatefulWidget {
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

  /// Children widgets to display in the scrollable area.
  final List<Widget> children;

  /// Creates a new [FreeScroll] widget.
  const FreeScroll({
    super.key,
    this.backgroundColor,
    this.minScale = 1.0,
    this.maxScale = 3.0,
    this.width,
    this.height,
    this.padding = const EdgeInsets.all(20.0),
    this.spacing = 15.0,
    this.runSpacing = 15.0,
    required this.children,
  });

  @override
  FreeScrollState createState() => FreeScrollState();
}

class FreeScrollState extends State<FreeScroll> {
  late double _scale;
  late Offset _offset;
  late Offset _startingFocalPoint;
  late Offset _previousOffset;

  @override
  void initState() {
    super.initState();
    _scale = 1.0;
    _offset = Offset.zero;
  }

  void resetView() {
    setState(() {
      _scale = 1.0;
      _offset = Offset.zero;
    });
  }

  /// Handles the start of the scale gesture.
  void onScaleStart(ScaleStartDetails details) {
    _startingFocalPoint = details.focalPoint;
    _previousOffset = _offset;
  }

  /// Updates the scale and offset as the scale gesture progresses.
  void onScaleUpdate(ScaleUpdateDetails details) {
    setState(() {
      _scale = (_scale * details.scale)
          .clamp(widget.minScale ?? 1.0, widget.maxScale ?? 3.0);
      final Offset offsetDelta = details.focalPoint - _startingFocalPoint;
      _offset = _previousOffset + offsetDelta;
    });
  }

  /// Handles pointer scroll events to zoom in or out.
  void onPointerSignal(PointerSignalEvent event) {
    if (event is PointerScrollEvent) {
      setState(() {
        _scale = (_scale + (event.scrollDelta.dy > 0 ? -0.1 : 0.1))
            .clamp(widget.minScale ?? 1.0, widget.maxScale ?? 3.0);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerSignal: onPointerSignal, // Listens for pointer scroll events.
      child: GestureDetector(
        onScaleStart:
            onScaleStart, // Triggers on the start of the scaling gesture.
        onScaleUpdate: onScaleUpdate, // Triggers when the scale is updated.
        child: Container(
          width: widget.width ??
              double
                  .infinity, // Use provided width or take the max available width.
          height: widget.height ??
              double
                  .infinity, // Use provided height or take the max available height.
          color: widget.backgroundColor ??
              Colors.white, // Background color, defaults to white.
          child: Padding(
            padding: widget.padding ??
                const EdgeInsets.all(
                    20.0), // Use provided padding or default to 20.0.
            child: ClipRect(
              // Clips the content to avoid overflowing.
              child: Transform(
                alignment:
                    Alignment.center, // The center will be used for zooming.
                transform: Matrix4.identity()
                  ..translate(
                      _offset.dx, _offset.dy) // Apply translation (scrolling).
                  ..scale(_scale), // Apply scaling (zooming).
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
                        spacing: widget.spacing ??
                            15.0, // Horizontal spacing between items.
                        runSpacing: widget.runSpacing ??
                            15.0, // Vertical spacing between items.
                        children: widget.children,
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

/// A helper class to manage the `FreeScroll` widget's key and actions.
class FreeScrollManager {
  /// A [GlobalKey] that uniquely identifies the `FreeScroll` widget and its state.
  final GlobalKey<FreeScrollState> _freeScrollKey =
      GlobalKey<FreeScrollState>();

  /// Getter for the [GlobalKey] to access the `FreeScroll` widget's state.
  GlobalKey<FreeScrollState> get key => _freeScrollKey;

  /// Resets the view of the `FreeScroll` widget.
  ///
  /// This method calls the `resetView` method on the current state of the
  /// `FreeScroll` widget, resetting its position and zoom level to the default.
  void resetView() {
    _freeScrollKey.currentState?.resetView();
  }
}
