using Microsoft.Data.Sqlite;

namespace BlazorSQL.Data
{
    public class SQLiteService
    {
        public string SQLiteServiceTest()
        {
            return "Hello From SQLiteService";
        }

        public string testConnection(string connection_string)
        {
            using var connection = new SqliteConnection(connection_string);
            try
            {
                connection.Open();
                return "OK";
            } 
            catch (Exception ex)
            {
                return ex.ToString();
            }
        }

        private static SqliteConnection GetConnection()
        {
            using var connection = new SqliteConnection("Data Source=db.sqlite");
            try { connection.Open(); }
            catch { throw new Exception("Bad SQLite connection"); }
            return connection;
        }

        public string GetVersion()
        {
            string query = "SELECT SQLITE_VERSION()";

            using var connection = new SqliteConnection();
            connection.Open();

            using var cursor = new SqliteCommand(query, connection);
            string? version = cursor?.ExecuteScalar()?.ToString();
            return $"SQLite version: {version}";
        }

        public SqliteCommand GetCursor()
        {

            var connection = GetConnection();
            connection.Open();

            var cursor = new SqliteCommand("", connection);
            return cursor;
        }
    }
}
