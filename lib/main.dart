import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:http/http.dart' as http;
import 'country.graphql.dart';

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
  if (result.hasException) {
    print('GraphQL Error: ${result.exception.toString()}');
    return [];
  } else {
    return List<Map<String, dynamic>>.from(result.data?['countries'] ?? []);
  }
}

Future<String> getCountryNameByCode(String countryCode) async {
  final GraphQLClient client = GraphQLClient(
    link: HttpLink('https://countries.trevorblades.com/'),
    cache: GraphQLCache(),
  );

  final QueryOptions options = QueryOptions(
    document: gql('''
      query getCountryName(\$code: ID!) {
        country(code: \$code) {
          name
        }
      }
    '''),
    variables: {'code': countryCode},
  );

  final QueryResult result = await client.query(options);
  if (result.hasException) {
    print('GraphQL Error: ${result.exception.toString()}');
    return 'Error';
  } else {
    return result.data?['country']['name'] ?? 'Country Not Found';
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
  late String _countryName;

  @override
  void initState() {
    super.initState();
    _countriesFuture = fetchCountries();
    _countryName = '';
  }

  Future<void> _getPSCountryName() async {
    final String countryName = await getCountryNameByCode('PS');
    setState(() {
      _countryName = countryName;
    });
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Country Name'),
        content: Text('Country Name: $_countryName'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  Future<void> _getTNCountryName() async {
    final String countryName = await getCountryNameByCode('TN');
    setState(() {
      _countryName = countryName;
    });
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Country Name'),
        content: Text('Country Name: $_countryName'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: _getPSCountryName,
            child: Text('Get Country Name via Country Code: "PS"'),
          ),
          ElevatedButton(
            onPressed: _getTNCountryName,
            child: Text('Get Country Name via Country Code: "TN"'),
          ),
          Expanded(
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: _countriesFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
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
        ],
      ),
    );
  }
}
