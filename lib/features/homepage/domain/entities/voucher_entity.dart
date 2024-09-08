class VoucherEntity{
  String? id;
  String? title;
  String? basePrice;
  String? afterDiscPrice;
  String? discountPercentage;
  String? imagePath;

  VoucherEntity({this.id,this.title,this.basePrice,this.afterDiscPrice,this.discountPercentage,this.imagePath});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'base_price': basePrice,
      'after_disc_price':afterDiscPrice,
      'discount_percentage':discountPercentage,
      'image_path' : imagePath,
    };
  }

  factory VoucherEntity.fromMap(Map<String, dynamic> map) {
    return VoucherEntity(
      id: map['id'],
      title: map['title'],
      basePrice: map['base_price'],
      afterDiscPrice: map['after_disc_price'],
      discountPercentage: map['discount_percentage'],
      imagePath: map ['image_path'],
    );
  }
}