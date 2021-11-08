import 'package:postgres/postgres.dart';
import 'package:postgres_conector/src/construct_sql_query_delete.dart';
import 'package:postgres_conector/src/construct_sql_query_insert.dart';
import 'package:postgres_conector/src/construct_sql_query_search.dart';
import 'package:postgres_conector/src/construct_sql_query_select.dart';
import 'package:postgres_conector/src/construct_sql_query_update.dart';
import 'package:postgres_conector/postgres_conector.dart';

class PostgresqlDao {
  final String host;
  final int port;
  final String database;
  final String username;
  final String password;
  late PostgreSQLConnection _connection;

  PostgresqlDao({
    required this.host,
    required this.port,
    required this.database,
    required this.username,
    required this.password,
  });

  Future<bool> connect() async {
    try {
      _connection = PostgreSQLConnection(host, port, database,
          username: username, password: password);
      await _connection.open().then((value) async {
        print('🚀 Database Server is on...');
      });
      return Future.value(true);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<PostgreSQLConnection> getConnection() async {
    try {
      return _connection;
    } catch (error) {
      throw Exception(error);
    }
  }

  void close() async {
    try {
      _connection = PostgreSQLConnection(host, port, database,
          username: username, password: password);
      await _connection.close();
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<Map<String, dynamic>> create(
      {required PostgreSQLExecutionContext context,
      required String table,
      required Map<String, dynamic> data,
      List<Attribute>? attributes}) async {
    try {
      String query = constructSqlQueryInsert(
          table: table, data: data, attributes: attributes);
      print(query);
      final response = await context.mappedResultsQuery(query);
      return Future.value(response[0][table]);
    } catch (error) {
      rethrow;
    }
  }

  Future<void> delete(
      {required PostgreSQLExecutionContext context,
      required String table,
      List<Where>? where}) async {
    try {
      String query = constructSqlQueryDelete(where: where, table: table);
      print(query);
      final result = await context.mappedResultsQuery(query);
      if (result.isEmpty) {
        throw Exception('NOT_FOUND');
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>?> get(
      {required PostgreSQLExecutionContext context,
      required String table,
      List<Attribute>? attributes,
      List<String>? agregationMethods,
      InnerJoin? innerJoin,
      List<Where>? where}) async {
    try {
      String? query = constructSqlQuerySelect(
        limit: 1,
        where: where,
        table: table,
        attributes: attributes,
        innerJoin: innerJoin,
        agregationAttributes: agregationMethods,
      );
      print(query);
      final response = await context.mappedResultsQuery(query);
      if (response.isNotEmpty) {
        return response[0];
      }
      return null;
    } catch (error) {
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> list(
      {required PostgreSQLExecutionContext context,
      required String table,
      List<Attribute>? attributes,
      InnerJoin? innerJoin,
      List<String>? agregationAttributes,
      int? limit,
      List<Where>? where,
      String? orderByAsc}) async {
    try {
      List<Map<String, dynamic>> response = [];
      String? query = constructSqlQuerySelect(
          limit: limit,
          where: where,
          table: table,
          attributes: attributes,
          agregationAttributes: agregationAttributes,
          innerJoin: innerJoin,
          orderByAsc: orderByAsc);
      print(query);
      var result = await context.mappedResultsQuery(query);
      for (var item in result) {
        response.add(item);
      }
      return response;
    } catch (error) {
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> search({
    required PostgreSQLExecutionContext context,
    required String table,
    required List<Where> where,
    List<Attribute>? attributes,
    InnerJoin? innerJoin,
    List<String>? agregationAttributes,
    int? limit,
    String? orderByAsc,
  }) async {
    try {
      List<Map<String, dynamic>> response = [];
      String? query = constructSqlQuerySearch(
          limit: limit,
          where: where,
          table: table,
          attributes: attributes,
          innerJoin: innerJoin,
          agregationAttributes: agregationAttributes,
          orderByAsc: orderByAsc);
      print(query);
      var result = await context.mappedResultsQuery(query);
      for (var item in result) {
        response.add(item);
      }
      return response;
    } catch (error) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>?> update(
      {required PostgreSQLExecutionContext context,
      required String table,
      required Map<String, dynamic> data,
      required List<Where>? where,
      List<Attribute>? attributes}) async {
    try {
      String query = constructSqlQueryUpdate(
          table: table, data: data, attributes: attributes, where: where);
      print(query);
      final response = await context.mappedResultsQuery(query);
      if (response.isNotEmpty) {
        return response[0][table];
      }
      return null;
    } catch (error) {
      rethrow;
    }
  }
}
