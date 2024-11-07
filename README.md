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

- This project is licensed under the [MIT License](https://github.com/fazil-kp/free_scroll/blob/main/LICENSE) - see the LICENSE file for details.


## Contributing

We welcome contributions to the **Free Scroll** package! If you'd like to help improve this project, please follow these steps:

### How to Contribute

1. **Fork the Repository**
   - Start by forking the repository. Click the "Fork" button at the top right of this page to create a copy of the repository under your GitHub account.

2. **Clone Your Fork**
   - Clone the forked repository to your local machine using the following command:
     ```bash
     git clone https://github.com/your-username/free_scroll.git
     ```

3. **Create a New Branch**
   - Before making changes, create a new branch for your work:
     ```bash
     git checkout -b feature/your-feature-name
     ```

4. **Make Changes**
   - Make the necessary changes or improvements. You can add new features, fix bugs, improve documentation, or write tests.

5. **Test Your Changes**
   - If applicable, test your changes locally. Ensure that everything works as expected.

6. **Commit Your Changes**
   - Commit your changes with a descriptive commit message:
     ```bash
     git commit -m "Add new feature or fix [description]"
     ```

7. **Push Your Changes**
   - Push your changes to your forked repository:
     ```bash
     git push origin feature/your-feature-name
     ```

8. **Create a Pull Request**
   - Go to the original repository and create a pull request (PR). You can do this by clicking the "New Pull Request" button on GitHub.
   - Describe the changes you made in the PR. Be clear about the issue you’re solving or the feature you’re adding.

### Pull Request Guidelines

- **Code Style**: Please ensure your code adheres to the existing code style of the project.
- **Tests**: If you are adding new features, make sure to include tests to verify your changes.
- **Documentation**: Update the `README.md` or other documentation if you add or modify features.
- **Commit Messages**: Use clear, concise commit messages. Follow the convention of "Add [feature]" or "Fix [bug]" for easier tracking.

### Reporting Issues

- If you encounter a bug or have an idea for an enhancement, please open an issue. Provide as much detail as possible, including steps to reproduce and any error messages.

---

