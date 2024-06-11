string userName = ctx.GetAuthenticatedUserName();
string query = "SELECT * FROM users WHERE username = '" + userName + "' AND password = '" + password + "'";
List<string> items = sess.CreateSQLQuery(query);
