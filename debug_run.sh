sudo kill -9 $(ps -ef|grep "python3 wsgi.py"|grep -v grep|awk '{print $2}')

cp config_default.py config.py
echo "built_in_server_host = '0.0.0.0'" >> config.py 
echo "built_in_server_debug = False" >> config.py 
echo "my_host_port = 8000" >> config.py

sudo python3 -B wsgi.py
