# Free Scroll

A Flutter package that enables **4-dimensional** scrolling and **zooming** of widgets within a constrained area. This package is optimized for **both touchscreen devices** (like mobile, tablets, and touch-enabled PCs) and **non-touchscreen devices** (such as traditional desktop PCs and laptops). Whether you're using touch gestures or a mouse, Free Scroll provides a smooth zooming and scrolling experience.

## Features

- **Zooming**: Supports pinch-to-zoom gestures for touchscreen devices, allowing users to zoom in and out with customizable `minScale` and `maxScale` values.
- **Scrolling**: Freeform scrolling in any direction (horizontal and vertical) while zooming in or out.
- **Touchscreen and Non-Touchscreen Support**: Ideal for touchscreen devices (mobile, tablets, touch-enabled PCs) and non-touchscreen devices (desktop PCs). It supports pinch-to-zoom for touchscreens and mouse scroll zooming for non-touch devices.
- **Pointer Scroll Zooming**: For desktop users, zooming can be done using mouse scroll gestures.
- **Customizable Layout**: Configure padding, spacing, and constraints for width and height, making it flexible for various UI designs.
- **Responsive Layout**: Utilizes the `Wrap` widget for a flexible grid-like layout.

## Examples

![freescroll-ezgif com-optimize (1)](https://github.com/user-attachments/assets/c97462fc-c69d-438d-bc88-02a65b8dbeb2)

## Installation

Add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  free_scroll: ^latest_version
```

## Usage

```
FreeScroll(
  children: [
    for (int i = 0; i <= 100; i++)
      Container(
        width: 150,
        height: 150,
        color: Colors.blue[100 * ((i % 9) + 1)],
        alignment: Alignment.center,
        child: Text('Item $i', style: const TextStyle(fontSize: 16)),
      ),
  ],
)
```

## Parameters

| **Parameter**       | **Type** | **Description**                                                          |
| ------------------- | -------- | ------------------------------------------------------------------------ |
| **children**        | Required | Widgets to display in the scrollable area.                               |
| **backgroundColor** | Optional | The background color of the scrollable area (defaults to white).         |
| **minScale**        | Optional | The minimum scale factor for zooming (defaults to `1.0`).                |
| **maxScale**        | Optional | The maximum scale factor for zooming (defaults to `3.0`).                |
| **width**           | Optional | The width of the scrollable area (defaults to `double.infinity`).        |
| **height**          | Optional | The height of the scrollable area (defaults to `double.infinity`).       |
| **padding**         | Optional | Padding around the scrollable area (defaults to `EdgeInsets.all(20.0)`). |
| **spacing**         | Optional | Horizontal spacing between items in the grid (defaults to `15.0`).       |
| **runSpacing**      | Optional | Vertical spacing between items in the grid (defaults to `15.0`).         |

## License

- This project is licensed under the MIT License - see the [LICENSE](https://github.com/fazil-kp/free_scroll/blob/main/LICENSE) file for details.

## Contributing

We welcome your contributions! Here's how you can help:

1. **Fork the Repository**: Fork the repository to your own GitHub account.
2. **Create a New Branch**: Create a new branch for your feature or bug fix.
3. **Make Changes**: Implement your changes and make sure to include relevant tests and documentation.
4. **Submit a Pull Request**: Push your changes and submit a pull request for review.

Please ensure your code follows the project's style and is well-tested. We appreciate all contributions!

## Acknowledgments

This package is a unique creation. It is designed to provide a smooth and customizable zooming and scrolling experience for your software, tailored to both touchscreen and non-touchscreen devices. The idea and implementation are entirely original, aiming to fill a gap in the Flutter ecosystem for 4-dimensional scrolling and zooming functionality.

## Copyright

Copyright © 2024 Mohammed Fazil KP. All rights reserved.
