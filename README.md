# Valentine's Week 💝

A beautiful Flutter application for celebrating Valentine's Week! Share your feelings with custom messages and stunning cards for each day of the week.

## About

Valentine's Week is an interactive Flutter app that allows you to create and share beautiful Valentine's Day cards for all seven days of the Valentine's Week (Feb 7-14). Each day has a unique theme, color scheme, emoji, and pre-written message that you can customize.

## Features

✨ **8 Valentine Days** with unique themes:
- 🌹 Rose Day (Feb 7)
- 💍 Propose Day (Feb 8)
- 🍫 Chocolate Day (Feb 9)
- 🧸 Teddy Day (Feb 10)
- 🤝 Promise Day (Feb 11)
- 🤗 Hug Day (Feb 12)
- 💋 Kiss Day (Feb 13)
- ❤️ Valentine's Day (Feb 14)

🎨 **Beautiful UI**:
- Gradient backgrounds with personalized color schemes for each day
- Smooth animations and shadows
- Custom fonts using Google Fonts (Pacifico & Dancing Script)
- Decorative emojis and hearts

📝 **Customization**:
- Default messages for each Valentine day
- Add custom messages to personalize your cards
- Real-time preview of your message

📸 **Share Functionality**:
- Capture card as an image using screenshot
- Share cards with friends and family using native share dialog
- Automatic file management with temporary storage

## Tech Stack

- **Flutter** - Cross-platform mobile framework
- **Dart** - Programming language
- **Packages Used**:
  - `google_fonts` - Beautiful typography
  - `screenshot` - Capture cards as images
  - `share_plus` - Share cards with others
  - `path_provider` - Access device's file system

## Getting Started

### Prerequisites
- Flutter SDK (>=3.0.0)
- Dart SDK
- Android Studio or Xcode for mobile development

### Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd valentine_week
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## Project Structure

```
lib/
├── main.dart                    # App entry point
├── valentine_week_screen.dart   # Main screen with card list
└── models/
    └── valentine_day.dart       # ValentineDay model with all days data
```

## How to Use

1. **View Cards**: Scroll through all 8 Valentine days with their unique cards
2. **Customize Message**: Type your custom message in the text field below each card
3. **Share**: Click the share button (share icon) to capture and share the card
4. **Default Messages**: If you don't enter a custom message, the default message for that day will be used

## Code Highlights

### ValentineDay Model
Each day is represented as a `ValentineDay` object with:
- Name, date, and emoji
- Primary and secondary colors for the gradient
- Default and custom user messages

### Card UI
Beautiful gradient cards with:
- Decorative hearts and emojis
- Date badges
- Message display box
- Custom text input field
- Share button

### Sharing
Cards can be captured and shared as images with a combined message and image file.

## Future Enhancements

- 📱 Add more platforms (Web, Desktop)
- 🎵 Background music/sound effects
- 🎨 Color customization options
- 💾 Save favorite messages
- 🌐 Multi-language support

## License

This project is open source and available under the MIT License.

## Contributing

Feel free to fork this repository and submit pull requests for any improvements!

---

Made with ❤️ for all lovers of Valentine's Day.
