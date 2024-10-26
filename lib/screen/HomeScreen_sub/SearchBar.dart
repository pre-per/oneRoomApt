import 'package:flutter/material.dart';
import 'package:one_room_apt/screen/HomeScreen_sub/SearchScreen.dart';

class SearchAppBar extends StatefulWidget {
  const SearchAppBar({Key? key}) : super(key: key);

  @override
  State<SearchAppBar> createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  String enteredText = '';

  void _navigateAndReceiveInput(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SearchScreen()),
    );

    if (result != null) {
      setState(() {
        enteredText = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              _navigateAndReceiveInput(context);
            },
            child: Card(
              elevation: 3.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ' Search...',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 2.0),
                    SizedBox(
                      height: 1.0,
                      width: 300.0,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10.0),
        GestureDetector(
          onTap: () {},
          child: Card(
            elevation: 3.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
            color: Colors.white,
            child: const Padding(
              padding: EdgeInsets.all(12.0),
              child: Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
