import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget defaultButton(
        {double width, Color background, Function function, String text}) =>
    Container(
      width: width,
      height: 45,
      decoration: BoxDecoration(
          color: background, borderRadius: BorderRadius.circular(10)),
      child: TextButton(
          onPressed: function,
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          )),
    );
Widget defaultButton1(
        {double width, Color background, Function function, String text}) =>
    Container(
      width: width,
      height: 35,
      decoration: BoxDecoration(
          color: background, borderRadius: BorderRadius.circular(10)),
      child: TextButton(
          onPressed: function,
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          )),
    );
Widget defaultTextButton({Function function, String text}) =>
    TextButton(onPressed: function, child: Text(text));

Widget defaultTextField(
    {TextEditingController controller,
    Function onsubmit,
    Function onchanege,
    Function validator,
    bool isShown,
    String label,
    String hint,
    IconData icon,
    IconData suffixicon,
    Function onsave,
    bool istrue = true,
    Function suffixPressed,
    Function ontap,
    TextInputType type,
    @required BuildContext context}) {
  return TextFormField(
    controller: controller,
    onFieldSubmitted: onsubmit,
    onChanged: onchanege,
    keyboardType: type,
    onSaved: onsave,
    onTap: ontap,
    validator: validator,
    obscureText: isShown,
    decoration: InputDecoration(
      labelText: label,
      hintText: hint,
      prefixIcon: Icon(icon),
      suffixIcon: suffixicon != null
          ? IconButton(onPressed: suffixPressed, icon: Icon(suffixicon))
          : null,
      contentPadding: EdgeInsets.all(10),
      border: OutlineInputBorder(),
    ),
  );
}

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => widget),
    (Route<dynamic> route) => false);

void showToast({@required String text, @required ToastStates states}) =>
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);

//enum
enum ToastStates { Sucess, Error, Warrning }
Color chooseToastColor(ToastStates states) {
  Color color;
  switch (states) {
    case ToastStates.Sucess:
      color = Colors.green;
      break;
    case ToastStates.Error:
      color = Colors.red;
      break;
    case ToastStates.Warrning:
      color = Colors.yellow;
      break;
  }

  return color;
}

////////// print full text ///////
void printFullText(String text) {
  final pattern = RegExp('.{1,800}'); //// 800 is the size of chunk
  pattern.allMatches(text).forEach((element) => print(element.group(0)));
}

Widget underText(context) => Padding(
      padding: const EdgeInsets.only(top: 0),
      child: Container(
        height: 1,
        width: MediaQuery.of(context).size.width - 20,
        color: Colors.grey,
      ),
    );

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  String title;
  bool search;
  CustomAppBar({
    @required this.title,
    this.search = false,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.location_on,
                color: Color(0xffFE6078),
              ),
            ),
            title: Text(
              title,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
            ),
            actions: [
              IconButton(
                icon: CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                    "https://img.freepik.com/free-photo/medium-shot-kids-having-fun-pool_23-2149046658.jpg?size=338&ext=jpg",
                  ),
                ),
                onPressed: () {},
              ),
            ],
          ),
          if (search == true)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "Search",
                      filled: true,
                      suffixIcon: Icon(Icons.search),
                      fillColor: Colors.grey.shade300,
                      hintStyle: const TextStyle(
                          color: Color(0xffC8C8C8), fontSize: 11),
                    ),
                    toolbarOptions: ToolbarOptions(),
                  )),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                      height: 50,
                      width: 50,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade300,
                          image: DecorationImage(
                              image: NetworkImage(
                            "https://image.flaticon.com/icons/png/512/3161/3161545.png",
                            scale: 15,
                          )))),
                ],
              ),
            ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(search == true ? 125 : 60);
}
