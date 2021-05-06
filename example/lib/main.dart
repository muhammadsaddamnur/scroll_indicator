import 'package:flutter/material.dart';
import 'package:scroll_indicator/scroll_indicator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController scrollController = ScrollController();
  ScrollController scrollController2 = ScrollController();
  ScrollController scrollController3 = ScrollController();

  double pixels = 0.0;

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController2 = ScrollController();
    scrollController3 = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    scrollController2.dispose();
    scrollController3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 120,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    controller: scrollController,
                    scrollDirection: Axis.horizontal,
                    itemCount: 123,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 100,
                          height: 100,
                          color: Colors.blue,
                          child: Text(index.toString()),
                        ),
                      );
                    }),
              ),
              ScrollIndicator(
                scrollController: scrollController,
                width: 50,
                height: 5,
                indicatorWidth: 20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300]),
                indicatorDecoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(10)),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                height: 120,
                child: GridView.count(
                  crossAxisCount: 2,
                  controller: scrollController2,
                  scrollDirection: Axis.horizontal,
                  children: List.generate(100, (index) {
                    return Center(
                      child: Text(
                        'Item $index',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ScrollIndicator(
                scrollController: scrollController2,
                width: 50,
                height: 10,
                indicatorWidth: 20,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(color: Colors.grey[300]),
                indicatorDecoration: BoxDecoration(
                  color: Colors.green,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                height: 120,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    controller: scrollController3,
                    scrollDirection: Axis.horizontal,
                    itemCount: 123,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 100,
                          height: 100,
                          color: Colors.blue,
                          child: Text(index.toString()),
                        ),
                      );
                    }),
              ),
              ScrollIndicator(
                scrollController: scrollController3,
                width: 10,
                height: 5,
                indicatorWidth: 20,
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue),
                indicatorDecoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(10)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
