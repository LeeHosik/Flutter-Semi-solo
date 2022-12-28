// Model Dart
class SupportCard {
  final int? sup_seq; // AI
  final String sup_name;
  final String sup_category;
  final String sup_grade;
  final String sup_card_img;

  // Constructor
  SupportCard(
      {this.sup_seq,
      required this.sup_name,
      required this.sup_category,
      required this.sup_grade,
      required this.sup_card_img});

  SupportCard.formMap(Map<String, dynamic> res)
      : sup_seq = res['sup_seq'],
        sup_name = res['sup_name'],
        sup_category = res['sup_category'],
        sup_grade = res['sup_grade'],
        sup_card_img = res['sup_card_img'];

  Map<String, Object?> toMap() {
    return {
      'sup_seq': sup_seq,
      'sup_name': sup_name,
      'sup_category': sup_category,
      'sup_grade': sup_grade,
      'sup_card_img': sup_card_img,
    };
  }
}
