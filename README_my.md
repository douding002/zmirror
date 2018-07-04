## 500 Internal Server Error
Internal Server Error
The server encountered an internal error and was unable to complete your request. Either the server is overloaded or there is an error in the application.

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

1. assemble_parse()               
**将用户请求的URL解析为对应的目标服务器URL**  
2. filter_client_request()          
对用户请求进行检查和过滤,不符合条件的请求(比如爬虫)将终止执行  
3. prior_request_redirect()         
对用户请求进行第一级重定向(隐式重写前的重定向),如果返回的是None, 照常继续  
4. rewrite_client_request()         
进行请求的隐式重写/重定向  
5. ssrf_check_layer_1()             
第一层SSRF检查, 防止请求不允许的网站  
6. extract_client_header()          
提取出经过必要重写后的浏览器请求头  
7. posterior_request_redirect()     
对用户请求进行第二级重定向(隐式重写后的重定向),如果返回的是None, 照常继续  
8. prepare_client_request_data()  
**解析并重写浏览器请求的data内容**  
9. request_remote_site()          
**请求真正的远程服务器**  
10. send_request()

11. guess_correct_domain()           
返回404/500时进行 domain_guess 尝试  
12. parse_remote_response()        
**解析远程服务器的响应**  
13. generate_our_response()        
生成我们的响应**  
14. copy_response  
15. dump_zmirror_snapshot            
dump当前状态到文件  
16. put_response_to_local_cache      
存储服务器的整个响应
