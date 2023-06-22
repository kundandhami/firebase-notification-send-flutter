class User {
  final String id;
  final String username;
  final String imagepath;
  final int? follower;

  User(
      {required this.id,
      required this.username,
      required this.imagepath,
      this.follower,
      this.followings,
      this.likes});

  final int? followings;
  final int? likes;

  static List<User> users = [
    User(
        id: "1",
        username: "kundan",
        imagepath: "images/usgs-hoS3dzgpHzw-unsplash.jpg",
        follower: 100,
        followings: 15,
        likes: 30),
    User(
        id: "2",
        username: "tea",
        imagepath: "images/usgs-hoS3dzgpHzw-unsplash.jpg",
        follower: 23,
        followings: 34,
        likes: 457),
    User(
        id: "3",
        username: "cfg",
        imagepath: "images/usgs-hoS3dzgpHzw-unsplash.jpg",
        follower: 10,
        followings: 56,
        likes: 306),
    User(
        id: "4",
        username: "sdf",
        imagepath: "images/usgs-hoS3dzgpHzw-unsplash.jpg",
        follower: 90,
        followings: 65,
        likes: 30),
    User(
        id: "5",
        username: "gfjy",
        imagepath: "images/usgs-hoS3dzgpHzw-unsplash.jpg",
        follower: 56,
        followings: 15,
        likes: 30),
    User(
        id: "6",
        username: "dfhdre",
        imagepath: "images/usgs-hoS3dzgpHzw-unsplash.jpg",
        follower: 564,
        followings: 987,
        likes: 370),
  ];
}
