from http.server import HTTPServer, BaseHTTPRequestHandler
import ssl

class MainHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        print("GET")
        badurl = "www.bad.com"
        self.send_response(301)
        self.send_header("Location", badurl)
        self.send_headers()

httpd = HTTPServer(('0.0.0.0', 443), MainHandler)
httpd.socket = ssl.wrap_socket(httpd.socket, certfile="server.pem", server_side=True)
httpd.serve_forever()
