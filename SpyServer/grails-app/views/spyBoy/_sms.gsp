<%--<g:if test="${smsInstanceTotal>0  && isAllSmses}">
	<div class="scroller" style="height: 332px" data-always-visible="1"
		data-rail-visible1="1">
		<ul class="chats">
			<g:each in="${smsInstanceList}" status="i" var="smsInstance">
				<li class="${smsInstance[0].folderName =='inbox' ? 'in' : 'out'}">
					<g:if
						test='${smsInstance[1].image!=null && smsInstance[1].image!=""}'>
						<img class="avatar"
							src="data:image/png;base64,${smsInstance[1].image}" alt="" />
					</g:if> <g:else>
						<img class="avatar"
							src="${resource(dir: 'uaassets/img', file: 'avatar.png')}" alt="" />
					</g:else>
					<div class="message">
						<span class="charrow"></span> <a href="#" class="name tooltips"
							data-original-title="${smsInstance[0].formatedPhoneNumer}"
							data-container="body" data-placement="bottom"> ${smsInstance[0].folderName =='inbox' ? smsInstance[1].name : 'הבעלים של הנייד'}
						</a> <span class="datetime"> ${fieldValue(bean: smsInstance[0], field: "formatedDate")}
						</span> <span class="body emoji" style="word-wrap: break-word;"> ${fieldValue(bean: smsInstance[0], field: "msg")}
						</span>
					</div>
				</li>
			</g:each>
		</ul>
	</div>
</g:if>--%>
<g:if test="${smsInstanceTotal>0  && !isAllSmses}">
	<div class="scroller" style="height: 312px" data-always-visible="1"
		data-rail-visible1="1">
		<ul class="chats">
			<g:each in="${smsInstanceList}" status="i" var="smsInstance">
				<li class="${smsInstance.folderName =='inbox' ? 'in' : 'out'}"><g:if
						test='${contactDetails.image!=null && contactDetails.image!="" && smsInstance.folderName =="inbox"}'>
						<img class="avatar"
							src="data:image/png;base64,${contactDetails.image}" alt="" />
					</g:if> <g:elseif
						test='${phoneOwnerData.image!=null && phoneOwnerData.image!="" && smsInstance.folderName !="inbox"}'>
						<img class="avatar"
							src="data:image/png;base64,${phoneOwnerData.image}" alt="" />
					</g:elseif> <g:else>
						<img class="avatar"
							src="${resource(dir: 'uaassets/img', file: 'avatar.png')}" alt="" />
					</g:else>
					<div class="message">
						<span class="charrow"></span> <a href="#" class="name tooltips"
							data-original-title="${smsInstance.formatedPhoneNumer}"
							data-container="body" data-placement="bottom"> ${smsInstance.folderName =='inbox' ? contactDetails.name : phoneOwnerData.alias}
						</a> <span class="datetime"> ${smsInstance.formatedDate}
						</span> <span class="body emoji" style="word-wrap: break-word;"> ${smsInstance.msg}
						</span>
					</div></li>
			</g:each>
		</ul>
	</div>
</g:if>
<g:else>
	<div style="text-align: center;">אין נתונים להצגה</div>
</g:else>
<script type="text/javascript">
	$(document).ready(function() {
		runEmoji();
		App.initScrollers();
	});
</script>