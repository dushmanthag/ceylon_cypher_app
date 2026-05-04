class LyricLine {
  final String text;
  final bool hasInsight;
  final String? insightId; // To fetch specific insights from your DB

  LyricLine({required this.text, this.hasInsight = false, this.insightId});
}
