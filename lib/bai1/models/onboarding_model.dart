import 'package:flutter/material.dart';

class OnboardingModel {
  final String title;
  final String description;
  final IconData placeholderIcon;

  OnboardingModel({
    required this.title,
    required this.description,
    required this.placeholderIcon,
  });
}

final List<OnboardingModel> onboardingData = [
  OnboardingModel(
    title: 'Mọi việc, gọn trong một chỗ',
    description: 'Ghi lại bài tập, việc nhà, lịch hẹn. Không còn quên việc nào.',
    placeholderIcon: Icons.checklist_rtl,
  ),
  OnboardingModel(
    title: 'Chia theo Học tập và Cuộc sống',
    description: 'Mỗi việc có nhóm riêng, nhìn là biết hôm nay cần lo gì.',
    placeholderIcon: Icons.folder_special,
  ),
  OnboardingModel(
    title: 'Nhắc đúng lúc',
    description: 'Bật thông báo để UTH Todo nhắc bạn trước hạn chót.',
    placeholderIcon: Icons.notifications_active,
  ),
];