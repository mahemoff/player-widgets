cd `dirname $0`/build
#/usr/bin/open -a "/Applications/Google Chrome.app" "http://localhost:8000"
echo 'Widget test will appear at http://localhost:8000/host.html'
python -m SimpleHTTPServer
