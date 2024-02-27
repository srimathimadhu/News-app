import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:news_admin/admin/IT/it_post.dart';

class IT_edit extends StatefulWidget {
  DocumentSnapshot docid;
  IT_edit({required this.docid});

  @override
  State<IT_edit> createState() => _IT_editState();
}

class _IT_editState extends State<IT_edit> {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  @override
  void initState() {
    title = TextEditingController(text: widget.docid.get("title"));

    description = TextEditingController(text: widget.docid.get("description"));
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IT Edit"),
        actions: [
          IconButton(
              onPressed: () {
                widget.docid.reference.delete().whenComplete(() =>
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (_) => IT_post())));
              },
              icon: Icon(Icons.delete))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              //    mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: MediaQuery.of(context).size.width * 0.5,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 234, 246, 255),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.white,
                              child: Icon(Icons.upload_file)),
                          SizedBox(height: 10),
                          Text(
                            "Click to select from files ",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Title",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: title,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                ),
                SizedBox(height: 20),
                Text(
                  "Description",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: description,
                  maxLines: 6,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.2,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      color: Colors.blue,
                      onPressed: () {
                        widget.docid.reference.update({
                          "title": title.text,
                          "description": description.text,
                        }).whenComplete(() => Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_) => IT_post())));
                      },
                      child: Text(
                        "Update",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
