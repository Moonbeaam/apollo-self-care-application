class Notes {
  final int id;
  final String title;
  final String desc;

  Notes({this.id, this.title, this.desc});

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'title': this.title,
      'desc': this.desc,
    };
  }
}
