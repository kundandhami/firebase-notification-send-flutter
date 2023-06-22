import 'package:notification_practice/view/social_app/model/user_model.dart';

enum Posttype { images, video, audio }

class Post {
  final String id;
  final User user;
  final Posttype type;
  final String assetPath;
  final String caption;

  Post(
      {required this.id,
      required this.user,
      required this.type,
      required this.caption,
      required this.assetPath});

  static List<Post> posts = [
    Post(
        id: "1",
        user: User.users[0],
        type: Posttype.images,
        assetPath: "images/usgs-hoS3dzgpHzw-unsplash.jpg",
        caption: "hey , welcome ui.."),
    Post(
        id: "1",
        user: User.users[1],
        type: Posttype.images,
        assetPath: "images/usgs-hoS3dzgpHzw-unsplash.jpg",
        caption: "dsfdf come ui.."),
    Post(
        id: "2",
        user: User.users[2],
        type: Posttype.images,
        assetPath: "images/usgs-hoS3dzgpHzw-unsplash.jpg",
        caption: "hey , dfasd.."),
    Post(
        id: "3",
        user: User.users[0],
        type: Posttype.images,
        assetPath: "images/usgs-hoS3dzgpHzw-unsplash.jpg",
        caption: "hey , welcome ui.."),
  ];
}
