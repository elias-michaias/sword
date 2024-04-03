import http.server
import socketserver
import argparse

parser = argparse.ArgumentParser()
parser.add_argument("-p", "--port", default=8080, type=int, dest="port")
args = parser.parse_args()

PORT = args.port
Handler = http.server.SimpleHTTPRequestHandler
httpd = socketserver.TCPServer(("", PORT), Handler)
print("serving at port", PORT)
httpd.serve_forever()