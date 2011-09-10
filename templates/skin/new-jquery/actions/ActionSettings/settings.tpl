{include file='header.tpl' menu='settings' showWhiteBack=true}

<h1>{$aLang.openid_menu_settings_title}</h1>

{if count($aOpenId)}

	{literal}
	<script language="JavaScript" type="text/javascript">
	function deleteOpenID(openid,obj) {
		
		ls.ajax(aRouter['settings']+'openid/ajaxdeleteopenid/', {openid:openid}, function(resp){
			if (resp) {
				if (resp.bStateError) {
					ls.msg.error(resp.sMsgTitle,resp.sMsg);
				} else {
					ls.msg.notice(resp.sMsgTitle,resp.sMsg);
					$(obj).parent().fadeOut();
				}
			} else {
				ls.msg.error('Error','Please try again later');
			}
		}.bind(this));
		return false;
	}
	</script>
	{/literal}

	<ul>
	{foreach from=$aOpenId item=oOpenId}
		<li>{$oOpenId->getOpenid()|escape:'html'} <a href="#" onclick="return deleteOpenID('{$oOpenId->getOpenid()|escape:'html'}',this);"><img src="{$sTemplateWebPathPlugin}img/delete.png" alt="{$aLang.openid_menu_settings_delete}" title="{$aLang.openid_menu_settings_delete}"/></a></li>
	{/foreach}
	</ul>
{else}
	{$aLang.openid_menu_settings_empty}
{/if}

{include file='footer.tpl'}