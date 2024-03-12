import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:http/http.dart' as http;

Future<List<Map<String, dynamic>>> fetchCountries() async {
  final GraphQLClient client = GraphQLClient(
    link: HttpLink('https://countries.trevorblades.com/'),
    cache: GraphQLCache(),
  );

  final QueryOptions options = QueryOptions(
    document: gql('''
      query getAllCountries {
        countries {
          name
          capital
        }
      }
    '''),
  );

  final QueryResult result = await client.query(options);
  print('this is first');
  if (result.hasException) {
    print('GraphQL Error: ${result.exception.toString()}');
    return [];
  } else {
    print('this is true');
    print(result.data);
    return List<Map<String, dynamic>>.from(result.data?['countries']);
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<Map<String, dynamic>>> _countriesFuture;
  @override
  void initState() {
    super.initState();
    print('this is first');
    _countriesFuture = fetchCountries();
    print(_countriesFuture);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder<List<Map<String, dynamic>>>(
          future: _countriesFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final List<Map<String, dynamic>> countries = snapshot.data!;
              return ListView.builder(
                itemCount: countries.length,
                itemBuilder: (context, index) {
                  final country = countries[index];
                  return ListTile(
                    title: Text(country['name'] ?? ''),
                    subtitle: Text(country['capital'] ?? ''),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
