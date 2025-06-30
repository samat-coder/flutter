
import 'package:flutter/material.dart';
import 'package:sqflitedemo/exam/e_db_helper.dart';

class myaddscreen1 extends StatefulWidget {
  const myaddscreen1({super.key});

  @override
  State<myaddscreen1> createState() => _myaddscreen1State();
}

class _myaddscreen1State extends State<myaddscreen1> {
  Dbhelper1 dbref = Dbhelper1.getinstance;
  TextEditingController _title = TextEditingController();
  TextEditingController _desc = TextEditingController();
  List<Map<String, dynamic>> notes = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getnotes();
  }

  void getnotes() async {
    var notedata = await dbref.getallnotes();
    setState(() {
      notes = notedata;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: notes.isNotEmpty
          ? ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                var note = notes[index];
                var sid = notes[index]["sno"];
                return Container(
                  margin: EdgeInsets.all(10.0),
                  child: ListTile(
                    tileColor: Colors.blueAccent,
                    title: Text(note["title"]),
                    subtitle: Text(note["description"]),
                    contentPadding: EdgeInsets.all(5.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    ),
                    trailing: SizedBox(
                      width: 60,
                      child: Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                _title.text = note["title"];
                                _desc.text = note["description"];
                                showModalBottomSheet(
                                  isDismissible: true,
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                      padding: EdgeInsets.all(10.0),
                                      width: double.infinity,
                                      child: Column(
                                        children: [
                                          Text(
                                            "update data",
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          TextField(
                                            controller: _title,
                                            decoration: InputDecoration(
                                              hintText: "enter the title",
                                              label: Text("title"),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0)),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          TextField(
                                            controller: _desc,
                                            maxLines: 4,
                                            decoration: InputDecoration(
                                              hintText: "enter the description",
                                              label: Text("description"),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0)),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                  child: OutlinedButton(
                                                      onPressed: () async {
                                                        var titlem = _title.text;
                                                        var descm = _desc.text;
                  
                                                        if (titlem.isNotEmpty &&
                                                            descm.isNotEmpty) {
                                                          bool check = await dbref
                                                              .updatedata(
                                                                  mtitle: titlem,
                                                                  mdesc: descm,
                                                                  sid: sid);
                                                          if (check) {
                                                            getnotes();
                                                            Navigator.pop(
                                                                context);
                                                            ScaffoldMessenger.of(
                                                                    context)
                                                                .showSnackBar(SnackBar(
                                                                    content: Text(
                                                                        "updated successfully")));
                                                            _title.clear();
                                                            _desc.clear();
                                                          } else {
                                                            ScaffoldMessenger.of(
                                                                    context)
                                                                .showSnackBar(SnackBar(
                                                                    content: Text(
                                                                        "error")));
                                                          }
                                                        }
                                                      },
                                                      child: Text("update"))),
                                                      SizedBox(width: 3,),
                                              Expanded(
                                                  child: OutlinedButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text("cancel")))
                                            ],
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Icon(Icons.edit)),
                              SizedBox(width: 10,),
                          GestureDetector(
                              onTap: () async {
                                await dbref.deletedata(sid);
                                getnotes();
                              },
                              child: Icon(Icons.delete,color: Colors.red,))
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
          : Center(
              child: Text("no data"),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return Container(
                padding: EdgeInsets.all(10.0),
                width: double.infinity,
                child: Column(
                  children: [
                    Text(
                      "add data",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: _title,
                      decoration: InputDecoration(
                        hintText: "enter the title",
                        label: Text("title"),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: _desc,
                      maxLines: 4,
                      decoration: InputDecoration(
                        hintText: "enter the description",
                        label: Text("description"),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: OutlinedButton(
                                onPressed: () async {
                                  var titlem = _title.text;
                                  var descm = _desc.text;

                                  if (titlem.isNotEmpty && descm.isNotEmpty) {
                                    bool check = await dbref.adddata(
                                        mtitle: titlem, mdesc: descm);
                                    if (check) {
                                      getnotes();
                                      Navigator.pop(context);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content:
                                                  Text("added successfully")));
                                      _title.clear();
                                      _desc.clear();
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                              SnackBar(content: Text("error")));
                                    }
                                  }
                                },
                                child: Text("add"))),
                                SizedBox(width: 5,),
                        Expanded(
                            child: OutlinedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("cancel")))
                      ],
                    )
                  ],
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
