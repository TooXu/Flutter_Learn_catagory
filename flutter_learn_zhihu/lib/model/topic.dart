
class Topic {
  String imageUrl;
  String title;
  String content;

  Topic.fromJson(Map data) {
    imageUrl = data['imageurl'];
    title = data['title'];
    content = data['content'];
  }
}