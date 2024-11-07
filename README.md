# Free Scroll

A Flutter package that enables **4-dimensional** scrolling and **zooming** of widgets within a constrained area. This package is optimized for **both touchscreen devices** (like mobile, tablets, and touch-enabled PCs) and **non-touchscreen devices** (such as traditional desktop PCs and laptops). Whether you're using touch gestures or a mouse, FreeScroll provides a smooth zooming and scrolling experience.

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

## Usage

```
FreeScroll(
  itemCount: 20,
  itemBuilder: (context, index) {
    return Container(
      width: 120,
      height: 120,
      color: Colors.teal,
      alignment: Alignment.center,
      child: Text('Item $index', style: TextStyle(color: Colors.white)),
    );
  },
)
```

## Parameters

| **Parameter**       | **Type** | **Description**                                                          |
| ------------------- | -------- | ------------------------------------------------------------------------ |
| **itemCount**       | Required | The number of items to display in the scrollable area.                   |
| **itemBuilder**     | Required | A function to build the widget for each item.                            |
| **backgroundColor** | Optional | The background color of the scrollable area (defaults to light gray).    |
| **minScale**        | Optional | The minimum scale factor for zooming (defaults to `1.0`).                |
| **maxScale**        | Optional | The maximum scale factor for zooming (defaults to `3.0`).                |
| **width**           | Optional | The width of the scrollable area (defaults to `double.infinity`).        |
| **height**          | Optional | The height of the scrollable area (defaults to `double.infinity`).       |
| **padding**         | Optional | Padding around the scrollable area (defaults to `EdgeInsets.all(20.0)`). |
| **spacing**         | Optional | Horizontal spacing between items in the grid (defaults to `15.0`).       |
| **runSpacing**      | Optional | Vertical spacing between items in the grid (defaults to `15.0`).         |



## License

- This project is licensed under the MIT License - see the LICENSE file for details.

## Contributing

- Feel free to open issues and create pull requests. All contributions are welcome!
