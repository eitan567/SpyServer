<!-- Panel -->
		<div id="toppanel">
			<div id="panel" class="notification success closeable">
				<div class="content clearfix">
					<div class="left">
						<h1>Welcome to Web-Kreation</h1>
						<h2>Sliding login panel Demo with jQuery</h2>		
						<p class="grey">You can put anything you want in this sliding panel: videos, audio, images, forms... The only limit is your imagination!</p>
						<h2>Download</h2>
						<p class="grey">To download this script go back to <a href="http://web-kreation.com/index.php/tutorials/nice-clean-sliding-login-panel-built-with-jquery" title="Download">article &raquo;</a></p>
					</div>
					<div class="left">
						<!-- Login Form -->
						<form class="clearfix" action="#" method="post">
							<h1><g:message code="login.tab.memeber.login" default="Member Login"/></h1>
							<label class="grey" for="log"><g:message code="login.tab.username" default="Username:"/></label>
							<input class="field" type="text" name="log" id="log" value="" size="23" />
							<label class="grey" for="pwd"><g:message code="login.tab.password" default="Password:"/></label>
							<input class="field" type="password" name="pwd" id="pwd" size="23" />
			            	<label><input name="rememberme" id="rememberme" type="checkbox" checked="checked" value="forever" /> &nbsp;<g:message code="login.tab.rememberMe" default="Remember me"/></label>
		        			<div class="clear"></div>
							<input type="submit" name="submit" value="${message(code: 'login.tab.logmein', default: 'login')}" class="button color" />
							<a class="lost-pwd" href="#"><g:message code="login.tab.password.lost.message" default="Lost your password?"/></a>
						</form>
					</div>
					<div class="left right">			
						<!-- Register Form -->
						<form action="#" method="post">
							<h1><g:message code="login.tab.notAMemberYet" default="Not a member yet? Sign Up!"/></h1>				
							<label class="grey" for="signup"><g:message code="login.tab.username" default="Username:"/></label>
							<input class="field" type="text" name="signup" id="signup" value="" size="23" />
							<label class="grey" for="email"><g:message code="login.tab.mail" default="Email:"/></label>
							<input class="field" type="text" name="email" id="email" size="23" />
							<label><g:message code="login.tab.mail.password.message" default="A password will be e-mailed to you."/></label>
							<input type="submit" name="submit" value="${message(code: 'login.tab.registerMe', default: 'register')}" class="button color" />
						</form>
					</div>
				</div>
				</div> <!-- /login -->	
				
				<!-- The tab on top -->	
				<div class="tab">
					<ul class="login">
						<li id="toggle">
							<a id="openMe"  style="border-top: medium none;background-color: white;border-radius:0px !important;box-shadow:none;padding:13px 18px;width:168px" href="#" class="notification success closeable"><g:message code="login.tab.login" default="Log In"/> | <g:message code="login.tab.register" default="Register"/></a>
							<a id="closeMe" style="display: none; border-top: medium none;background-color: white;border-radius:0px !important;box-shadow:none;width:168px;padding:13px 18px;" href="#" class="notification success closeable"><g:message code="login.tab.login" default="Log In"/> | <g:message code="login.tab.register" default="Register"/></a>			
						</li>
					</ul> 
				</div> <!-- / top -->
				
		</div> <!--panel -->