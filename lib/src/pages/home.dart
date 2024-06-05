import "package:flutter/material.dart";
import "package:form_validator/form_validator.dart";
import "package:video_downloader/src/components/ui/form_fields.dart";
import "package:video_downloader/src/constants/regex.dart";
import "package:video_downloader/src/layouts/root.dart";
import "package:toastification/toastification.dart";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormState>();
  String btnLabel = "Search";
  String? url;
  String? Function(String?)? validation =
      ValidationBuilder(requiredMessage: "This field is required")
          .required()
          .url("Invalid URL")
          .build();

  @override
  Widget build(BuildContext context) {
    return RootLayout(
      child: Wrapper(
        child: Column(children: [
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              "Download Video",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.teal,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 5, right: 5),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomFormField(
                    hintText: "Paste the link here",
                    validator: validation,
                    onSaved: (value) {
                      setState(() {
                        url = value;
                      });
                    },
                    onChanged: (value) {
                      setState(() {
                        final regex = RegExp(Regex.youtube);
                        if (value != null && value.isNotEmpty) {
                          if (regex.hasMatch(value)) {
                            btnLabel = "Download from Youtube";
                            setState(() {
                              validation = null;
                            });
                            // how do i remove the invalid message from here
                          } else {
                            btnLabel = "Search";
                          }
                        }
                      });
                    },
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, left: 10, right: 10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white.withOpacity(0.1),
                        minimumSize: const Size.fromHeight(50),
                        foregroundColor: Colors.white,
                        surfaceTintColor: Colors.white,
                        shadowColor: Colors.transparent,
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                        } else {
                          toastification.show(
                            title: const Text(
                              "Invalid Url",
                              style: TextStyle(color: Colors.white),
                            ),
                            backgroundColor:
                                const Color.fromARGB(48, 194, 194, 194),
                            icon: const Icon(
                              Icons.error,
                              color: Colors.red,
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x07000000),
                                blurRadius: 16,
                                offset: Offset(0, 16),
                                spreadRadius: 0,
                              )
                            ],
                          );
                        }
                      },
                      child: Text(btnLabel),
                    ),
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
