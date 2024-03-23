import 'package:flutter/material.dart';
class CustomSliverPage extends StatelessWidget {
  const CustomSliverPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: const Text("SliverAppBar Example",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  )),
              background: Image.network(
                "https://images.unsplash.com/photo-1622838320000-4b3b3b3b3b3b",
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SliverFillRemaining(
            child: Center(child: Text('Scroll to see the SliverAppBar in action')),
          ),
        ],
      ),
    );
  }
}
