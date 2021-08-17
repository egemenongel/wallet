import 'package:cookbook_examples/HomePage/home_page.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class CustomDropdownField extends StatefulWidget {
  String variableName = "";

  CustomDropdownField({Key? key, @required this.variableName = ""})
      : super(key: key);

  @override
  _CustomDropdownFieldState createState() => _CustomDropdownFieldState();
}

class _CustomDropdownFieldState extends State<CustomDropdownField> {
  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
      showClearButton: true,
      mode: Mode.BOTTOM_SHEET,
      label: "Account type",
      maxHeight: 300,
      items: ["Crypto", "Bank", "Cash", "Check"],
      selectedItem: null,
      showSearchBox: true,
      searchBoxDecoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
          labelText: "Account name"),
      popupTitle: Container(
        child: Center(
          child: Text(
            "",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      popupShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(),
      ),
    );
  }
}

class AddAccountPage extends StatefulWidget {
  const AddAccountPage({Key? key}) : super(key: key);

  @override
  AddAccountPageState createState() => AddAccountPageState();
}

class AddAccountPageState extends State<AddAccountPage> {
  static var accountInfo = {
    "accountName": "",
    "accountType": "",
    "quantity": "",
    "currency": "",
  };

  final newAccount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Account"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                  controller: newAccount,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(labelText: "Account name"),
                  onChanged: (value) {
                    setState(() {
                      accountInfo["accountName"] = value;
                    });
                  }),
              DropdownSearch<String>(
                items: ["Crypto", "Bank", "Cash", "Check"],
                showClearButton: true,
                mode: Mode.BOTTOM_SHEET,
                label: "Account type",
                onChanged: (value) {
                  setState(() {
                    accountInfo["accountType"] = value!;
                    print(value);
                  });
                },
                maxHeight: 300,
                selectedItem: null,
                showSearchBox: true,
                dropdownSearchDecoration: InputDecoration(),
                searchBoxDecoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
                    labelText: "Account name"),
                popupTitle: Container(
                  child: Center(
                    child: Text(
                      "",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                popupShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(),
                ),
              ),
              Row(
                children: [
                  Container(
                    height: 75,
                    alignment: Alignment.bottomCenter,
                    width: 200,
                    child: TextField(
                      style: TextStyle(),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: "Quantity"),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                    height: 75,
                    width: 100,
                    child: DropdownSearch(
                      showClearButton: false,
                      dropDownButton: DropdownButton(
                        iconSize: 0,
                        items: [],
                      ),
                      mode: Mode.BOTTOM_SHEET,
                      label: "Currency",
                      maxHeight: 290,
                      items: ["USD", "TRY", "EUR", "YEN"],
                      dropdownSearchDecoration: InputDecoration(
                          contentPadding: EdgeInsets.only(top: 25)),
                      selectedItem: null,
                      showSearchBox: true,
                      searchBoxDecoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
                        labelText: "Currency",
                        labelStyle: TextStyle(),
                      ),
                      popupShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 200,
              ),
              Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context, newAccount.text);
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) => HomePage(
                            //           value: newAccount.text,
                            //         )));
                          },
                          child: Text("ADD"))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
