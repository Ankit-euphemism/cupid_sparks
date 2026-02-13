import 'package:flutter/material.dart';

class ValentineDay {
  final String name;
  final String date;
  final String emoji;
  final Color primaryColor;
  final Color secondaryColor;
  final String defaultMessage;
  String userMessage;

  ValentineDay({
    required this.name,
    required this.date,
    required this.emoji,
    required this.primaryColor,
    required this.secondaryColor,
    required this.defaultMessage,
    this.userMessage = '',
  });
}

List<ValentineDay> getValentineDays() {
  return [
    ValentineDay(
      name: 'Rose Day',
      date: 'Feb 7',
      emoji: '🌹',
      primaryColor: const Color(0xFFE91E63),
      secondaryColor: const Color(0xFFFCE4EC),
      defaultMessage: 'A rose for you...',
    ),
    ValentineDay(
      name: 'Propose Day',
      date: 'Feb 8',
      emoji: '💍',
      primaryColor: const Color(0xFF9C27B0),
      secondaryColor: const Color(0xFFF3E5F5),
      defaultMessage: 'Will you be mine?',
    ),
    ValentineDay(
      name: 'Chocolate Day',
      date: 'Feb 9',
      emoji: '🍫',
      primaryColor: const Color(0xFF795548),
      secondaryColor: const Color(0xFFEFEBE9),
      defaultMessage: 'Sweet as chocolate...',
    ),
    ValentineDay(
      name: 'Teddy Day',
      date: 'Feb 10',
      emoji: '🧸',
      primaryColor: const Color(0xFFFF9800),
      secondaryColor: const Color(0xFFFFF3E0),
      defaultMessage: 'Hugs & cuddles...',
    ),
    ValentineDay(
      name: 'Promise Day',
      date: 'Feb 11',
      emoji: '🤝',
      primaryColor: const Color(0xFF2196F3),
      secondaryColor: const Color(0xFFE3F2FD),
      defaultMessage: 'I promise to...',
    ),
    ValentineDay(
      name: 'Hug Day',
      date: 'Feb 12',
      emoji: '🤗',
      primaryColor: const Color(0xFFFF9800),
      secondaryColor: const Color(0xFFFFF8E1),
      defaultMessage: 'Sending warm hugs...',
    ),
    ValentineDay(
      name: 'Kiss Day',
      date: 'Feb 13',
      emoji: '💋',
      primaryColor: const Color.fromARGB(255, 228, 120, 156),
      secondaryColor: const Color(0xFFFCE4EC),
      defaultMessage: 'XOXO...',
    ),
    ValentineDay(
      name: 'Valentine\'s Day',
      date: 'Feb 14',
      emoji: '❤️',
      primaryColor: const Color(0xFFF44336),
      secondaryColor: const Color(0xFFFFEBEE),
      defaultMessage: 'I love you...',
    ),
  ];
}