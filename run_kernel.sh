sudo kill -9 $(ps -ef|grep "python3 wsgi.py"|grep -v grep|awk '{print $2}')
sudo python3 -B wsgi.py
