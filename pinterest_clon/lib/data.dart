// data.dart

class UpdateSection {
  final String title;
  final String time;
  final List<String> images;

  UpdateSection({
    required this.title,
    required this.time,
    required this.images,
  });
}

final List<UpdateSection> updatesData = [
  UpdateSection(
    title: "Pines inspirados en ti",
    time: "7 h",
    images: [
      "https://picsum.photos/103",
      "https://picsum.photos/101",
      "https://picsum.photos/102",
    ],
  ),
  UpdateSection(
    title: "Símbolos egipcios y más",
    time: "11 h",
    images: [
      "https://picsum.photos/104",
      "https://picsum.photos/105",
      "https://picsum.photos/106",
    ],
  ),
  UpdateSection(
    title: "Tatuajes para ti",
    time: "1 día",
    images: [
      "https://picsum.photos/107",
      "https://picsum.photos/108",
      "https://picsum.photos/109",
    ],
  ),
  UpdateSection(
    title: "Más...",
    time: "2 días",
    images: [
      "https://picsum.photos/110",
      "https://picsum.photos/111",
      "https://picsum.photos/112",
    ],
  ),
];
