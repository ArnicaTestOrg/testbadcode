using System;
using System.Data.SqlClient;

namespace SQLInjectionExample
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Enter username: ");
            string userName = Console.ReadLine();

            // Assume 'password' is hardcoded for demonstration purposes.
            string password = "mySecretPassword";

            string connectionString = "Data Source=myServer;Initial Catalog=myDatabase;User ID=myUser;Password=myPassword";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Vulnerable query (DO NOT USE THIS IN PRODUCTION):
                string query = "SELECT * FROM users WHERE username = '" + userName + "' AND password = '" + password + "'";
                SqlCommand command = new SqlCommand(query, connection);

                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    Console.WriteLine($"User ID: {reader["UserId"]}, Username: {reader["Username"]}");
                }
            }
        }
    }
}
