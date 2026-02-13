import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

import 'models/valentine_day.dart';

class ValentineWeekScreen extends StatefulWidget {
  const ValentineWeekScreen({super.key});

  @override
  State<ValentineWeekScreen> createState() => _ValentineWeekScreenState();
}

class _ValentineWeekScreenState extends State<ValentineWeekScreen> {
  final List<ValentineDay> valentineDays = getValentineDays();
  final List<TextEditingController> controllers = [];
  final List<ScreenshotController> screenshotControllers = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < valentineDays.length; i++) {
      controllers.add(TextEditingController());
      screenshotControllers.add(ScreenshotController());
    }
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> shareCard(int index) async {
    try {
      final image = await screenshotControllers[index].capture();
      if (image != null) {
        final directory = await getTemporaryDirectory();
        final imagePath = '${directory.path}/${valentineDays[index].name}.png';
        final imageFile = File(imagePath);
        await imageFile.writeAsBytes(image);

        await SharePlus.instance.share(
          ShareParams(
            files: [XFile(imagePath)],
            text:
                '${valentineDays[index].name} - ${valentineDays[index].userMessage.isEmpty ? valentineDays[index].defaultMessage : valentineDays[index].userMessage}',
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error sharing: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF0F5),
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.favorite_sharp,
              color: Color.fromARGB(255, 204, 0, 0), // Dark red
              size: 28,
            ),
            SizedBox(width: 8),
            Text(
              'Share your sparks',
              style: GoogleFonts.pacifico(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 255, 110, 158),
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: valentineDays.length,
        itemBuilder: (context, index) {
          return ValentineCard(
            day: valentineDays[index],
            controller: controllers[index],
            screenshotController: screenshotControllers[index],
            onShare: () => shareCard(index),
            onTextChanged: (text) {
              setState(() {
                valentineDays[index].userMessage = text;
              });
            },
          );
        },
      ),
    );
  }
}

class ValentineCard extends StatelessWidget {
  final ValentineDay day;
  final TextEditingController controller;
  final ScreenshotController screenshotController;
  final VoidCallback onShare;
  final ValueChanged<String> onTextChanged;

  const ValentineCard({
    super.key,
    required this.day,
    required this.controller,
    required this.screenshotController,
    required this.onShare,
    required this.onTextChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          // Card that will be captured for sharing
          Screenshot(
            controller: screenshotController,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [day.primaryColor, day.secondaryColor],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: day.primaryColor.withValues(alpha: 0.3),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  // Decorative hearts
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Text('💝', style: TextStyle(fontSize: 30)),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Text('💖', style: TextStyle(fontSize: 25)),
                  ),

                  // Main content
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Date badge
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.9),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            day.date,
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: day.primaryColor,
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),

                        // Day name and emoji
                        Row(
                          children: [
                            Text(
                              day.emoji,
                              style: const TextStyle(fontSize: 50),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Text(
                                day.name,
                                style: GoogleFonts.pacifico(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  shadows: [
                                    Shadow(
                                      color: Colors.black.withValues(
                                        alpha: 0.3,
                                      ),
                                      offset: const Offset(2, 2),
                                      blurRadius: 4,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),

                        // Message box
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: .95),
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: day.primaryColor.withValues(alpha: 0.3),
                              width: 2,
                            ),
                          ),
                          child: Text(
                            day.userMessage.isEmpty
                                ? day.defaultMessage
                                : day.userMessage,
                            style: GoogleFonts.dancingScript(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: day.primaryColor,
                              height: 1.4,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 12),

          // Input field and share button
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  onChanged: onTextChanged,
                  decoration: InputDecoration(
                    hintText: 'Type your message...',
                    hintStyle: GoogleFonts.poppins(color: Colors.grey[400]),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                  ),
                  style: GoogleFonts.poppins(fontSize: 14),
                ),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: onShare,
                style: ElevatedButton.styleFrom(
                  backgroundColor: day.primaryColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 5,
                ),
                child: const Icon(Icons.share, size: 24),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
