## 优点
按需代理，需要访问时才实时转发
访问终端不需任何额外设置
访问终端类型和数量基本没有限制

## 缺点
容易奔溃

## 常见错误
500 Internal Server Error
Internal Server Error
The server encountered an internal error and was unable to complete your request. Either the server is overloaded or there is an error in the application.

## 调试程序
采用访问单个文件的方法来分析程序的运行

# app.route 
- @app.route('/zmirror_stat')
    def zmirror_status():           返回服务器的一些状态信息

- @app.route('/ip_ban_verify_page', methods=['GET', 'POST'])
    def ip_ban_verify_page():    返回身份验证页面

- @app.route('/crossdomain.xml')
    def crossdomain_xml():          返回一个xml文件，不知道用途

- @app.route('/about_zmirror')
    def about_zmirror():                   返回about信息

- @app.route('/', methods=['GET', 'POST', 'OPTIONS', 'PUT', 'DELETE', 'HEAD', 'PATCH'])
- @app.route('/<path:input_path>', methods=['GET', 'POST', 'OPTIONS', 'PUT', 'DELETE', 'HEAD', 'PATCH'])
    def zmirror_enter(input_path='/'):      入口函数的壳  
    def main_function(input_path='/'):   程序的实际入口函数  
# main_function

assemble_parse()                 1 **将用户请求的URL解析为对应的目标服务器URL**  
filter_client_request()          2 对用户请求进行检查和过滤,不符合条件的请求(比如爬虫)将终止执行  
prior_request_redirect()         3 对用户请求进行第一级重定向(隐式重写前的重定向),如果返回的是None, 照常继续  
rewrite_client_request()         4 进行请求的隐式重写/重定向  
ssrf_check_layer_1()             5 第一层SSRF检查, 防止请求不允许的网站  
extract_client_header()          6 提取出经过必要重写后的浏览器请求头  
posterior_request_redirect()     7 对用户请求进行第二级重定向(隐式重写后的重定向),如果返回的是None, 照常继续  
prepare_client_request_data()    8 **解析并重写浏览器请求的data内容**  
request_remote_site()            9 **请求真正的远程服务器**  
send_request()              	 9.1 发送请求
guess_correct_domain()           9.2 返回404/500时进行 domain_guess 尝试  
parse_remote_response()          10 **解析远程服务器的响应**  
generate_our_response()          11 **生成我们的响应**  
copy_response() 	         11.1 复制响应
dump_zmirror_snapshot()          11.2 dump当前状态到文件  
put_response_to_local_cache()    12 存储服务器的整个响应
