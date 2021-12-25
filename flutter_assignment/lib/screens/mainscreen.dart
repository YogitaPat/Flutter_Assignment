import 'package:flutter/material.dart';
import 'package:flutter_assignment/DataSource/datasource.dart';
import 'package:flutter_assignment/db/DatabaseHandler.dart';
import 'package:flutter_assignment/models/data.dart';
import 'package:flutter_assignment/screens/loginscreen.dart';
import 'package:form_field_validator/form_field_validator.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  DatabaseHandler handler = DatabaseHandler();

  final name = TextEditingController();
  final mobile_no = TextEditingController();

  final columns = ['Name', 'Mobile No'];

  List<data> data1 = [];

  @override
  Widget build(BuildContext context) {
    DataTableSource _data = MyData(data1, handler);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Main Screen"),
      ),
      body: SingleChildScrollView(
        child: Form(
          autovalidate: true, //check for validation while typing
          key: formkey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Center(
                  child: Container(
                    width: 200,
                    height: 150,
                    child: Image.asset(
                      "assets/images/companyLogo.png",
                      height: 50,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                    controller: name,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Name',
                        hintText: 'Enter Your Name'),
                    validator: MultiValidator([
                      RequiredValidator(errorText: "* Required"),
                    ])),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                child: TextFormField(
                    controller: mobile_no,
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Mobile Number',
                        hintText: 'Enter Your Number'),
                    validator: MultiValidator([
                      RequiredValidator(errorText: "* Required"),
                      MinLengthValidator(10,
                          errorText: "Mobile No. should be 10 Digits"),
                    ])
                    //Function to check validation
                    ),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    height: 35,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    child: FlatButton(
                      onPressed: () async {
                        String response = '';

                        int res = await addData(
                          name.text.toString(),
                          mobile_no.text.toString(),
                        );

                        setState(() {});

                        if (res > 0) {
                          data1 = await this.handler.retrieveData();
                          response = "Succesfully Inserted!";
                          name.text = '';
                          mobile_no.text = '';
                        } else {
                          response =
                              "oooopps! Something went wrong! Response Code:" +
                                  res.toString();
                        }
                      },
                      child: Text(
                        'Add Data',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    height: 35,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    child: FlatButton(
                      onPressed: () {},
                      child: Text(
                        'Display Data',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          margin: EdgeInsets.all(50),
                        child: (_data != null)
                            ? PaginatedDataTable(
                          columns: getColumns(columns),
                          source: _data,
                          columnSpacing: 60,
                          horizontalMargin: 5,
                          rowsPerPage: 5,
                          showCheckboxColumn: false,
                        )
                            : Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 8,
                            ),
                       ))
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(
            label: Text(column),
          ))
      .toList();

  Future<int> addData(String name, String mobile_no) async {
    data _data = data(
      name: name,
      mobile_no: mobile_no,
    );
    return await this.handler.insertData(_data);
  }
}
