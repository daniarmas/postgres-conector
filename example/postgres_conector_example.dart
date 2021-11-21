import 'package:postgres_conector/postgres_conector.dart';

void main() async {
  final _connection = PostgresqlDao(
    masterHost: '127.0.0.1',
    port: 5432,
    database: 'postgres',
    username: 'postgres',
    password: 'postgres',
  );
  await _connection.connect();
}
