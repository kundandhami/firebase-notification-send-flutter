import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:notification_practice/practice1.dart';

class PracticeScreen extends StatefulWidget {
  const PracticeScreen({Key? key}) : super(key: key);

  @override
  State<PracticeScreen> createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> animation;
  late Animation<double> animation1;
  late Animation<double> animation2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 3000))
          ..repeat(reverse: true);

    animation1 = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
    animation2 = Tween<double>(end: 1, begin: 0).animate(
        CurvedAnimation(parent: controller, curve: Curves.bounceInOut));
    animation = Tween<Offset>(begin: Offset(4, 4), end: Offset(0, 0)).animate(
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn));

    data.forEach((element) {
      indexcheck[element] = false;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void check() {
    String string = "Hello world";
    List<int> bytes = utf8.encode(string);
    print(bytes);

    String encode = base64Encode(bytes);
    print(encode);

    Uint8List decode = base64Decode(encode);
    print(decode);

    String string1 = utf8.decode(decode);

    print(string1);
  }

  bool chip = false;
  bool chip1 = true;
  String? dropselect;
  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).orientation;
    // check();
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: heySearch());
                },
                icon: Icon(Icons.search)),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Practice1(),
                      ));
                },
                icon: Icon(Icons.abc))
          ],
        ),
        body: ListView(children: [
          Container(
            height: 500,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                image: DecorationImage(
                    image: AssetImage('images/usgs-hoS3dzgpHzw-unsplash.jpg'))),
            child: Container(
              child: Wrap(
                spacing: 5,
                runSpacing: 3,
                children: [
                  FilterChip(
                    label: Text("ChipFilter"),
                    onSelected: (value) {
                      setState(() {
                        chip = !chip;
                      });
                    },
                    elevation: 5,
                    selected: chip,
                    pressElevation: 10,
                    selectedColor: Colors.purple.shade300,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  InputChip(
                    avatar: CircleAvatar(
                      backgroundColor: Colors.yellow,
                      backgroundImage:
                          AssetImage("images/usgs-hoS3dzgpHzw-unsplash.jpg"),
                    ),
                    label: Text("input Chip"),
                    onPressed: () {},
                    deleteIcon: Icon(Icons.close),
                    isEnabled: chip1,
                    onDeleted: () {
                      chip1 = !chip1;
                    },
                  ),
                  ActionChip(
                    label: Text("Action chip"),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("dialoag"),
                            actions: [Text("action Text")],
                          );
                        },
                      );
                    },
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<String>(
              borderRadius: BorderRadius.circular(20),
              underline: Container(),
              dropdownColor: Colors.orange,
              focusColor: Colors.amber,
              elevation: 20,
              alignment: Alignment.center,
              selectedItemBuilder: (context) {
                return [...data.map((e) => Text("$dropselect"))];
              },
              isExpanded: true,
              icon: Icon(Icons.keyboard_arrow_down_sharp),
              hint: Text("dropdown"),
              value: dropselect,
              items: data.map<DropdownMenuItem<String>>((e) {
                if (e == dropselect) {
                  return DropdownMenuItem<String>(
                    child: Container(
                        alignment: Alignment.centerLeft,
                        color: Colors.amber,
                        child: Text(e)),
                    value: e,
                  );
                } else {
                  return DropdownMenuItem<String>(
                    child: Text(e),
                    value: e,
                  );
                }
              }).toList(),
              onChanged: (value) {
                dropselect = value;
                setState(() {});
              },
            ),
          ),
          AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              return ImageFiltered(
                imageFilter: ImageFilter.blur(
                    sigmaX: animation.value.dx,
                    sigmaY: animation.value.dy,
                    tileMode: TileMode.decal),
                child: child,
              );
            },
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  image: DecorationImage(
                      image: AssetImage("images/usgs-hoS3dzgpHzw-unsplash.jpg"),
                      fit: BoxFit.fill)),
            ),
          ),
          FadeTransition(
            opacity: animation1,
            child: Container(
              height: 100,
              width: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage("images/usgs-hoS3dzgpHzw-unsplash.jpg"),
                  )),
            ),
          ),
          Transform.rotate(
            angle: animation2.value * 2 * 3.12,
            child: Container(
              height: 100,
              width: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage("images/usgs-hoS3dzgpHzw-unsplash.jpg"),
                  )),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Fluttertoast.showToast(
                    msg: "Hey Toast",
                    backgroundColor: Colors.amber,
                    textColor: Colors.red,
                    fontSize: 25,
                    gravity: ToastGravity.BOTTOM,
                    toastLength: Toast.LENGTH_SHORT);
              },
              child: Text("toast")),
          ElevatedButton(
              onPressed: () {
                FToast ftoast = FToast();
                ftoast.init(context);
                ftoast.showToast(
                  child: Align(
                    alignment: Alignment(0, -.8),
                    child: Container(
                      height: 50,
                      width: 200,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red,
                      ),
                      child: Text(
                        "Ftoast",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  positionedToastBuilder: (context, child) {
                    return Positioned(
                      child: child,
                      left: 16,
                      top: 100,
                    );
                  },
                );
              },
              child: Text("toast1")),
          Container(
            height: 50,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                border: Border.all(color: Colors.grey, width: 1.5)),
            child: DropdownButton<String>(
              hint: Text("Hey Dropdown"),
              underline: Container(),
              isExpanded: true,
              value: values,
              alignment: Alignment.center,
              isDense: false,
              elevation: 20,
              onTap: () {},
              iconSize: 30,
              autofocus: true,
              borderRadius: BorderRadius.circular(10),
              icon: Icon(Icons.arrow_drop_down),
              items: data
                  .map<DropdownMenuItem<String>>(
                    (e) => DropdownMenuItem<String>(
                      child: Text(e),
                      value: e,
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                values = value.toString();
                setState(() {});
              },
            ),
          ),
          GestureDetector(
            onTap: () async {
              images =
                  await ImagePicker().pickImage(source: ImageSource.gallery);
              setState(() {});
              File(images!.path).readAsBytesSync();
            },
            child: UnconstrainedBox(
              child: Container(
                height: 100,
                width: 150,
                color: Colors.orange,
                child: images != null
                    ? Image.file(
                        File(images?.path ?? ""),
                        fit: BoxFit.cover,
                      )
                    : SizedBox.shrink(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  expands = !expands;
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 1000),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      tileColor: Colors.purple,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage('images/usgs-hoS3dzgpHzw-unsplash.jpg'),
                      ),
                      trailing: Icon(Icons.keyboard_arrow_down_rounded),
                      title: Text("hey"),
                    ),
                    if (expands)
                      ...data.map((e) => Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  indexcheck[e] = !indexcheck[e];
                                  setState(() {});
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      backgroundImage: AssetImage(
                                          'images/usgs-hoS3dzgpHzw-unsplash.jpg'),
                                    ),
                                    trailing:
                                        Icon(Icons.keyboard_arrow_down_rounded),
                                    tileColor: Colors.purple,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    title: Text(e),
                                  ),
                                ),
                              ),
                              if (indexcheck[e])
                                ...data.map(
                                  (e) => GestureDetector(
                                    onTap: () {
                                      print(e);
                                    },
                                    child: Container(
                                      margin: EdgeInsets.symmetric(vertical: 5),
                                      child: ListTile(
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'images/usgs-hoS3dzgpHzw-unsplash.jpg'),
                                        ),
                                        trailing: Icon(
                                            Icons.keyboard_arrow_down_rounded),
                                        tileColor: Colors.red,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        title: Text(e),
                                      ),
                                    ),
                                  ),
                                )
                            ],
                          ))
                  ],
                ),
              ),
            ),
          ),
          TextField(
            textCapitalization: TextCapitalization.sentences,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(10)
            ],
            decoration: InputDecoration(),
          ),
          SizedBox(
            height: 30,
          ),
          ExpansionTile(
            leading: Icon(Icons.face_retouching_natural),
            title: Text("Title"),
            subtitle: Text("Sub title"),
            children: []..addAll(data.map((e) => ListTile(
                  title: Text("Hey $e"),
                ))),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: FittedBox(
              child: Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                elevation: 20,
                shadowColor: Colors.black,
                child: Row(
                  children: [
                    Container(
                      child: Text("hey material sdf\n sfeifhfuuife"),
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image(
                            fit: BoxFit.contain,
                            alignment: Alignment.topRight,
                            image: AssetImage(
                                "images/usgs-hoS3dzgpHzw-unsplash.jpg"),
                          )),
                    )
                  ],
                ),
              ),
            ),
          ),
        ]));
  }

  bool expands = false;
  int hey = -1;
  int expansion = -1;
  XFile? images;
  String? values;
  List<String> data = ["asd", "fg", "DGF", "Sdrf", "ert", "3456"];
}

class SearchIteams {
  final String id;
  final String title;
  final String subtitle;

  SearchIteams({required this.id, required this.title, required this.subtitle});
}

Map indexcheck = {};

class Iteam {
  bool expanded;
  String title;
  String body;

  Iteam({this.expanded = false, required this.title, required this.body});
}

List<Iteam> iteamss = [
  Iteam(title: "title", body: "body"),
  Iteam(title: "title1", body: "body1"),
  Iteam(title: "title2", body: "body2"),
  Iteam(title: "title3", body: "body3"),
  Iteam(title: "title4", body: "body4"),
  Iteam(title: "title5", body: "body5"),
];

class heySearch extends SearchDelegate {
  List<String> data = [
    "asd",
    "fg",
    "DGF",
    "Sdrf",
    "ert",
    "3456",
    "adf",
    "asdge"
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Container(
        height: 150,
        alignment: Alignment.center,
        child: Text(query),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestlist = query.isEmpty
        ? resent
        : data.where((element) => element.startsWith(query)).toList();
    return ListView.builder(
      itemCount: suggestlist.length,
      itemBuilder: (context, index) {
        return ListTile(
            onTap: () {
              showResults(context);
            },
            leading: CircleAvatar(
              backgroundImage:
                  AssetImage("images/usgs-hoS3dzgpHzw-unsplash.jpg"),
            ),
            title: RichText(
              text: TextSpan(
                  text: suggestlist[index].substring(0, query.length),
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: suggestlist[index].substring(query.length),
                      style: TextStyle(color: Colors.grey),
                    ),
                  ]),
            ));
      },
    );
  }

  List resent = [];
}
// cartFurniture.assignAll(cartFurniture.distinctBy((item) => item));
