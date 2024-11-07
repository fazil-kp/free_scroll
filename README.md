# FreeScroll

A Flutter package that enables freeform scrolling and zooming of widgets within a constrained area. This package is optimized for **both touchscreen devices** (like mobile, tablets, and touch-enabled PCs) and **non-touchscreen devices** (such as traditional desktop PCs and laptops). Whether you're using touch gestures or a mouse, FreeScroll provides a smooth zooming and scrolling experience.

## Features

- **Zooming**: Supports pinch-to-zoom gestures for touchscreen devices, allowing users to zoom in and out with customizable `minScale` and `maxScale` values.
- **Scrolling**: Freeform scrolling in any direction (horizontal and vertical) while zooming in or out.
- **Touchscreen and Non-Touchscreen Support**: Ideal for touchscreen devices (mobile, tablets, touch-enabled PCs) and non-touchscreen devices (desktop PCs). It supports pinch-to-zoom for touchscreens and mouse scroll zooming for non-touch devices.
- **Pointer Scroll Zooming**: For desktop users, zooming can be done using mouse scroll gestures.
- **Customizable Layout**: Configure padding, spacing, and constraints for width and height, making it flexible for various UI designs.
- **Responsive Layout**: Utilizes the `Wrap` widget for a flexible grid-like layout.

## Installation

Add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  free_scroll: ^latest_version
```