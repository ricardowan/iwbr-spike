<#assign context_path = "${contextPath?default('/skipe-goods')}">
<#assign templates_base_path = "template?href=">

<#-- ------------+ 通用宏 +--------------- -->
<#macro html title="" iconUrl="" import="layui" context_path="portal">
    <!DOCTYPE html>
    <html lang="zh">
    <head>
        <meta http-equiv="X-UA-Compatible">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
        <#if iconUrl??>
            <link rel="icon" id="favIcon" href="${iconUrl}">
        </#if>
        <title>${title}</title>
        <#if import??>
            <#list import?split(",") as lib>
                <#switch lib>
                    <#case "layui">
                        <@style path="webjars/lib/layui/css/layui.css"/>
                        <#break />
                    <#case "common">
                        <@style path="font/iconfont.css"/>
                        <@style path="webjars/gtmap/css/new-common.css"/>
                        <@style path="webjars/gtmap/css/new-public.css"/>
                        <@style path="css/common.css"/>
                        <@style path="css/public.css"/>
                        <#break />
                    <#case "ztree">
                        <@style path="webjars/lib/zTree_v3/css/metroStyle/metroStyle.css"/>
                        <#break />
                    <#case "leaflet">
                        <@style path="js/lib/module/leaflet/leaflet.css"/>
                        <#break />
                    <#case "tabTool">
                        <@style path="webjars/gtmap/css/tab-tool.css?v=${.now?long}"/>
                        <#break />
                    <#case "swiper">
                        <@style path="webjars/lib/module/swiper/swiper.min.css"/>
                        <#break />
                    <#case "resourceManage">
                        <@style path="css/resource-manage-center/resource-manage-public.css"/>
                        <#break />
                    <#case "jsonEditor">
                        <@style path="js/lib/jsoneditor/jsoneditor.min.css"/>
                        <#break />
                    <#case "videojs">
                        <@style path="js/lib/videojs/video-js.min.css"/>
                        <#break />
                    <#case "dropZone">
                        <@style path="js/lib/dropZone/dropzone.min.css"/>
                        <#break />
                    <#case "iziToast">
                        <@style path="js/lib/iziToast-1.4.0/iziToast.min.css"/>
                        <#break />
                    <#case "liMarquee">
                        <@style path="js/lib/liMarquee/liMarquee.css" />
                        <#break />
                    <#default>
                </#switch>
            </#list>
        </#if>
    </head>
    <body class="gtmap">
    <#if import??>
        <#list import?split(",") as lib>
            <#switch lib>
                <#case "layui">
                    <@script path="webjars/lib/layui/layui.js"/>
                    <@script path="js/lib/jquery.min.js"/>
                    <#break />
                <#case "common">
                    <@script path="webjars/gtmap/js/screen.js"/>
                    <@script path="js/lib/lodash/lodash.min.js"/>

                    <@script path="js/constant.js"/>
                    <@script path="js/utils.js"/>
                    <@script path="js/public.js"/>
                    <@script path="js/common.js"/>
                    <@script path="js/store-for-iframe.js"/>
                    <#break />
                <#case "ztree">
                    <@script path="webjars/lib/zTree_v3/js/jquery.ztree.core.js"/>
                    <@script path="webjars/lib/zTree_v3/js/jquery.ztree.excheck.js"/>
                    <@script path="webjars/lib/zTree_v3/js/jquery.ztree.exedit.js"/>
                    <@script path="webjars/lib/zTree_v3/js/jquery.ztree.exhide.js"/>
                    <@script path="webjars/lib/zTree_v3/js/fuzzysearch.js"/>
                    <#break />
                <#case "tabTool">
                    <@script path="webjars/lib/module/tabTool/tabTool.js?v=${.now?long}"/>
                    <#break />
                <#case "echarts">
                    <@script path="js/lib/echarts/echarts.min.js"/>
                    <#break />
                <#case "swiper">
                    <@script path="webjars/lib/module/swiper/swiper.min.js"/>
                    <#break />
                <#case "resourceManage">
                    <@script path="js/resource-manage-center/manage-public.js"/>
                    <#break />
                <#case "jsonEditor">
                    <@script path="js/lib/jsoneditor/jsoneditor.min.js"/>
                    <#break />
                <#case "wangEditor">
                    <@script path="js/lib/wangEditor/wangEditor.min.js"/>
                    <#break />
                <#case "videojs">
                    <@script path="js/lib/videojs/video.js"/>
                    <#break />
                <#case "dropZone">
                    <@script path="js/lib/dropZone/dropzone.min.js"/>
                    <@script path="js/custom/dropZone/dropZoneUpload.js"></@script>
                    <#break />
                <#case "openSeaDragon">
                    <@script path="js/lib/openSeaDragon/openseadragon.js"/>
                    <#break />
                <#case "iziToast">
                    <@script path="js/lib/iziToast-1.4.0/iziToast.min.js"/>
                    <#break />
                <#case "liMarquee">
                    <@script path="js/lib/liMarquee/jquery.liMarquee.js" />
                    <#break />
                <#case "autofit">
                    <@script path="js/lib/autofit/autofit.min.js" />
                    <#break />
                <#default>
            </#switch>
        </#list>
    </#if>
    <#nested />
    </body>
    </html>
</#macro>

<#macro script path>
    <script src="${context_path!}/${path}" type="text/javascript"></script>
</#macro>

<#macro style path>
    <link href="${context_path!}/${path}" type="text/css" rel="stylesheet"/>
</#macro>

<#-- ------------+ 再封装宏 +--------------- -->
<#--layui表单项目-->
<#macro layuiFormItem col="12" label="标签" isRequired=false>
    <div class="layui-col-md${col} layui-col-sm${col}">
        <div class="layui-form-item">
            <label class="layui-form-label">
                <#if label?contains("\n")>
                    <span class="gt-label-text" style="display: flex;flex-direction: column">
                        <span>
                            <#if isRequired><span style="color:red;">*</span></#if>
                            ${label?split("\n")[0]}
                        </span>
                        <span>${label?split("\n")[1]}<span>
                    </span>
                <#else>
                    <span class="gt-label-text">
                        <#if isRequired><span style="color:red;">*</span></#if>${label}
                    </span>
                </#if>
            </label>
            <div class="layui-input-block">
                <#nested />
            </div>
        </div>
    </div>
</#macro>

<#--layui表单项目-->
<#macro layuiFormItemNew col="12" label="标签" isRequired=false>
    <div class="layui-col-md${col}">
        <div class="layui-form-item">
            <label class="layui-form-label" style="display: flex;padding-left: 8px;width: 72px">
                <div style="width: 6px;display: flex;justify-content: center;align-items: center"><#if isRequired><span style="color:red;">*</span></#if></div>
                <#if label?contains("\n")>
                    <span class="gt-label-text" style="display: flex;flex-direction: column">
                        <span style="text-align: left;padding-right: 0;padding-left: 3px">
                            ${label?split("\n")[0]}
                        </span>
                        <span style="text-align: left;padding-right: 0;padding-left: 3px">${label?split("\n")[1]}<span>
                    </span>
                <#else>
                    <span class="gt-label-text" style="text-align: left;padding-right: 0;line-height: 38px;padding-left: 3px">
                        ${label}
                    </span>
                </#if>
            </label>
            <div class="layui-input-block">
                <#nested />
            </div>
        </div>
    </div>
</#macro>

<#--layui表单按钮组-->
<#macro formBtnGroup layuiFilter="" btnNames=["提 交", "取 消"] btnIcons=["", ""] cancelId="cancelBtn">
    <div class="btn-group-box">
        <div class="layui-form-item cancle-mgb submit">
            <div class="layui-input-block">
                <button type="button" class="layui-btn layui-btn-sm " id="zdxSubmit" lay-submit="" lay-filter="${layuiFilter}">
                    <#if btnIcons[0] != ""><i class="${btnIcons[1]}"></i></#if>
                    ${btnNames[0]}
                </button>
                <button type="button" id="${cancelId}" class="layui-btn layui-btn-sm layui-btn-primary closeRightBox">
                    <#if btnIcons[1] != ""><i class="${btnIcons[0]}"></i></#if>
                    ${btnNames[1]}
                </button>
            </div>
        </div>
    </div>
</#macro>

<#--layui弹框自定义底部-->
<#macro layOpenBottomBtn>
    <div class="layer-footer-btn view-noShow">
        <#nested />
    </div>
</#macro>

<#--上传或下载-->
<#macro uploadOrDownload type="upload"  <#-- 类型【upload/download】 -->
                         btnId=""  <#-- 组件ID（一个页面多个引用） -->
                         style="normal" <#-- 样式风格 -->>
    <#--  上传模块  -->
    <#if type == "upload">
        <#if style == "normal">
            <button type="button" class="layui-btn layui-btn-sm upload-normal" id="${btnId}">
                <i class="layui-icon">&#xe67c;</i><#nested />
            </button>
        </#if>

        <#if style == "simple">
            <button type="button" class="layui-btn layui-btn-primary layui-btn-sm layui-btn-sm upload-simple" id="${btnId}">
                <i class="layui-icon">&#xe67c;</i><#nested />
            </button>
        </#if>
    </#if>
    <#--  下载模块  -->
    <#if type == "download">
        <#if style == "normal">
            <button type="button" class="layui-btn layui-btn-sm download-normal" id="${btnId}">
                <i class="iconfont icon-cloud-download"></i><#nested />
            </button>
        </#if>

        <#if style == "simple">
            <button type="button" class="layui-btn layui-btn-primary layui-btn-sm download-simple" id="${btnId}">
                <i class="iconfont icon-cloud-download"></i><#nested />
            </button>
        </#if>
    </#if>
</#macro>

<#-- -------------+ 业务宏 +---------------- -->
<#--通用页面头部-->
<#macro gtmapHeader isMainHeader=true <#--是否是主页头部-->
                    headerCode="index"  <#--用于和用户权限信息对应-->
                    extraReturnPortal = "false" <#--是否添加返回首页按钮-->
                    isNoMainHeaderBackgroundPicture = false  <#--当前页面是主页头部时是否不采用主页头部背景图片-->
                    indexUrl = "index" <#--门户首页地址-->
                    isDropDownMenu = "true" <#--门户首页地址-->
                    isShowTitleFirstMenu = "false"
                    headDisplayStyle = "portal-header"
                    isExternal = false
                    headerStyle = ""
                    globalRegionCode = ""
                    iframeId="">  <#--当前页面iframe的id-->
    <#--标题栏-部件模式模板-->
    <script id="titleBlock-piece-template" type="text/html">
        <div class="text-header">
            {{# if(d.homeTitleIcon) { }}
            <div class="text-header-icon">
                <img class="logo-img" src="{{d.homeTitleIcon}}" alt="">
            </div>
            {{# } }}
            <div  class="title-box">
                {{# if(d.homeTitlePriText || d.homeTitleSecText) { }}
                <div class="box-main">
                    <#-- 文本盒子（包含主标题、次标题和英文标题） -->
                    <div class="text-box">
                        <div class="text-col">
                            {{# if(d.homeTitlePriText) { }}
                            <span class="primary-title gt-ellipsis" id="portal-title">{{d.homeTitlePriText}}</span>
                            {{# } }}
                            {{# if(d.homeTitleSecText) { }}
                            <span class="auxiliary-title">{{d.homeTitleSecText}}</span>
                            {{# } }}
                        </div>
                        <div class="text-col">
                            {{# if(d.homeTitleEnText) { }}
                            <div class="primary-title-en">{{d.homeTitleEnText}}</div>
                            {{# } }}
                        </div>
                    </div>

                    <#-- 下拉菜单模式内容 -->
                    <div id="drop-down-extra" class="noShow">
                        <#-- 分割线 -->
                        <span class="dividing-line"></span>
                        <span class="model">
                        <i class="model-icon iconfont icon-dingweixiao"></i>
                        <span class="model-name" id="modelName"></span>
                    </span>
                    </div>
                    <div id="no-drop-down-extra">
                        <span class="dividing-line"></span>
                        <i id="no-drop-down-extra-icon" class="model-icon iconfont icon-dingweixiao"></i>
                        <span id="no-drop-down-extra-name"></span>
                        <dl id="no-drop-down-extra-list-dom" class="layui-nav-child layui-anim layui-anim-upbit new-css" style="position: absolute; right: 28px; width: 161px; left: auto; min-width: auto; text-align: center; background-color: #fff; color: #000">
                        </dl>
                    </div>
                </div>
                {{# } }}
            </div>
        </div>
    </script>
    <script id="no-drop-down-extra-list-template" type="text/html">
        {{# layui.each(d, function(index, item){ }}
        <dd class="new-hover">
            {{# let icon = JSON.parse(item.customCfg).icon || "icon-dingweixiao" }}
            {{# let iconColor = JSON.parse(item.customCfg).iconColor || "" }}
            <i class="model-icon iconfont {{ icon }} font22" style="color: {{ iconColor }}"></i>
            <span style="margin-left: 10px" data-url="{{item.url}}" onclick="onNoDropDownExtraMenuClick(this)">
                {{# if(item.name === "首页"){ }}
                <div class="user-jump-class" target="_blank">首&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;页</div>
                {{# }else{ }}
                <div class="user-jump-class" target="_blank">{{ item.name }}</div>
                {{# } }}
            </span>
        </dd>
        {{# }) }}
    </script>
    <#--标题栏-图片模式模板-->
    <script id="titleBlock-image-template" type="text/html">
        {{# if(d.homeTitleImage) { }}
        <div class="text-header">
            <img id="img" class="header-bg" src="{{d.homeTitleImage}}" alt="">
        </div>
        {{# } }}
    </script>
    <#--功能菜单模板-->
    <script id="featureMenu-template" type="text/html">
        <ul class="layui-form list-header" id="menuId">
            {{#  layui.each(d, function(index, item){  }}
            <li onclick="onMenuClick(this)" class="topMenu {{item.extraClass}}"  id={{item.id}} data-url={{item.url}}>{{item.name}}</li>
            {{#  }); }}
        </ul>
    </script>
    <#--功能菜单模板-->
    <script id="featureMenu-dropDown-template" type="text/html">
        <ul class="layui-form list-header" id="menuId">
            {{#  layui.each(d, function(index, item){  }}
                {{# let hideDropdown = JSON.parse(item.customCfg).hasOwnProperty("ifDropdown") && JSON.parse(item.customCfg).ifDropdown === "false" }}
                {{# if (item.hasOwnProperty("children") && item.children.length > 0 && !hideDropdown) { }}
                <li class="topMenu {{item.extraClass}} gtmap-user"
                    data-name="{{item.name}}"
                    id={{item.id}}
                    data-url={{item.url}}>
                    <span class="name">{{item.name}}</span>
                    <i class="iconfont icon-caret-down" style="margin-left: 2px"></i>
                {{# }else{ }}
                <li onclick="onMenuClickOfDrop(this)"
                    data-name="{{item.name}}"
                    class="topMenu {{item.extraClass}} gtmap-user"
                    id={{item.id}}
                    data-url={{item.url}}
                    data-code={{item.code}}
                    has-auth={{item.hasAuth}}>
                    <span class="name">{{item.name}}</span>
                {{# } }}
                {{# if (item.hasOwnProperty("children") && item.children.length > 0 && !hideDropdown) { }}
                <dl class="layui-nav-child layui-anim layui-anim-upbit new-css" style="width: 105px; left: auto; min-width: auto; text-align: center; background-color: #fff; color: #000">
                    {{# layui.each(item.children, function(index, children){ }}
                    <dd>
                        <span onclick="onMenuChildrenClickOfDrop(this)"
                              data-url="{{children.url}}"
                              id={{children.id}}
                              data-name={{children.name}}
                              data-code={{children.code}}
                              has-auth={{children.hasAuth}}>
                            <div class="user-jump-class" target="_blank">{{ children.name }}</div>
                        </span>
                    </dd>
                    {{# }); }}
                </dl>
                {{# } }}
                </li>
            {{# }); }}
        </ul>
    </script>
    <#--用户信息模板-->
    <script id="userInfo-template" type="text/html">
        <div class="gtmap-user">
            <i class="user-icon iconfont icon-yonghu-tianchong"></i>
            <span class="user-name gt-ellipsis" id="userAlias">{{d.userName}}<span class="wtBadgeToDo noShow"></span></span>
            <dl class="layui-nav-child layui-anim layui-anim-upbit">
                {{#  layui.each(d.operateList, function(index, item){  }}
                {{# if(item.code === 'myAgent'){	}}
                <dd>
                    <span onclick="toDoClick(this)" data-openNew="{{item.openNewPage}}" class="user-jump-class user-color-white">{{ item.name }}</span>
                    <span class="toDoListNumber itemWtBadgeToDo noShow">0</span>
                </dd>
                {{# }else if(item.code === 'myMessage'){ }}
                <dd>
                    <span onclick="toReadClick(this)" data-openNew="{{item.openNewPage}}" class="user-jump-class user-color-white">{{ item.name }}</span>
                    <span class="toReadListNumber itemWtBadgeToDo noShow">0</span>
                </dd>
                <#-- 账户设置 -->
                {{# }else if(item.code === 'accountSetting'){	}}
                <dd>
                    <span onclick="onClickUserSetting(this)" data-openNew="{{item.openNewPage}}" class="user-jump-class user-color-white">{{ item.name }}</span>
                </dd>
                {{# }else{	}}
                <dd>
                    <span onclick="onUserFunction(this)" data-name={{item.name}}><a class="user-jump-class" href="{{item.url}}" target="_blank">{{ item.name }}</a></span>
                </dd>
                {{# }	}}
                {{#  }); }}
            </dl>
        </div>
    </script>
    <#-- 用户信息空白背景模板 -->
    <script id="userInfo-white-background-template" type="text/html">
        <div class="gtmap-user">
            <i class="user-icon iconfont icon-yonghu-tianchong"></i>
            <span class="user-name gt-ellipsis" id="userAlias">{{d.userName}}<span class="wtBadgeToDo noShow"></span></span>
            <i class="iconfont icon--down"></i>
            <dl class="layui-nav-child layui-anim layui-anim-upbit new-css" style="background-color: #fff;">
                {{#  layui.each(d.operateList, function(index, item){  }}
                {{# if(item.code === 'myAgent'){	}}
                <dd>
                    <span onclick="toDoClick(this)" data-openNew="{{item.openNewPage}}" class="user-jump-class">{{ item.name }}</span>
                    <span class="toDoListNumber itemWtBadgeToDo noShow">0</span>
                </dd>
                {{# }else if(item.code === 'myMessage'){ }}
                <dd>
                    <span onclick="toReadClick(this)" data-openNew="{{item.openNewPage}}" class="user-jump-class">{{ item.name }}</span>
                    <span class="toReadListNumber itemWtBadgeToDo noShow">0</span>
                </dd>
                <#-- 账户设置 -->
                {{# }else if(item.code === 'accountSetting'){	}}
                <dd>
                    <span onclick="onClickUserSetting(this)" data-openNew="{{item.openNewPage}}" class="user-jump-class">{{ item.name }}</span>
                </dd>
                {{# }else{	}}
                <dd>
                    <span onclick="onUserFunction(this)" is-open-new-page="{{item.openNewPage}}" data-name={{item.name}}><span class="user-jump-class" href="{{item.url}}" target="_blank">{{ item.name }}</span></span>
                </dd>
                {{# }	}}
                {{#  }); }}
            </dl>
        </div>
    </script>

    <script id="featureMenu-430000-template" type="text/html">
        <div class="menu-list">
            {{# layui.each(d, function(index, item){ }}
            {{# let hideDropdown = JSON.parse(item.customCfg).hasOwnProperty("ifDropdown") && JSON.parse(item.customCfg).ifDropdown === "false" }}
            {{# if (item.hasOwnProperty("children") && item.children.length > 0 && !hideDropdown) { }}
            <div class="menu-item custom-header-menu"
                data-name="{{item.name}}"
                id={{item.id}}
                data-url={{item.url}}>
                <span class="name">{{item.name}}</span>
                <i class="iconfont icon-caret-down" style="margin-left: 2px"></i>
                {{# }else{ }}
                    <div onclick="onMenuClickOfDrop(this)"
                        data-name="{{item.name}}"
                        class="menu-item custom-header-menu"
                        id={{item.id}}
                        data-url={{item.url}}
                        data-code={{item.code}}
                        has-auth={{item.hasAuth}}>
                        <span class="name">{{item.name}}</span>
                        {{# } }}
                        {{# if (item.hasOwnProperty("children") && item.children.length > 0 && !hideDropdown) { }}
                        <dl class="layui-nav-child layui-anim layui-anim-upbit new-css" style="width: 105px; left: auto; min-width: auto; text-align: center; background-color: #fff; color: #000; font-size: 14px">
                            {{# layui.each(item.children, function(index, children){ }}
                            <dd>
                                <span onclick="onMenuChildrenClickOfDrop(this)"
                                      data-url="{{children.url}}"
                                      id={{children.id}}
                                      data-name={{children.name}}
                                      data-code={{children.code}}
                                      has-auth={{children.hasAuth}}>
                                    <div class="user-jump-class custom-header-child-menu" target="_blank">{{ children.name }}</div>
                                </span>
                            </dd>
                            {{# }); }}
                        </dl>
                        {{# } }}
                    </div>
                {{# }) }}
            </div>
        </div>
    </script>
    <script id="userInfo-430000-template" type="text/html">
        <div class="user">
            <i class="iconfont icon-user"></i>
            {{d.userName}}
            <dl class="layui-nav-child layui-anim layui-anim-upbit new-css" style="width: 105px;margin-left: 22px; left: auto; min-width: auto; text-align: center; background-color: #fff; color: #000; font-size: 14px">
                {{#  layui.each(d.operateList, function(index, item){  }}
                {{# if(item.code === 'myAgent'){	}}
                <dd>
                    <div onclick="toDoClick(this)" class="custom-header-child-menu" data-openNew="{{item.openNewPage}}" class="user-jump-class">{{ item.name }}<span class="toDoListNumber itemWtBadgeToDo noShow">0</span></div>
                </dd>
                {{# }else if(item.code === 'myMessage'){ }}
                <dd>
                    <div onclick="toReadClick(this)" class="custom-header-child-menu" data-openNew="{{item.openNewPage}}" class="user-jump-class">{{ item.name }}<span class="toReadListNumber itemWtBadgeToDo noShow">0</span></div>
                </dd>
                <#-- 账户设置 -->
                {{# }else if(item.code === 'accountSetting'){	}}
                <dd>
                    <div onclick="onClickUserSetting(this)" class="custom-header-child-menu" data-openNew="{{item.openNewPage}}" class="user-jump-class">{{ item.name }}</div>
                </dd>
                {{# }else{	}}
                <dd>
                    <div onclick="onUserFunction(this)" class="custom-header-child-menu" is-open-new-page="{{item.openNewPage}}" data-name={{item.name}}><span class="user-jump-class" href="{{item.url}}" target="_blank">{{ item.name }}</span></div>
                </dd>
                {{# }	}}
                {{#  }); }}
            </dl>
        </div>
    </script>

    <#if globalRegionCode == "430000">
        <div class="gtmapHeader-portal-430000 ${headerStyle}">
            <div class="gt-header">
                <div class="header-left">
                    <div class="home home-btn">
                        <i class="iconfont icon-home"></i>
                        <span class="menu-name">首页</span>
                    </div>
                    <div id="featureMenu-dom-left" class="menu-list">

                    </div>
                </div>
                <div id="header-title" class="header-title noShow">湖南省自然资源调查监测中心</div>
                <div class="header-right">
                    <div id="featureMenu-dom-right" class="menu-list">

                    </div>
                    <div id="userInfo-dom" style="height: 100%">

                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            // todo 获取字典项配置，获取用户行政区代码
            const isMainHeader = ${isMainHeader?string("true", "false")};
            const isExternal = ${isExternal?string("true", "false")};
            const headerCode = "${headerCode!"index"}";
            const iframeId = "${iframeId!"iframe-main"}";
            const extraReturnPortalStr = "${extraReturnPortal!"false"}";
            const isDropDownMenuStr = "${isDropDownMenu!"false"}"
            const isShowTitleFirstMenuStr = "${isShowTitleFirstMenu!"false"}"
            const extraReturnPortalBol = extraReturnPortalStr === "true";
            const isNoMainHeaderBackgroundPicture = ${isNoMainHeaderBackgroundPicture?string("true", "false")}
            const indexUrl = "${indexUrl!"index"}";
            const rootDomId = "${headDisplayStyle!"portal-header"}";
            let globalRegionCodeInHeader = "${globalRegionCode!""}";

            let cssSelectStr = (isMainHeader && isDropDownMenuStr === "true") ? 'borderBottomActive' : 'active';
            let menuCodeToIdMapping = {};
            let menuUrlToIdMapping = {}; // 菜单地址对id的映射
            let menuChildrenIdToParentIdMapping = {}; // 菜单子菜单ID到父菜单ID
            let menuUrlToNameMapping = {}; // 菜单地址对名称的映射
            let menuIdToUrlObjMapping = {}; // 菜单id对地址对象的映射
            let portalIndexHomeUrl = null;
            let authIdListOfMain = [];
            let updateViewIdList = []; // 更新页面ID列表（不在数组里面的ID为打开新页面

            initMacroOfGtMapHeader();

            // 根据iframe地址选中菜单
            window.custom_iframeSrcChanged = function (iframeUrl) {}

            function initMacroOfGtMapHeader() {
                // ------+ 准备初始数据 +--------
                // 组织数据（功能选项卡和用户信息）
                let menuPermissions; // 用户菜单信息
                let userName; // 用户名称
                let UserInfoData; // 用户菜单信息
                let homeConfiguration; // 主页配置项（用于渲染标题栏）
                let externalHeadTitle; // 额外头部读取的副标题
                let userRegionCode; // 用户行政区
                try {
                    menuPermissions = userPermissions.menuPermissions;
                    userName = userPermissions.userInfo.alias;
                    userRegionCode = userPermissions.userInfo.regionCode;
                    externalHeadTitle = userPermissions.externalHeadTitle;
                    homeConfiguration = userPermissions.homeConfiguration;
                    console.log(homeConfiguration)
                    if (homeConfiguration.globalRegionCode && homeConfiguration.globalRegionCode !== "") {
                        globalRegionCodeInHeader = homeConfiguration.globalRegionCode
                    }
                    if (userRegionCode) {
                        userRegionCode = userRegionCode.substring(0, 6);
                    } else {
                        userRegionCode = globalRegionCodeInHeader
                    }
                    UserInfoData = userPermissions.userMenuPermissions;

                } catch (error) {
                    console.log("用户权限信息获取失败！" + error);
                    alert("用户权限信息获取失败！");
                }
                STORE["USER_REGION_PORTAL_LIST"].then(resData => {
                    if (resData && Array.isArray(resData) && resData.length > 0) {
                        let targetRegionPortalConfig = resData.find(e => e.code === "portal_config_" + userRegionCode);
                        if (targetRegionPortalConfig && targetRegionPortalConfig.extents && targetRegionPortalConfig.extents.systemTitle) {
                            $("#header-title").text(targetRegionPortalConfig.extents.systemTitle);
                        }
                    }
                    $("#header-title").removeClass("noShow");
                })
                authIdListOfMain = [];
                let tempFeatureDataName; // 临时功能数据（用于当非主页面头部时获取副标题）
                if (homeConfiguration.homeTitleImage) {
                    $("#homeTitleImage").attr("src", parseImgUrl(getConfigurationData(homeConfiguration, "homeTitleImage")))
                }
                // ----------+ 渲染菜单内容 +--------
                if (menuPermissions) {
                    initMenuContent();
                }
                // ----------+ 渲染用户功能 +--------
                initUserFunction();
                // ----------+ websocket链接 +-------
                initWebsocket();
                // ----------+ 设置cookie +-------
                initCookie();
                // ----------+ 公共方法 +-----------
                /**
                 * 渲染数据添加额外属性（extraClass）
                 * @param data
                 */
                function addExtraProperty(data) {
                    data.map((per, index)=> {
                        // 设置首页iframe地址
                        let tempCustomConfig = getMenuCustomConfig(per);
                        if (per.code === "resource_portal" && tempCustomConfig) {
                            portalIndexHomeUrl = tempCustomConfig.homeUrl || "template?href=portal/home";
                            menuUrlToNameMapping[portalIndexHomeUrl] = "首页";
                        }
                        menuIdToUrlObjMapping[per.id] = {
                            url: per.url,
                            homeUrl: tempCustomConfig ? tempCustomConfig.homeUrl : null
                        }

                        // 记录地址与id和名称的对应关系
                        // 记录编码和id的对应关系（用于外部设置选中状态）
                        menuCodeToIdMapping[per.code] = per.id;
                        if (per.openNewPage) {
                            menuUrlToIdMapping[per.url] = per.id;
                            menuUrlToNameMapping[per.url] = per.name;
                        } else {
                            menuUrlToIdMapping[tempCustomConfig.homeUrl] = per.id;
                            menuUrlToNameMapping[tempCustomConfig.homeUrl] = per.name;
                        }
                        menuUrlToNameMapping[per.url] = per.name;
                        if (per.children && per.children.length > 0) {
                            per.children.forEach(e => {
                                menuChildrenIdToParentIdMapping[e.id] = per.id;
                                // 如果为下拉菜单记录父辈ID
                                if (isDropDownMenuStr === "true") {
                                    menuUrlToIdMapping[e.url] = per.id;
                                } else {
                                    menuUrlToIdMapping[e.url] = e.id;
                                }
                                menuUrlToNameMapping[e.url] = e.name;
                                menuCodeToIdMapping[e.code] = e.id;
                                menuIdToUrlObjMapping[e.id] = {
                                    url: e.url,
                                    homeUrl: null
                                }
                                if (e.code === "resource_manage_home" || e.code === "resource_share_home") {
                                    menuUrlToNameMapping[e.url] = per.name;
                                }
                            })
                        }

                        // 额外class设置
                        per.extraClass = "";
                        if (index === 0) {
                            per.extraClass = cssSelectStr;
                        }
                        return per;
                    })

                    /**
                     * 获取菜单数据的自定义配置
                     * @param menuData
                     * @returns {null}
                     */
                    function getMenuCustomConfig(menuData) {
                        let customConfigStr = menuData.customCfg;
                        let returnConfig;
                        try {
                            returnConfig = JSON.parse(customConfigStr);
                        } catch (e) {
                            returnConfig = null;
                        }
                        return returnConfig;
                    }
                }

                /**
                 * 根据ifShowInHeader为false过滤调头部菜单
                 */
                function filterIfShowFalse(treeArray) {
                    return treeArray.filter(node => {
                        let ifShow = JSON.parse(node.customCfg).hasOwnProperty("ifShowInHeader") && !JSON.parse(node.customCfg)["ifShowInHeader"];
                        if (!ifShow) {
                            // 如果当前节点符合条件，则递归过滤其子节点
                            if (node.children && node.children.length > 0) {
                                node.children = filterIfShowFalse(node.children);
                            }
                            return true;
                        } else {
                            // 如果当前节点不符合条件，则递归过滤掉其子节点并返回 false
                            if (node.children && node.children.length > 0) {
                                node.children = filterIfShowFalse(node.children);
                                return false;
                            }
                            return false;
                        }
                    });
                }
                /**
                 * 初始化websocket链接
                 */
                function initWebsocket() {
                    iziToast.settings({
                        timeout: 10000,
                        pauseOnHover: true,
                        close: true,
                        progressBar: true,
                        layout: 1,
                    });
                    let msgCallBack = function(msgData){
                        let message = JSON.parse(msgData.data)
                        iziToast.info({
                            title: messageBusinessType[message.msgBusType],
                            message: message.msgContent,
                            maxWidth: '300px',
                            position: 'bottomRight',
                            transitionIn: 'bounceInRight',
                            icon: messageTypeIcon[message.msgType],
                            balloon: true
                        });
                    }
                    webSocketLink(userPermissions.userInfo.username,msgCallBack);
                }

                /**
                 * 初始化cookie
                 */
                function initCookie(){
                    //设置cookie，60分钟有效期
                    let token = getUserPermissions().userInfo.token;
                    setCookie('tip_proxy_token', token);
                    setCookie('SCPTOKEN', token, {time: 200000, path : "/scp-storage"});
                }
                /**
                 * 渲染菜单内容
                 */
                function initMenuContent() {

                    // 增加额外信息
                    addExtraProperty(menuPermissions);

                    // 是否为主头部判别
                    if (isMainHeader) {
                        let mainMenus = filterIfShowFalse(menuPermissions);
                        let homeMenu = mainMenus.filter(e => e.code === 'resource_portal');
                        mainMenus = mainMenus.filter(e => e.code !== 'resource_portal');

                        console.log(homeMenu)
                        if (homeMenu[0].customCfg && JSON.parse(homeMenu[0].customCfg).homeUrl) {
                            $(".home-btn").on("click", () => {
                                // 设置iframe层级记忆
                                setHierarchyValueByIdOfTrigger(JSON.parse(homeMenu[0].customCfg).homeUrl);
                                // 修改iframe地址
                                document.getElementById(iframeId).src = JSON.parse(homeMenu[0].customCfg).homeUrl;
                            })
                        }

                        // 渲染下拉菜单
                        let halfIndex = Math.floor(mainMenus.length / 2)
                        renderTpl("featureMenu-430000-template", "featureMenu-dom-left", mainMenus.slice(0, halfIndex));
                        renderTpl("featureMenu-430000-template", "featureMenu-dom-right", mainMenus.slice(halfIndex, mainMenus.length));

                        // 挂载移入移出事件
                        $('.custom-header-menu').mouseenter(function (e) {
                            $(e.currentTarget.children[2]).css('display', 'block')
                        })
                        $('.custom-header-menu').mouseleave(function (e) {
                            $(e.currentTarget.children[2]).css('display', 'none')
                        })

                        // 构建更新列表
                        buildUpdateViewIdListByIsOpenNewPage(mainMenus);
                    } else {
                        let featureData = menuPermissions.find(e => e.code === headerCode)
                        tempFeatureDataName = featureData.name;
                        if (featureData.children && featureData.children.length > 0) {
                            let renderData = featureData.children;

                            addExtraProperty(renderData);

                            // 渲染下拉菜单
                            let halfIndex = Math.floor(renderData.length / 2)
                            renderTpl("featureMenu-430000-template", "featureMenu-dom-left", renderData.slice(0, halfIndex));
                            renderTpl("featureMenu-430000-template", "featureMenu-dom-right", renderData.slice(halfIndex, renderData.length));

                            // 挂载移入移出事件
                            $('.custom-header-menu').mouseenter(function (e) {
                                $(e.currentTarget.children[2]).css('display', 'block')
                            })
                            $('.custom-header-menu').mouseleave(function (e) {
                                $(e.currentTarget.children[2]).css('display', 'none')
                            })

                            // 构建更新列表
                            buildUpdateViewIdListByIsOpenNewPage(renderData);
                        }

                        $(".home-btn").on("click", () => {
                            temporaryRemoveIframeHierarchy();
                            window.location.href = location.origin + "/" + location.pathname.split("/")[1];
                        });
                    }

                    // 构建更新菜单列表
                    function buildUpdateViewIdListByIsOpenNewPage(menuDataList) {
                        menuDataList.forEach((menuData)=> {
                            let isOpenNewPage = menuData.openNewPage;
                            let id = menuData.id;
                            if (!isOpenNewPage && isOpenNewPage !== null) {
                                updateViewIdList.push(id);
                            }
                            if (menuData.children && menuData.children.length > 0) {
                                menuData.children.forEach((children)=> {
                                    let isOpenNewPage = children.openNewPage;
                                    let id = children.id;
                                    if (!isOpenNewPage && isOpenNewPage !== null) {
                                        updateViewIdList.push(id);
                                    }
                                })
                            }
                        })
                    }
                }
                /**
                 * 渲染用户功能
                 */
                function initUserFunction() {
                    const formatUserInfo = {
                        userName: userName,
                        operateList: UserInfoData.children
                    }
                    // 渲染用户信息
                    if (!isExternal){
                        renderTpl("userInfo-430000-template", "userInfo-dom", formatUserInfo);
                        // 挂载移入移出事件
                        $('#userInfo-dom').mouseenter(function (e) {
                            $(e.currentTarget.children[0].children[1]).css('display', 'block')
                        })
                        $('#userInfo-dom').mouseleave(function (e) {
                            $(e.currentTarget.children[0].children[1]).css('display', 'none')
                        })
                    }

                    let ifShowTodo = false
                    renderApprovalTaskCount();
                    renderMyMessageCount();

                    /**
                     * 处理我的代办数量
                     */
                    function renderApprovalTaskCount() {
                        let count = 0;
                        try {
                            getDataToServer('/ui/applyTask/queryApprovalTaskCount', '', function (result) {
                                if (result.success && result.data) {
                                    count = result.data;
                                    if (count > 0) {
                                        ifShowTodo = true
                                        $('.toDoListNumber').text(count);
                                        $('.toDoListNumber').removeClass('noShow');
                                        $('.wtBadgeToDo').removeClass('noShow');
                                    }

                                    if (!ifShowTodo){
                                        $('.wtBadgeToDo').addClass('noShow');
                                    }
                                }
                            })
                        } catch (e) {
                            console.log('代办事项数量获取失败！')
                        }
                    }

                    function renderMyMessageCount() {
                        let count = 0;
                        try {
                            getDataToServer('/ui/message/getUnReadMessageNumber', '', function (result) {
                                if (result.success && result.data) {
                                    count = result.data;
                                    if (count > 0) {
                                        $('.toReadListNumber').text(count);
                                        $('.toReadListNumber').removeClass('noShow');
                                    }
                                }
                            },false)
                        } catch (e) {
                            console.log('未阅读消息数量获取失败！')
                        }
                    }
                }
            }

            // 设置头部选中样式
            window.custom_setHeaderChecked = function (code) {}

            // 获取配置项数据
            function getConfigurationData(homeConfiguration, key) {
                if (homeConfiguration && (!isEmpty(homeConfiguration[key]))) {
                    return homeConfiguration[key];
                } else {
                    return null;
                }
            }
            // 用户能力点击事件
            function onUserFunction(domData) {
                let name = domData.getAttribute("data-name");
                if (name === "注销") {
                    sessionStorage.clear()
                    deleteCookie("tip_proxy_token");
                    deleteCookie("SCPTOKEN");
                    if (isMainHeader && isDropDownMenuStr === "true") {
                        window.location.replace(domData.children[0].getAttribute("href"))
                    }
                } else {
                    if (isMainHeader && isDropDownMenuStr === "true") {
                        if (domData.getAttribute("is-open-new-page") === 'true') {
                            temporaryRemoveIframeHierarchy();
                            window.customOpen(domData.children[0].getAttribute("href"))
                        } else {
                            $('#iframe-main').attr("src", domData.children[0].getAttribute("href"));
                        }
                    }
                }
            }
            // 菜单点击事件（下拉模式）
            function onMenuClickOfDrop(that) {
                if (isMainHeader) {
                    let hasAuth = that.getAttribute('has-auth');
                    if (hasAuth === 'true' || that.getAttribute('data-code') === 'resource_portal') {
                        const id = that.id;

                        const urlObj = menuIdToUrlObjMapping[id]; // 菜单地址对象
                        const url = urlObj.url; // 菜单地址（必有）
                        const homeUrl = urlObj.homeUrl; // 菜单子页地址（非必有）

                        // 判断是刷新还是打开新页面
                        if (updateViewIdList.includes(id)) {
                            // 如果没有内容页地址则无法当前页刷新
                            if (!homeUrl) {
                                layerMsg.warn("尝试当前页刷新但无内容页地址配置，请检查菜单相关配置")
                                return;
                            }

                            // 设置iframe层级记忆
                            setHierarchyValueByIdOfTrigger(homeUrl);

                            // 修改iframe地址
                            document.getElementById(iframeId).src = homeUrl;
                        } else {
                            // 临时清空Hierarchy存储
                            temporaryRemoveIframeHierarchy();

                            // 打开新页面
                            window.customOpen(url);
                        }
                    } else {
                        layui.layer.msg('无系统权限，请向管理员申请！', {time: 2000, icon: 4});
                    }
                } else {
                    const id = that.id;
                    const urlObj = menuIdToUrlObjMapping[id]; // 菜单地址对象
                    const url = urlObj.url; // 菜单地址（必有）
                    const homeUrl = urlObj.homeUrl; // 菜单子页地址（非必有）
                    // 判断是刷新还是打开新页面
                    if (updateViewIdList.includes(id)) {
                        // 设置iframe层级记忆
                        setHierarchyValueByIdOfTrigger(url);

                        // 修改iframe地址
                        document.getElementById(iframeId).src = url;
                    } else {
                        // 临时清空Hierarchy存储
                        temporaryRemoveIframeHierarchy();

                        // 打开新页面
                        window.customOpen(url);
                    }
                }
            }
            // 菜单子节点点击事件（下拉模式）
            function onMenuChildrenClickOfDrop(that) {
                let hasAuth = that.getAttribute('has-auth');
                if (hasAuth === 'true' || that.getAttribute('data-code') === 'resource_portal') {
                    const id = that.id;

                    const urlObj = menuIdToUrlObjMapping[id]; // 菜单地址对象
                    const url = urlObj.url; // 菜单地址（必有）
                    // 判断是刷新还是打开新页面
                    if (updateViewIdList.includes(id)) {
                        // 设置iframe层级记忆
                        setHierarchyValueByIdOfTrigger(url);

                        // 修改iframe地址
                        document.getElementById(iframeId).src = url;
                    } else {
                        // 临时清空Hierarchy存储
                        temporaryRemoveIframeHierarchy();

                        // 打开新页面
                        window.customOpen(url);
                    }
                } else {
                    layui.layer.msg('无系统权限，请向管理员申请！', {time: 2000, icon: 4});
                }
            }

            // 我的代办点击事件
            function toDoClick(dom) {
                let isOpenNewStr = dom.getAttribute("data-openNew");

                let setFilterContentData = {
                    status: {
                        title: "待审核",
                        value: "UNCHECKED"
                    }
                }
                sessionStorage.setItem("functionDomId", "self-approval-task");
                sessionStorage.setItem("setFilterContentData", JSON.stringify(setFilterContentData));
                if (isOpenNewStr === "false" && isDropDownMenuStr === "true") {
                    $('#iframe-main').attr("src", "/tip-portal/index-self");
                } else {
                    temporaryRemoveIframeHierarchy();
                    window.customOpen(resBaseUrl + '/external-header-index?url=/tip-portal/index-self&headTitle=个人中心')
                }
            }
            // 用户设置点击事件
            function onClickUserSetting(dom) {
                let isOpenNewStr = dom.getAttribute("data-openNew");
                sessionStorage.setItem("functionDomId", "self-account-manage");
                if (isOpenNewStr === "false" && isDropDownMenuStr === "true") {
                    $('#iframe-main').attr("src", "/tip-portal/index-self");
                } else {
                    temporaryRemoveIframeHierarchy();
                    window.customOpen(resBaseUrl + '/external-header-index?url=/tip-portal/index-self&headTitle=个人中心')
                }
            }
            function toReadClick(dom) {
                let isOpenNewStr = dom.getAttribute("data-openNew");
                sessionStorage.setItem("functionDomId", "self-message-manage");
                sessionStorage.setItem('self-message-manage-filter', JSON.stringify({isRead: "false"}))
                if (isOpenNewStr === "false" && isDropDownMenuStr === "true") {
                    $('#iframe-main').attr("src", "/tip-portal/index-self");
                } else {
                    temporaryRemoveIframeHierarchy();
                    window.customOpen(resBaseUrl + '/external-header-index?url=/tip-portal/index-self&headTitle=个人中心')
                }
            }
        </script>
    <#else>
        <div class="gtmapHeader-portal ${headerStyle}"  id="${headDisplayStyle!"portal-header"}">
            <div class="header-box">
                <a href="/tip-portal/checkSafe"></a>
                <#--标题栏-->
                <div class="title-block-box blank-box" id="titleBlock-dom"></div>

                <#--功能菜单-->
                <div class="tab-group-box" id="featureMenu-dom"></div>

                <#--用户信息-->
                <div class="user-operate-box" id="userInfo-dom"></div>

                <#-- 支持电话 -->
                <div id="supportTelephone">
                    <span class="iconfont icon-phone icon"></span>
                    <span class="text-box">
                        <div class="description"></div>
                        <div class="telephone"></div>
                    </span>
                </div>
            </div>
        </div>
        <#--逻辑代码-->
        <script type="text/javascript">
            const isMainHeader = ${isMainHeader?string("true", "false")};
            const isExternal = ${isExternal?string("true", "false")};
            const headerCode = "${headerCode!"index"}";
            const iframeId = "${iframeId!"iframe-main"}";
            const extraReturnPortalStr = "${extraReturnPortal!"false"}";
            const isDropDownMenuStr = "${isDropDownMenu!"false"}"
            const isShowTitleFirstMenuStr = "${isShowTitleFirstMenu!"false"}"
            const extraReturnPortalBol = extraReturnPortalStr === "true";
            const isNoMainHeaderBackgroundPicture = ${isNoMainHeaderBackgroundPicture?string("true", "false")}
            const indexUrl = "${indexUrl!"index"}";
            const rootDomId = "${headDisplayStyle!"portal-header"}";
            let globalRegionCodeInHeader = "${globalRegionCode!""}";

            let cssSelectStr = (isMainHeader && isDropDownMenuStr === "true") ? 'borderBottomActive' : 'active';
            let menuCodeToIdMapping = {};
            let menuUrlToIdMapping = {}; // 菜单地址对id的映射
            let menuChildrenIdToParentIdMapping = {}; // 菜单子菜单ID到父菜单ID
            let menuUrlToNameMapping = {}; // 菜单地址对名称的映射
            let menuIdToUrlObjMapping = {}; // 菜单id对地址对象的映射
            let portalIndexHomeUrl = null;
            let authIdListOfMain = [];
            let updateViewIdList = []; // 更新页面ID列表（不在数组里面的ID为打开新页面）
            let homeTitleMode = "pieceMode"; // 标题展示模式

            initMacroOfGtMapHeader();

            // 根据iframe地址选中菜单
            window.custom_iframeSrcChanged = function (iframeUrl) {
                // 当新地址是完整地址时
                let domId = null;
                for (let url in menuUrlToIdMapping) {
                    if (iframeUrl.includes(url)) {
                        domId =  menuUrlToIdMapping[url];
                    }
                }

                // 设置副标题
                let menuName;
                for (let url in menuUrlToNameMapping) {
                    if (iframeUrl.includes(url)) {
                        menuName =  menuUrlToNameMapping[url];
                    }
                }
                if (menuName && isDropDownMenuStr === "true") {
                    changeSecondOfHeader(menuName);
                }

                // 修改点击效果
                let parentId = menuChildrenIdToParentIdMapping[domId];
                let dom;
                if (parentId) {
                    dom = document.getElementById(parentId);
                } else {
                    dom = document.getElementById(domId);
                }

                changeCheckStyle(dom);
            }

            function initMacroOfGtMapHeader() {
                // ------+ 准备初始数据 +--------
                // 组织数据（功能选项卡和用户信息）
                let menuPermissions; // 用户菜单信息
                let userName; // 用户名称
                let UserInfoData; // 用户菜单信息
                let homeConfiguration; // 主页配置项（用于渲染标题栏）
                let firstMenuPermissions; // 一级菜单
                let externalHeadTitle; // 额外头部读取的副标题
                try {
                    menuPermissions = userPermissions.menuPermissions;
                    userName = userPermissions.userInfo.alias;
                    externalHeadTitle = userPermissions.externalHeadTitle;
                    homeConfiguration = userPermissions.homeConfiguration;
                    if (homeConfiguration.globalRegionCode && homeConfiguration.globalRegionCode !== "") {
                        globalRegionCodeInHeader = homeConfiguration.globalRegionCode
                    }
                    UserInfoData = userPermissions.userMenuPermissions;
                    firstMenuPermissions = userPermissions.firstMenuPermissions || []
                    if (globalRegionCodeInHeader === "320000") {
                        firstMenuPermissions = firstMenuPermissions.filter(o => o.code !== "self_center")
                    }
                } catch (error) {
                    console.log("用户权限信息获取失败！" + error);
                    alert("用户权限信息获取失败！");
                }
                authIdListOfMain = [];
                let tempFeatureDataName; // 临时功能数据（用于当非主页面头部时获取副标题）
                let initialSecondTitle = "首页"; // 副标题地址
                // ----------+ 渲染标题内容 +--------
                initTitleContent(firstMenuPermissions, menuPermissions, externalHeadTitle);
                // ----------+ 渲染菜单内容 +--------
                if (menuPermissions) {
                    initMenuContent();
                }
                // ----------+ 渲染用户功能 +--------
                initUserFunction();
                // ----------+ websocket链接 +-------
                initWebsocket();
                // ----------+ 设置cookie +-------
                initCookie();
                // ----------+ 公共方法 +-----------
                /**
                 * 渲染数据添加额外属性（extraClass）
                 * @param data
                 */
                function addExtraProperty(data) {
                    data.map((per, index)=> {
                        // 设置首页iframe地址
                        let tempCustomConfig = getMenuCustomConfig(per);
                        if (per.code === "resource_portal" && tempCustomConfig) {
                            portalIndexHomeUrl = tempCustomConfig.homeUrl || "template?href=portal/home";
                            menuUrlToNameMapping[portalIndexHomeUrl] = "首页";
                        }

                        // 补充自定义地址参数
                        if(tempCustomConfig && tempCustomConfig.urlParams && per.url) {
                            per.url = addParamsToURL(per.url, tempCustomConfig.urlParams);
                        }

                        menuIdToUrlObjMapping[per.id] = {
                            url: per.url,
                            homeUrl: tempCustomConfig ? tempCustomConfig.homeUrl : null,
                            customConfig: tempCustomConfig
                        }

                        // 记录地址与id和名称的对应关系
                        // 记录编码和id的对应关系（用于外部设置选中状态）
                        menuCodeToIdMapping[per.code] = per.id;
                        if (per.openNewPage) {
                            menuUrlToIdMapping[per.url] = per.id;
                            menuUrlToNameMapping[per.url] = per.name;
                        } else {
                            menuUrlToIdMapping[tempCustomConfig.homeUrl] = per.id;
                            menuUrlToNameMapping[tempCustomConfig.homeUrl] = per.name;
                        }
                        menuUrlToNameMapping[per.url] = per.name;
                        if (per.children && per.children.length > 0) {
                            per.children.forEach(e => {
                                let tempCustomConfigOfChildren = getMenuCustomConfig(e);
                                // 补充自定义地址参数
                                if(tempCustomConfigOfChildren && tempCustomConfigOfChildren.urlParams && e.url) {
                                    e.url = addParamsToURL(e.url, tempCustomConfigOfChildren.urlParams);
                                }

                                menuChildrenIdToParentIdMapping[e.id] = per.id;
                                // 如果为下拉菜单记录父辈ID
                                if (isDropDownMenuStr === "true") {
                                    menuUrlToIdMapping[e.url] = per.id;
                                } else {
                                    menuUrlToIdMapping[e.url] = e.id;
                                }
                                menuUrlToNameMapping[e.url] = e.name;
                                menuCodeToIdMapping[e.code] = e.id;
                                menuIdToUrlObjMapping[e.id] = {
                                    url: e.url,
                                    homeUrl: null
                                }
                                if (e.code === "resource_manage_home" || e.code === "resource_share_home") {
                                    menuUrlToNameMapping[e.url] = per.name;
                                }
                            })
                        }

                        // 额外class设置
                        per.extraClass = "";
                        if (index === 0) {
                            per.extraClass = cssSelectStr;
                        }
                        return per;
                    })

                    /**
                     * 获取菜单数据的自定义配置
                     * @param menuData
                     * @returns {null}
                     */
                    function getMenuCustomConfig(menuData) {
                        let customConfigStr = menuData.customCfg;
                        let returnConfig;
                        try {
                            returnConfig = JSON.parse(customConfigStr);
                        } catch (e) {
                            returnConfig = null;
                        }
                        return returnConfig;
                    }
                }

                /**
                 * 根据ifShowInHeader为false过滤调头部菜单
                 */
                function filterIfShowFalse(treeArray) {
                    return treeArray.filter(node => {
                        let ifShow = JSON.parse(node.customCfg).hasOwnProperty("ifShowInHeader") && !JSON.parse(node.customCfg)["ifShowInHeader"];
                        if (!ifShow) {
                            // 如果当前节点符合条件，则递归过滤其子节点
                            if (node.children && node.children.length > 0) {
                                node.children = filterIfShowFalse(node.children);
                            }
                            return true;
                        } else {
                            // 如果当前节点不符合条件，则递归过滤掉其子节点并返回 false
                            if (node.children && node.children.length > 0) {
                                node.children = filterIfShowFalse(node.children);
                                return false;
                            }
                            return false;
                        }
                    });
                }
                /**
                 * 初始化websocket链接
                 */
                function initWebsocket() {
                    iziToast.settings({
                        timeout: 10000,
                        pauseOnHover: true,
                        close: true,
                        progressBar: true,
                        layout: 1,
                    });
                    let msgCallBack = function(msgData){
                        let message = JSON.parse(msgData.data)
                        iziToast.info({
                            title: messageBusinessType[message.msgBusType],
                            message: message.msgContent,
                            maxWidth: '300px',
                            position: 'bottomRight',
                            transitionIn: 'bounceInRight',
                            icon: messageTypeIcon[message.msgType],
                            balloon: true
                        });
                    }
                    webSocketLink(userPermissions.userInfo.username,msgCallBack);
                }
                /**
                 * 初始化cookie
                 */
                function initCookie(){
                    //设置cookie，60分钟有效期
                    let token = getUserPermissions().userInfo.token;
                    setCookie('tip_proxy_token', token);
                    setCookie('SCPTOKEN', token, {time: 200000, path : "/scp-storage"});
                }
                /**
                 * 渲染标题内容
                 */
                function initTitleContent(firstMenuPermissions, menuPermissions, externalHeadTitle) {
                    // 设置主次菜单class名称、背景图片
                    let templateId;
                    let renderData = {};
                    homeTitleMode = getConfigurationData(homeConfiguration, "homeTitleMode"); // 标题模式

                    let mainDom = document.getElementById(rootDomId);
                    let homeTitleBgImg; // 标题背景图

                    // 根据主副标题设置class和背景图
                    if (isMainHeader && !isNoMainHeaderBackgroundPicture) {
                        mainDom.children[0].classList.add("primary-header");
                        if (isEmpty(getConfigurationData(homeConfiguration, "homeTitleBgImg"))){
                            homeTitleBgImg = 'images/replaceable/homeTitleBgImg.png'
                        } else {
                            homeTitleBgImg = parseImgUrl(getConfigurationData(homeConfiguration, "homeTitleBgImg"));
                        }
                    } else {
                        mainDom.children[0].classList.add("secondary-header");
                        if (isEmpty(getConfigurationData(homeConfiguration, "homeTitleExBgImg"))){
                            homeTitleBgImg = 'images/replaceable/homeTitleExBgImg.png'
                        }else {
                            homeTitleBgImg = parseImgUrl(getConfigurationData(homeConfiguration, "homeTitleExBgImg"));
                        }
                    }
                    mainDom.style.backgroundImage = "url(" + homeTitleBgImg + ")";

                    // 根据不同模式
                    if (homeTitleMode === "imageMode") {
                        templateId = "titleBlock-image-template";
                        // 对于每个中心读取自己的图片标题
                        switch (headerCode) {
                            case "resource_manage_center":
                                if (isEmpty(getConfigurationData(homeConfiguration, "manageTitleImage"))){
                                    renderData["homeTitleImage"] = 'images/replaceable/manageTitleImage.png'
                                }else {
                                    renderData["homeTitleImage"] = parseImgUrl(getConfigurationData(homeConfiguration, "manageTitleImage"));
                                }
                                break
                            case "resource_share_center":
                                if (isEmpty(getConfigurationData(homeConfiguration, "shareTitleImage"))){
                                    renderData["homeTitleImage"] = 'images/replaceable/shareTitleImage.png'
                                }else {
                                    renderData["homeTitleImage"] = parseImgUrl(getConfigurationData(homeConfiguration, "shareTitleImage"));
                                }
                                break
                            default:
                                if (isEmpty(getConfigurationData(homeConfiguration, "homeTitleImage"))){
                                    renderData["homeTitleImage"] = 'images/replaceable/homeTitleImage.png'
                                }else {
                                    renderData["homeTitleImage"] = parseImgUrl(getConfigurationData(homeConfiguration, "homeTitleImage"));
                                }
                                break
                        }
                    } else if (homeTitleMode === "pieceMode") {
                        templateId = "titleBlock-piece-template";
                        if (isEmpty(getConfigurationData(homeConfiguration, "homeTitleIcon"))){
                            renderData["homeTitleIcon"] = 'images/replaceable/homeTitleIcon.png'
                        }else {
                            renderData["homeTitleIcon"] = parseImgUrl(getConfigurationData(homeConfiguration, "homeTitleIcon")) ;
                        }
                        renderData["homeTitlePriText"] = getConfigurationData(homeConfiguration, "homeTitlePriText");
                        renderData["homeTitleEnText"] = getConfigurationData(homeConfiguration, "homeTitleEnText");
                    }
                    if (homeTitleMode === "pieceMode" && !isMainHeader && (!isEmpty(tempFeatureDataName))) {
                        renderData["homeTitleSecText"] = "-" + tempFeatureDataName;
                    }
                    // 渲染标题栏
                    renderTpl(templateId, "titleBlock-dom", renderData);

                    // 挂载标题点击事件
                    let portalTitleDom = document.getElementById("portal-title");
                    if (portalTitleDom && !isMainHeader) {
                        portalTitleDom.classList.add("cursor-pointer-box");
                        portalTitleDom.addEventListener("click", function (event) {
                            removeIframeHierarchy();
                            window.location.href = indexUrl;
                        })
                    }
                    // 渲染副标题文字
                    if (isMainHeader && isDropDownMenuStr === "true") {
                        let extraDom = document.getElementById("drop-down-extra");
                        if (extraDom){
                            $(extraDom).removeClass("noShow")
                            extraDom.style.display = "contents";
                        }
                        changeSecondOfHeader(initialSecondTitle);
                    } else {
                        if (document.getElementById("userAlias")) {
                            document.getElementById("userAlias").style.fontWeight = "unset";
                        }
                    }


                    if (isExternal) {
                        $("#no-drop-down-extra-name").text(externalHeadTitle)
                        $("#no-drop-down-extra").css('display', 'flex')
                        if (externalHeadTitle) {
                            document.title = externalHeadTitle
                        }
                    }
                if (isExternal) {
                    $("#no-drop-down-extra-name").text(externalHeadTitle)
                    $("#no-drop-down-extra").css('display', 'flex')
                    if (externalHeadTitle) {
                        document.title = externalHeadTitle
                    }
                    if (globalRegionCodeInHeader !== "320000") {
                        $("#no-drop-down-extra-icon").css('font-size', '18px');
                        $("#no-drop-down-extra-name").css('font-size', '15px');
                    }
                }

                    // 不为主页且不为额外头部页面，进行下拉菜单渲染
                    if (!isMainHeader && !isExternal && isShowTitleFirstMenuStr === "true") {
                        let currentMenuName = menuPermissions[0].name
                        if (!isEmpty(firstMenuPermissions)) {
                            renderTpl('no-drop-down-extra-list-template', 'no-drop-down-extra-list-dom', firstMenuPermissions)
                        }
                        $("#no-drop-down-extra-name").text(currentMenuName)
                        // 挂载移入移出事件
                        $('#no-drop-down-extra').mouseenter(function (e) {
                            $('#no-drop-down-extra-list-dom').css('display', 'block')
                        })
                        $('#no-drop-down-extra').mouseleave(function (e) {
                            $('#no-drop-down-extra-list-dom').css('display', 'none')
                        })
                        $("#no-drop-down-extra").css('display', 'flex')


                        firstMenuPermissions.forEach(item => {
                            if (currentMenuName === item.name) {
                                let customCfg = JSON.parse(item.customCfg)
                                if (customCfg.icon) {
                                    $("#no-drop-down-extra-icon").removeClass("model-icon iconfont icon-dingweixiao").addClass("model-icon iconfont " + customCfg.icon)
                                }
                                if (customCfg.iconColor) {
                                    $("#no-drop-down-extra-icon").css('color', customCfg.iconColor)
                                }
                            }
                        })
                        // todo
                    }
                }
                /**
                 * 渲染菜单内容
                 */
                function initMenuContent() {

                    // 增加额外信息
                    addExtraProperty(menuPermissions);

                    // 是否为主头部判别
                    if (isMainHeader) {
                        let mainMenus = filterIfShowFalse(menuPermissions);
                        if (isDropDownMenuStr === "true") {
                            // 去除首页子项内容
                            mainMenus.map(e => {
                                if (e.code === 'resource_portal') {
                                    e.children = [];
                                }
                            })

                            // 渲染下拉菜单
                            initialSecondTitle = mainMenus[0].name;
                            renderTpl("featureMenu-dropDown-template", "featureMenu-dom", mainMenus);

                            // 挂载移入移出事件
                            $('.topMenu').mouseenter(function (e) {
                                $(e.currentTarget.children[2]).css('display', 'block')
                            })
                            $('.topMenu').mouseleave(function (e) {
                                $(e.currentTarget.children[2]).css('display', 'none')
                            })
                        } else {
                            // 获取有权菜单
                            authIdListOfMain = getValueListOfObjList(mainMenus.filter(e => e.hasAuth), "id");

                            // 渲染菜单
                            renderTpl("featureMenu-template", "featureMenu-dom", mainMenus);
                        }

                        // 构建更新列表
                        buildUpdateViewIdListByIsOpenNewPage(mainMenus);
                    } else {
                        let featureData = menuPermissions.find(e=>e.code === headerCode)
                        tempFeatureDataName = featureData.name;
                        if (featureData.children && featureData.children.length > 0) {
                            let renderData = featureData.children;

                            // 返回首页按钮
                            if (extraReturnPortalBol) {
                                let id = "extra-return-portal";
                                updateViewIdList.push(id);
                                renderData.push({
                                    "clientId": "tipMenu_portal",
                                    "code": "resource_portal",
                                    "customCfg": "{\"homeUrl\":\"template?href=portal/home\",\"title\":\"国土基础信息平台\"}",
                                    "description": "portal首页",
                                    "hasAuth": true,
                                    "icon": "",
                                    "id": id,
                                    "name": "门户首页",
                                    "sequenceNumber": 0,
                                    "type": "menu",
                                    "url": indexUrl,
                                    "extraClass": cssSelectStr
                                })
                            }
                            addExtraProperty(renderData);

                            // 构建更新列表
                            buildUpdateViewIdListByIsOpenNewPage(renderData);
                            renderTpl("featureMenu-template", "featureMenu-dom", renderData);
                        }
                    }

                    // 根据iframe层级记忆设置选中头部
                    let tempHierarchyValue = getHierarchyValueById("iframe-main");
                    let domId = tempHierarchyValue ? menuUrlToIdMapping[tempHierarchyValue] : null;
                    if (domId) {
                        changeCheckStyle(document.getElementById(domId));
                    }
                    let menuName = tempHierarchyValue ? menuUrlToNameMapping[tempHierarchyValue] : null;
                    if (menuName && isDropDownMenuStr === "true") {
                        changeSecondOfHeader(menuName);
                    }

                    // 构建更新菜单列表
                    function buildUpdateViewIdListByIsOpenNewPage(menuDataList) {
                        menuDataList.forEach((menuData)=> {
                            let isOpenNewPage = menuData.openNewPage;
                            let id = menuData.id;
                            if (!isOpenNewPage && isOpenNewPage !== null) {
                                updateViewIdList.push(id);
                            }
                            if (menuData.children && menuData.children.length > 0) {
                                menuData.children.forEach((children)=> {
                                    let isOpenNewPage = children.openNewPage;
                                    let id = children.id;
                                    if (!isOpenNewPage && isOpenNewPage !== null) {
                                        updateViewIdList.push(id);
                                    }
                                })
                            }
                        })
                    }
                }
                /**
                 * 渲染用户功能
                 */
                function initUserFunction() {
                    const formatUserInfo = {
                        userName: userName,
                        operateList: UserInfoData.children
                    }
                    // 渲染用户信息
                    if (!isExternal){
                        if (isMainHeader && isDropDownMenuStr === "true") {
                            renderTpl("userInfo-white-background-template", "userInfo-dom", formatUserInfo);
                        } else {
                            renderTpl("userInfo-template", "userInfo-dom", formatUserInfo);
                        }
                    }

                    let ifShowTodo = false
                    renderApprovalTaskCount();
                    renderMyMessageCount();

                    // 渲染支持电话
                    if (!isEmpty(getConfigurationData(homeConfiguration, "supportTelephone"))) {
                        // 初始化数据
                        let tempSupportTelephoneText = getConfigurationData(homeConfiguration, "supportTelephone");
                        let splitArray = tempSupportTelephoneText.split("|");
                        let labelText = "";
                        let valueText = "";

                        // 放分割字符串超过1时自定义label
                        if (splitArray.length > 1) {
                            labelText = splitArray[0] + "：";
                            valueText = splitArray[1];
                        } else {
                            labelText = "技术支持";
                            valueText = splitArray[0];
                        }

                        // 渲染dom
                        $("#supportTelephone").css("display", "flex");
                        $("#userInfo-dom .gtmap-user").css("padding-right","unset");
                        $("#supportTelephone .description").text(labelText);
                        $("#supportTelephone .telephone").text(valueText);
                    }

                    /**
                     * 处理我的代办数量
                     */
                    function renderApprovalTaskCount() {
                        let count = 0;
                        try {
                            getDataToServer('/ui/applyTask/queryApprovalTaskCount', '', function (result) {
                                if (result.success && result.data) {
                                    count = result.data;
                                    if (count > 0) {
                                        ifShowTodo = true
                                        $('.toDoListNumber').text(count);
                                        $('.toDoListNumber').removeClass('noShow');
                                        $('.wtBadgeToDo').removeClass('noShow');
                                    }

                                    if (!ifShowTodo){
                                        $('.wtBadgeToDo').addClass('noShow');
                                    }
                                }
                            })
                        } catch (e) {
                            console.log('代办事项数量获取失败！')
                        }
                    }

                    function renderMyMessageCount() {
                        let count = 0;
                        try {
                            getDataToServer('/ui/message/getUnReadMessageNumber', '', function (result) {
                                if (result.success && result.data) {
                                    count = result.data;
                                    if (count > 0) {
                                        $('.toReadListNumber').text(count);
                                        $('.toReadListNumber').removeClass('noShow');
                                    }
                                }
                            },false)
                        } catch (e) {
                            console.log('未阅读消息数量获取失败！')
                        }
                    }
                }
            }

            // 设置头部选中样式
            window.custom_setHeaderChecked = function (code) {
                let domId = menuCodeToIdMapping[code];
                let dom = document.getElementById(domId);
                if (dom) {
                    changeCheckStyle(dom);
                }
            }
            // 渲染头部选择样式（查询目录文件所属关系表，进行映射选择）
            function renderHeaderStyle() {
                let topMenuDomList = document.getElementsByClassName("topMenu");
                let iframeUrl = sessionStorage.getItem("iframeUrl");
                if ((!isMainHeader) && iframeUrl) {
                    for (let i = 0; i < topMenuDomList.length; i++) {
                        let topMenuDom = topMenuDomList[i];
                        let dataUrl = topMenuDom.getAttribute("data-url");
                        let iframeUrlSnippetList = iframeUrl.split("/");
                        let dataUrlSnippetList = dataUrl.split("/");
                        let iframeFtl = iframeUrlSnippetList[iframeUrlSnippetList.length - 1];
                        if (iframeFtl.indexOf("&") !== -1) {
                            iframeFtl = iframeFtl.slice(0,iframeFtl.indexOf("&"))
                        }
                        let fileRelationList = fileRelation[dataUrlSnippetList[dataUrlSnippetList.length - 1]] || [];
                        if (iframeUrl === dataUrl || (fileRelationList.findIndex(e => e === iframeFtl) !== -1)) {
                            changeCheckStyle(topMenuDom);
                            break;
                        }
                    }
                }
            }
            // 菜单点击事件(非下拉模式)
            function onMenuClick (viewDom) {
                const id = viewDom.id;

                const urlObj = menuIdToUrlObjMapping[id]; // 菜单地址对象
                const url = urlObj.url; // 菜单地址（必有）
                const homeUrl = urlObj.homeUrl; // 菜单子页地址（非必有）

                // 改变选中样式
                changeCheckStyle(viewDom);

                // 判断是否为主头部（主头部会判断菜单权限，在当前页打开菜单采用homeUrl;非主头部在当前页打开菜单采用url）
                if (isMainHeader) {
                    // 判断权限
                    if (authIdListOfMain.findIndex(e => e === id) === -1) {
                        layui.layer.msg('无系统权限，请向管理员申请！', {time: 2000, icon: 4});
                        return;
                    }

                    // 判断是刷新还是打开新页面
                    if (updateViewIdList.includes(id)) {
                        // 如果没有内容页地址则无法当前页刷新
                        if (!homeUrl) {
                            layerMsg.warn("尝试当前页刷新但无内容页地址配置，请检查菜单相关配置")
                            return;
                        }

                        // 设置iframe层级记忆
                        setHierarchyValueByIdOfTrigger(homeUrl);

                        // 修改iframe地址
                        document.getElementById(iframeId).src = homeUrl;
                    } else {
                        // 临时清空Hierarchy存储
                        temporaryRemoveIframeHierarchy();

                        // 打开新页面
                        window.customOpen(url);
                    }
                } else {
                    // 判断是刷新还是打开新页面
                    if (updateViewIdList.includes(id)) {
                        // 设置iframe层级记忆
                        setHierarchyValueByIdOfTrigger(url);

                        // 修改iframe地址
                        document.getElementById(iframeId).src = url;
                    } else {
                        // 临时清空Hierarchy存储
                        temporaryRemoveIframeHierarchy();

                        // 打开新页面
                        window.customOpen(url);
                    }
                }
            }
            // 修改选中状态
            function changeCheckStyle(viewDom) {
                if (!viewDom) {
                    return;
                }
                let liList = viewDom.parentElement.children;
                for (let i = 0; i < liList.length; i++) {
                    let perLi = liList[i];
                    perLi.classList.remove([cssSelectStr]);
                }
                viewDom.classList.add([cssSelectStr]);
            }
            // 获取配置项数据
            function getConfigurationData(homeConfiguration, key) {
                if (homeConfiguration && (!isEmpty(homeConfiguration[key]))) {
                    return homeConfiguration[key];
                } else {
                    return null;
                }
            }
            // 用户能力点击事件
            function onUserFunction(domData) {
                let name = domData.getAttribute("data-name");
                if (name === "注销") {
                    sessionStorage.clear()
                    deleteCookie("tip_proxy_token");
                    deleteCookie("SCPTOKEN");
                    if (isMainHeader && isDropDownMenuStr === "true") {
                        window.location.replace(domData.children[0].getAttribute("href"))
                    }
                } else {
                    if (isMainHeader && isDropDownMenuStr === "true") {
                        if (domData.getAttribute("is-open-new-page") === 'true') {
                            temporaryRemoveIframeHierarchy();
                            window.customOpen(domData.children[0].getAttribute("href"))
                        } else {
                            $('#iframe-main').attr("src", domData.children[0].getAttribute("href"));
                        }
                    }
                }
            }
            // 菜单点击事件（下拉模式）
            function onMenuClickOfDrop(that) {
                let hasAuth = that.getAttribute('has-auth');
                if (hasAuth === 'true' || that.getAttribute('data-code') === 'resource_portal') {
                    const id = that.id;

                    const urlObj = menuIdToUrlObjMapping[id]; // 菜单地址对象
                    const url = urlObj.url; // 菜单地址（必有）
                    const homeUrl = urlObj.homeUrl; // 菜单子页地址（非必有）

                    // 判断是刷新还是打开新页面
                    if (updateViewIdList.includes(id)) {
                        // 渲染选中样式
                        if (that.getAttribute('class') !== null && that.getAttribute('class').includes('topMenu')) {
                            changeCheckStyle(that)
                        } else {
                            changeCheckStyle(that.parentNode.parentNode.parentNode)
                        }

                        // 如果没有内容页地址则无法当前页刷新
                        if (!homeUrl) {
                            layerMsg.warn("尝试当前页刷新但无内容页地址配置，请检查菜单相关配置")
                            return;
                        }

                        // 设置iframe层级记忆
                        setHierarchyValueByIdOfTrigger(homeUrl);

                        // 修改iframe地址
                        document.getElementById(iframeId).src = homeUrl;

                        // 修改副标题（下拉模式下独有）
                        if (that.tagName.toLowerCase() === 'span' && that.getAttribute("data-name") === '首页' ) {
                            changeSecondOfHeader(that.parentElement.parentElement.parentElement.getAttribute('data-name'));
                        } else {
                            changeSecondOfHeader(that.getAttribute("data-name"));
                        }
                    } else {
                        // 临时清空Hierarchy存储
                        temporaryRemoveIframeHierarchy();

                        // 打开新页面
                        window.customOpen(url);
                    }
                } else {
                    // 甘肃地方确认是否申请权限 其他地方提示没有权限
                    if (globalRegionCodeInHeader === "620000") {
                        layui.layer.confirm('您尚未拥有【' + that.getAttribute('data-name') + '】菜单访问权限，是否进行申请？', {btnAlign: 'c', icon: 3}, function (index) {
                            layui.layer.close(index);
                            layui.layer.open({
                                type: 2,
                                title: '菜单权限申请',
                                skin: 'layer-ext-blue',
                                area: ['1000px', '469px'],
                                shade: 0.4,
                                moveType: 0,
                                content: '/tip-portal/functionApplyForm?applyContent='+ that.getAttribute('data-name') +'&functionCode=' + that.getAttribute('data-code') + "&applyType=MENU"
                            })
                        })
                    } else {
                        layui.layer.msg('无系统权限，请向管理员申请！', {time: 2000, icon: 4});
                    }
                }
            }
            // 菜单子节点点击事件（下拉模式）
            function onMenuChildrenClickOfDrop(that) {
                let hasAuth = that.getAttribute('has-auth');
                if (hasAuth === 'true' || that.getAttribute('data-code') === 'resource_portal') {
                    const id = that.id;

                    const urlObj = menuIdToUrlObjMapping[id]; // 菜单地址对象
                    const url = urlObj.url; // 菜单地址（必有）
                    // 判断是刷新还是打开新页面
                    if (updateViewIdList.includes(id)) {
                        // 渲染选中样式
                        if (that.getAttribute('class') !== null && that.getAttribute('class').includes('topMenu')) {
                            changeCheckStyle(that)
                        } else {
                            changeCheckStyle(that.parentNode.parentNode.parentNode)
                        }

                        // 设置iframe层级记忆
                        setHierarchyValueByIdOfTrigger(url);

                        // 修改iframe地址
                        document.getElementById(iframeId).src = url;

                        // 修改副标题（下拉模式下独有）
                        if (that.tagName.toLowerCase() === 'span' && that.getAttribute("data-name") === '首页' ) {
                            changeSecondOfHeader(that.parentElement.parentElement.parentElement.getAttribute('data-name'));
                        } else {
                            changeSecondOfHeader(that.getAttribute("data-name"));
                        }
                    } else {
                        // 临时清空Hierarchy存储
                        temporaryRemoveIframeHierarchy();

                        // 打开新页面
                        window.customOpen(url);
                    }
                } else {
                    // 甘肃地方确认是否申请权限 其他地方提示没有权限
                    if (globalRegionCodeInHeader === "620000") {
                        layui.layer.confirm('您尚未拥有【' + that.getAttribute('data-name') + '】菜单访问权限，是否进行申请？', {btnAlign: 'c', icon: 3}, function (index) {
                            layer.close(index);
                            layui.layer.open({
                                type: 2,
                                title: '菜单权限申请',
                                skin: 'layer-ext-blue',
                                area: ['1000px', '469px'],
                                shade: 0.4,
                                moveType: 0,
                                content: '/tip-portal/functionApplyForm?applyContent='+ that.getAttribute('data-name') +'&functionCode=' + that.getAttribute('data-code') + "&applyType=MENU"
                            })
                        })
                    } else {
                        layui.layer.msg('无系统权限，请向管理员申请！', {time: 2000, icon: 4});
                    }
                }
            }

            // 非下拉模式下标题后下拉菜单
            function onNoDropDownExtraMenuClick(that) {
                let url = $(that).attr('data-url')
                temporaryRemoveIframeHierarchy();
                window.customOpen(url)
                // todo 修改下拉菜单
            }
            // 我的代办点击事件
            function toDoClick(dom) {
                let isOpenNewStr = dom.getAttribute("data-openNew");

                let setFilterContentData = {
                    status: {
                        title: "待审核",
                        value: "UNCHECKED"
                    }
                }
                sessionStorage.setItem("functionDomId", "self-approval-task");
                sessionStorage.setItem("setFilterContentData", JSON.stringify(setFilterContentData));
                if (isOpenNewStr === "false" && isDropDownMenuStr === "true") {
                    $('#iframe-main').attr("src", "/tip-portal/index-self");
                } else {
                    temporaryRemoveIframeHierarchy();
                    window.customOpen(resBaseUrl + '/external-header-index?url=/tip-portal/index-self&headTitle=个人中心')
                }
            }

            /**
             * 账户设置点击事件
             * @param dom
             */
            function onClickUserSetting(dom) {
                let isOpenNewStr = dom.getAttribute("data-openNew");
                sessionStorage.setItem("functionDomId", "self-account-manage");
                if (isOpenNewStr === "false" && isDropDownMenuStr === "true") {
                    $('#iframe-main').attr("src", "/tip-portal/index-self");
                } else {
                    temporaryRemoveIframeHierarchy();
                    window.customOpen(resBaseUrl + '/external-header-index?url=/tip-portal/index-self&headTitle=个人中心')
                }
            }
            function toReadClick(dom) {
                let isOpenNewStr = dom.getAttribute("data-openNew");
                sessionStorage.setItem("functionDomId", "self-message-manage");
                sessionStorage.setItem('self-message-manage-filter', JSON.stringify({isRead: "false"}))
                if (isOpenNewStr === "false" && isDropDownMenuStr === "true") {
                    $('#iframe-main').attr("src", "/tip-portal/index-self");
                } else {
                    temporaryRemoveIframeHierarchy();
                    window.customOpen(resBaseUrl + '/external-header-index?url=/tip-portal/index-self&headTitle=个人中心')
                }
            }
            // 更改头部标题的副标题
            function changeSecondOfHeader(newName) {
                let modelDom = document.getElementById("modelName");
                let extraDom = document.getElementById("drop-down-extra");

                if (modelDom && extraDom && newName) {
                    document.getElementById("drop-down-extra").style.display = "contents";
                    document.getElementById("modelName").innerText = newName;
                } else if (extraDom) {
                    document.getElementById("drop-down-extra").style.display = "none";
                }
            }
        </script>


    </#if>

    <#--  头部样式文件  -->
    <@style path="css/macro/macro-gtmapHeader.css"/>
</#macro>

<#--通用标题面包屑-->
<#assign default_data_map = {"list":[{"title":"资源目录","href":"template?href=resource-manage-center/resource-list/resource-list"},{"title":"资源注册","href":"template?href=resource-manage-center/resource-register/resource-register"}],"cite":"资源编辑","citeHref":"template?href=resource-manage-center/resource-register/spatial-resource/resource-edit","title":"资源编辑","titleHref":"template?href=resource-manage-center/resource-register/spatial-resource/resource-edit","id":"edit"}>
<#macro nav data_map = default_data_map>
    <div class="nav-box">
        <#--当前页面标题-->
        <span class="box-title">
            <i class="title-icon iconfont icon-dingwei00"></i>
            <span class="title-text">${data_map.title}</span>
        </span>

        <#--面包屑列表-->
        <span class="box-nav layui-breadcrumb" lay-separator=">">
            <#list data_map.list as data>
                <a href=${data.href}>${data.title}</a>
                <span lay-separator="">&gt;</span>
            </#list>
            <a href="${data_map.citeHref}"><cite>${data_map.cite}</cite></a>
        </span>
    </div>
</#macro>

<#--通用列表标题面包屑-->
<#assign default_nav_list = [{"list":[{"title":"资源目录","href":"template?href=resource-manage-center/resource-list/resource-list"},{"title":"资源注册","href":"template?href=resource-manage-center/resource-register/resource-register"}],"cite":"资源注册","citeHref":"template?href=resource-manage-center/resource-register/interface-register","title":"资源注册","titleHref":"template?href=resource-manage-center/resource-register/interface-register","id":"register"},{"list":[{"title":"资源目录","href":"template?href=resource-manage-center/resource-list/resource-list"},{"title":"资源注册","href":"template?href=resource-manage-center/resource-register/resource-register"}],"cite":"资源编辑","citeHref":"template?href=resource-manage-center/resource-register/spatial-resource/resource-edit","title":"资源编辑","titleHref":"template?href=resource-manage-center/resource-register/spatial-resource/resource-edit","id":"edit"}]>
<#macro navList nav_list = default_nav_list>
    <div class="nav-box">
        <#list nav_list as nav>
            <div class="switch-nav-box" id=${"navList-" + nav.id} >
                <#--当前页面标题-->
                <span class="box-title">
                    <i class="title-icon iconfont icon-dingwei00"></i>
                    <span class="title-text">${nav.title}</span>
                </span>

                <#--面包屑列表-->
                <span class="box-nav layui-breadcrumb" lay-separator=">">
                    <#list nav.list as data>
                        <a href=${data.href}>${data.title}</a>
                        <span lay-separator="">&gt;</span>
                    </#list>
                    <a href="${nav.citeHref}"><cite>${nav.cite}</cite></a>
                </span>
            </div>
        </#list>
    </div>
    <script>
        function navList_switchNav(domId) {
            let navSwitchDomList = document.getElementsByClassName("switch-nav-box");
            for (let i = 0; i < navSwitchDomList.length; i++) {
                navSwitchDomList[i].style.display = "none"
            }
            if (domId) {
                let tempDomId = "navList-" + domId;
                let showNavDom = document.getElementById(tempDomId);
                showNavDom.style.display = "flex";
            } else {
                navSwitchDomList[0].style.display = "flex";
            }
        }
    </script>
</#macro>

<#--资源管理中心页面卡片-->
<#macro resourceViewCard data
                         nav_type = "simple"
                         head_img = "/images/index/zyzx-top-bg.png">
    <div class="view-card-box">
        <div class="card-head" style="background: url(${context_path + head_img});">
            <#if nav_type = "simple">
            <@nav data_map=data></@nav>
            <#else>
            <@navList nav_list=data></@navList>
            </#if>
        </div>
        <div class="card-body">
            <#nested />
        </div>
    </div>
</#macro>

<#--资源管理中心详情头部公用卡片-->
<#macro resourceDetailHeader showPreview = true
                             countTitle = '资源访问量'
                             isShowCount = true>
    <div class="zyzx-top">
        <div class="left-img">
            <@img></@img>
            <#if showPreview>
                <a class="activeClass">
                    <div class="img-div ">点击预览</div>
                </a>
            </#if>
        </div>
        <div class="right-box">
            <div style="position: relative">
                <p>
                    <span class="right-title">资源名称</span>
                    <span class="sign">文档资源</span>
                    <span class="resStatus-up noShow">在线</span>
                    <span class="resStatus-down noShow" >离线</span>
                </p>
                <p class="juese">
                    <i class="iconfont icon-tag" style="font-size: 18px; top: -7px"></i>
                    <span class="detailInfoClass"></span>
                </p>
                <div class="zyzx-top-box-title-msg" >
                    <div class="date">
                        <i class="iconfont icon-time-circle"></i>
                        <span>发布时间</span>
                    </div>
                    <div class="create zyzx-top-box-title-msg-creator">
                        <span>发布者名称</span>
                    </div>
                </div>
                <#if isShowCount>
                    <div class="count" id="resource-use" style="cursor: pointer">
                        <p></p>
                        <span>${countTitle}</span>
                    </div>
                </#if>
            </div>

            <div class="fenge"></div>
            <#nested />
        </div>
    </div>
</#macro>

<#--资源管理中心详情访问统计公用卡片-->
<#macro resourceDetailOfFWTJ>
    <div class="zyzx-box" style="margin-top: 20px">
        <div class="zyzx-box-title-fwtj" style="position:absolute; z-index:99999;">
            <div class="layui-form " style="width: 130px;">
                <select name="type" lay-verify="required" lay-filter="typeOption">
                    <option value="0">近一周</option>
                    <option value="1">近一月</option>
                    <option value="2">近一年</option>
                </select>
            </div>
        </div>
        <div style="position:absolute; left: 155px; z-index:99999;">
            <button type="button" class="layui-btn layui-btn-sm" style="float: right; background-color: #19be6b" id="getEcharts"><i class="iconfont icon-download"></i>导出图片</button>
        </div>
        <div class="zyzx-box-content layui-clear" style="width: 1150px;height:400px;">
            <div id="fwtjChart" style="width: 1150px;height:400px;"></div>
        </div>
    </div>
</#macro>

<#--资源管理中心详情资源状态历史变更公用卡片-->
<#macro resourceDetailOfZYZTLSBG>
    <div class="zyzx-box">
        <div id="nulldiv" style="display:none;text-align: center;">
            <span id="nullinfo"></span>
        </div>
        <div class="zyzx-box-content layui-clear" style="width: 1150px;height:400px;">
            <div id="historyChart" style="width: 1150px;height:400px;"></div>
        </div>

    </div>
</#macro>

<#--筛选条件公共卡片-->
<#macro filterBoxView   isShowTopMenu=true
                        isShowCart=true
                        isShowSearch=true
                        searchPlaceholder = "请输入搜索条件"
                        isShowRegister=true
                        registerTitle = "资源注册"
                        isShowExport=true
                        isShowToggle=false
                        isShowAuthorize=false
                        searchName = 'title'
                        cartTitle = '批量共享'
                        exportTitle = '数据导出'
                        isShowFlush=false>
    <div class="filter-box" id="filter-box-view">
        <#----------------------------+ 头部菜单 +------------------------------>
        <#if isShowTopMenu>
            <div class="gt-sort-header layui-clear">
                <#if isShowRegister>
                    <div class="left-opt">
                        <div class="layui-btn layui-btn-sm" id="registerResource">
                            <i class="layui-icon layui-icon-add-1"></i>${registerTitle}
                        </div>
                    </div>
                </#if>
                <div class="right-box">
                    <#if isShowSearch>
                        <div class="right-search-box addcar">
                            <input placeholder=${searchPlaceholder} autocomplete="off"
                                   class="layui-input layui-input-sm sort-search-title" id="searchValue">
                            <button class="layui-btn layui-btn-sm btnSearchTitle" id="searchResource">
                                <i class="iconfont icon-search"></i>搜 索
                            </button>
                        </div>
                    </#if>

                    <#if isShowAuthorize>
                        <!--批量导出-->
                        <div id="macro-authorize" data-totalitems="0" class="right-btn">
                            <i title="批量授权" class="iconfont icon-calendar-check"></i>
                        </div>
                    </#if>
                    <#if isShowCart>
                        <!--购物车-->
                        <div id="cart" class="right-btn" data-totalitems="0" title="${cartTitle}">
                            <i class="layui-icon layui-icon-cart"></i>
                        </div>
                    </#if>

                    <#if isShowExport>
                        <!--资源导出-->
                        <div class="right-btn" id="exportRes">
                            <i title="${exportTitle}" class="iconfont icon-upload"></i>
                        </div>
                    </#if>

                    <#if isShowFlush>
                        <div class="right-btn" id="flushRes">
                            <i title="刷新" class="iconfont icon-reload"></i>
                        </div>
                    </#if>
                </div>
            </div>
        </#if>
        <!------------------------------筛选头部已选择--------------------------------->
        <div class="sort-top layui-clear">
            <div class="sort-selectedName">
                <span class="have-selected">已筛选条件：</span>
                <div class="sort-select" id="selected-filter-dom">

                </div>
            </div>
            <div class="right-opt">
                <span class="sort-total">共筛选出<span class="greenfont" id="filter-data-count"></span>条数据</span>
                <div class="layui-btn layui-btn-xs layui-btn-border layui-btn-primary noShow" id="switch-box" onclick="switchBox(this)">
                    <i class="iconfont icon-caret-down"></i><span>展开筛选条件</span>
                </div>
                <#if isShowToggle>
                    <div class="layui-btn layui-btn-xs layui-btn-border layui-btn-primary toggleView" id="toggleView">
                        <span id="toggleDesc">切换至卡片视图</span>
                        <i id="toggleIcon" class="iconfont icon-table"></i>
                    </div>
                </#if>
            </div>
        </div>
        <!------------------------------筛选条件--------------------------------->
        <div class="layui-clear sort-bottom" id="filter-content-dom"></div>
        <!------------------------------筛选条件 end----------------------------->
    </div>

    <#--筛选条件内容模板-->
    <script type="text/html" id="filter-content-template">
        {{#  layui.each(d, function(index, item){ }}
        <div class="gt-filter gt-radio gt-filter-style">
            <div class="gt-filter-item">
                <div class="left-category">
                    {{item.label}}
                </div>
                {{# if (item.isSearch === true) { }}
                <span class="search-box" id="{{item.name}}-search">
                    <input placeholder="请输入" autocomplete="off" class="layui-input search-input">
                    <button type="button" class="layui-btn layui-btn-sm search-btn reset-input-btn">
                        <i class="iconfont icon-search"></i>搜 索
                    </button>
                </span>
                {{# } }}
                {{# if (item.isDateInterval === true) { }}
                <div class="layui-input-inline ">
                    <input type="text" id="{{item.name}}-dateBegin" autocomplete="off" class="layui-input layui-date date-input {{item.name}}">
                </div>
                <span style="margin: 0 4px">-</span>
                <div class="layui-input-inline">
                    <input type="text" id="{{item.name}}-dateEnd" autocomplete="off" class="layui-input layui-date date-input {{item.name}}">
                </div>
                {{# }else{  }}
                <div class="mid-cnt {{item.isFold ? 'fold-box' : ''}}" id="{{item.name}}">
                    <div class="all-checked" type="shareType" data-name="{{item.name}}" onclick="checkDataValue(this)">
                        <span>不限</span>
                    </div>
                    {{#  layui.each(item.values, function(index, value){ }}
                    <div  id="{{item.name + value.value}}" onclick="checkDataValue(this)" data-value="{{value.value}}" data-title="{{value.title}}" data-name="{{item.name}}" title="{{value.title}}" type="shareType">
                        <span>{{value.title}}</span>
                    </div>
                    {{#  }); }}
                </div>
                {{# if(item.isFold){ }}
                <span class="fold-span" id="{{item.name + '-fold'}}"> >>> </span>
                {{# } }}
                {{# } }}
            </div>
        </div>
        {{#  }); }}
    </script>

    <#--已筛选内容模板-->
    <script type="text/html" id="selected-filter-template">
        {{# layui.each(d, function(index, item){}}
        <div class="sort-labels">
            <span title="{{item.title}}">{{item.title}}</span>
            <i class="close-btn iconfont icon--close" onclick="deleteFilterData(this)" data-name="{{item.name}}"></i>
        </div>
        {{#  }); }}
        <button id="reset-selected-btn" class="qk layui-btn layui-fontbtn layui-btn-xs" onclick="resetFilterData()"><i class="iconfont icon-sync greenfont"></i>重置筛选</button>
    </script>

    <script>
        let filterBoxEvent = null; // 筛选盒子事件对象
        let filterContentData = {}; // 筛选盒子内容数据
        let filterContentViewData = {}; // 筛选内容展示数据
        let isFold = true; // 是否折叠
        let filterContentList = null; // 筛选盒子内容列表
        let onEvent = null; // 监听事件
        let cardData = {}; // 购物车数据
        let searchEvent = {}; // 查询筛选事件挂载
        let dateData = {}; // 时间筛选数据记录
        const changeList = [{"title": "切换至卡片视图", "icon": "icon-table", "value": "list"}, {"title": "切换至列表视图", "icon": "icon-creditcard", "value": "card"}]

        // 初始化过滤内容
        function initFilterContent(data) {
            // 刷新并重置页面展示
            refreshView(data.filterContentList);

            // 筛出数据数量补全
            document.getElementById("filter-data-count").innerHTML = data.count || "0";

            // 初始化筛选数据并渲染
            initFilterData(data.filterContentList);

            // 事件挂载
            onEvent = data.onEvent;
            filterBoxEvent = {
                // 获取dom高度
                getHeight: function () {
                    return document.getElementById("filter-box-view").clientHeight;
                },
                // 获取筛选条件数据
                getData: function () {
                    return filterContentData;
                },
                // 获取切换状态
                getSwitchState: function () {
                    return isFold;
                },
                // 设置筛选数量
                setCount: function (newCount) {
                    document.getElementById("filter-data-count").innerHTML = newCount || 0;
                },
                // 添加选中数据内容
                addFilterContentData: function (newObj) {
                    if (newObj) {
                        // 遍历数据更新数据
                        for (let key in newObj) {
                            let data = newObj[key];
                            if (!isEmpty(data)) {
                                let title = data.title;
                                let value = data.value;
                                filterContentData[key] = value;
                                filterContentViewData[key] = {
                                    title: title,
                                    value: value
                                }
                                // 改变样式
                                resetPerFilterStyle('capableType', value);
                            }
                        }

                        // 更新已选择数据
                        updateHaveSelected();

                        // 触发选择事件
                        onEvent.onSelectFilter(filterContentData);
                    }
                },
                // 添加选中数据内容
                setFilterContentData: function (newObj) {
                    if (newObj) {
                        // 遍历数据更新数据
                        for (let key in newObj) {
                            let data = newObj[key];
                            if (!isEmpty(data)) {
                                let title = data.title;
                                let value = data.value;
                                filterContentData[key] = value;
                                filterContentViewData[key] = {
                                    title: title,
                                    value: value
                                }

                                // 改变样式
                                resetPerFilterStyle(key, value);
                            }
                        }
                        updateHaveSelected();

                        // 触发选择事件
                        onEvent.onSelectFilter(filterContentData);
                    }
                },
                // 设置购物车数据
                setCardData: function (newData) {
                    cardData = newData;
                    $("#cart").attr("data-totalitems", Object.keys(cardData).length)
                },
                // 清除所选项
                clearContent: function (isUnCheck) {
                    resetFilterData(isUnCheck);
                },
                // 更新数据
                updateData: function (newData) {
                    initFilterData(newData);
                }
            }

            // 切换按钮事件挂载
            let changeDom = document.getElementById("toggleView");
            if (changeDom) {
                let defaultShowType = "card"
                getDataToServer("/ui/config/findConfigurationByCode?code=shareListDefaultShowType", "", function (res) {
                    if (res.success && res.data){
                        defaultShowType = res.data.value ? res.data.value : "card";
                        if (defaultShowType === 'list') {
                            $('#toggleDesc').text('切换至卡片视图')
                            $('#toggleIcon').removeClass('icon-creditcard').addClass('icon-table')
                        } else {
                            $('#toggleDesc').text('切换至列表视图')
                            $('#toggleIcon').removeClass('icon-table').addClass('icon-creditcard')
                        }
                    }
                }, false);

                filterBoxEvent.getDefaultShowType = function () {
                    return defaultShowType;
                }

                if (changeDom.clickHandler){
                    changeDom.removeEventListener("click", changeDom.clickHandler)
                }

                changeDom.clickHandler = function(){
                    // 获取标题和图标dom
                    let titleDom = changeDom.children[0];
                    let iconDom = changeDom.children[1];

                    // 修改标题和图标
                    let checkData = changeList[0].title === titleDom.innerText ? changeList[1] : changeList[0];
                    titleDom.innerText = checkData.title;
                    iconDom.classList.remove(iconDom.classList[1]);
                    iconDom.classList.add(checkData.icon);
                    onEvent.onSwitchView(checkData);
                }

                changeDom.addEventListener("click",  changeDom.clickHandler)
            }

            // 渲染上部菜单
            if (onEvent) {
                renderTopMenu();
            }

            return filterBoxEvent;
        }

        /**
         * 初始化筛选数据
         * @param filterData
         */
        function initFilterData(filterData) {
            filterContentList = filterData || [];
            // 补充折叠属性
            filterContentList = extendParams(filterContentList);

            // 渲染筛选内容
            let tempFilterContentList = JSON.parse(JSON.stringify(filterContentList));
            tempFilterContentList.splice(2);
            renderFilterContent(tempFilterContentList);

            // 控制展开条件
            let switchBoxDom = document.getElementById("switch-box");
            if (switchBoxDom && (filterContentList.length > 2)) {
                switchBoxDom.classList.remove("noShow");
            }

            // 数据补充
            filterContentList.forEach((filter)=> {
                filterContentData[filter.name] = null;
                filterContentViewData[filter.name] = {
                    title: null,
                    value: null
                }
                // 查询筛选事件挂载
                if (filter.isSearch) {
                    searchEvent[filter.name] = filter.searchFunction;
                }
                // 区间筛选渲染
                if (filter.isDateInterval) {
                    dateData[filter.name] = ["", ""];
                    layui.laydate.render({
                        elem: '#' + filter.name + "-dateBegin",
                        showBottom: false,
                        done: function(value){
                            onDateFilter(filter, 0, value);
                        }
                    });
                    layui.laydate.render({
                        elem: '#' + filter.name + "-dateEnd",
                        showBottom: false,
                        done: function(value){
                            onDateFilter(filter, 1, value);
                        }
                    });
                }
            })
        }

        /**
         * 扩充数据参数
         *
         * @param filterContentList
         * @returns {*[]}
         */
        function extendParams(filterContentList) {
            let returnArray = [];
            for (let i = 0 ;i < filterContentList.length; i++) {
                let filterContent = filterContentList[i];
                let values = filterContent.values;

                // 补充是否折叠
                let allLength = $("#filter-content-dom").width() - 110;
                let textLength = values.length * 15 + (values.map(e => e.title) + "").length * 14;
                filterContent.isFold = allLength < textLength;

                returnArray.push(filterContent);
            }

            return returnArray;
        }


        // 刷新展示内容
        function refreshView(data) {
            // 第一步：重置折叠按钮
            // 修改开关按钮样式
            let switchDom = document.getElementById("switch-box");
            if (data.length>2){
                switchDom.children[0].classList.remove("icon-caret-down","icon--up");
                switchDom.children[0].classList.add("icon-caret-down");
                switchDom.children[1].textContent = '展开筛选条件';
            }else {
                switchDom.classList.add("noShow");
            }

            // 第二步：重置表格卡片切换 (待)
            // let changeDom = document.getElementById("toggleView");
            // changeDom.children[0].innerText = changeList[0].title;
            // changeDom.children[1].classList.remove(changeList[0].icon, changeList[1].icon);
            // changeDom.children[1].classList.add(changeList[0].icon);
        }

        // 监听时间筛选选择事件
        function onDateFilter(filter, index, value) {
            let warnMsg;
            if (index === 0) {
                dateData[filter.name] = [value, dateData[filter.name][1] || ""];
                warnMsg = "前一个时间大于后一个时间！";
            } else {
                dateData[filter.name] = [dateData[filter.name][0] || "", value];
                warnMsg = "后一个时间小于前一个时间！";
            }

            if ((dateData[filter.name][0] > dateData[filter.name][1]) && (dateData[filter.name][0] !== "")) {
                layerMsg.warn(warnMsg);
                return;
            }
            let tempTitle = (dateData[filter.name][0] || "") + "至" + (dateData[filter.name][1] || "");
            filterContentViewData[filter.name] = {
                title: tempTitle,
                value: dateData[filter.name]
            };
            updateHaveSelected();
            // 触发选择事件
            filterContentData[filter.name] = dateData[filter.name];
            onEvent.onSelectFilter(filterContentData);
        }

        // 选择筛选条件处理事件
        function checkDataValue(dataDom) {
            // 补全选择数据
            let name = dataDom.getAttribute("data-name");
            let value = dataDom.getAttribute("data-value");
            let title = dataDom.getAttribute("data-title");
            filterContentData[name] = value;
            filterContentViewData[name] = {
                title: title,
                value: value
            }
            updateHaveSelected();

            // 改变样式
            resetPerFilterStyle(name, value);

            // 触发选择事件
            onEvent.onSelectFilter(filterContentData);
        }

        // 重置筛选数据样式
        function resetPerFilterStyle(name, value) {
            let parentDom = document.getElementById(name);
            // 由于外部设置参数时不许取消样式所以需判断一下
            if (parentDom) {
                for (let i = 0; i < parentDom.children.length; i++) {
                    let child = parentDom.children[i];
                    child.classList.remove("all-checked");
                }

                // 当无value时选中不限
                if (value) {
                    let targetDom = document.getElementById(name + value);
                    if (targetDom){
                        targetDom.classList.add("all-checked");
                    }
                } else {
                    parentDom.children[0].classList.add("all-checked");
                }
            }
        }

        // 渲染顶部菜单
        function renderTopMenu() {
            <#if isShowTopMenu>
                <#if isShowRegister>
                    // 资源注册相关
                    let onRegisterClick = onEvent.onRegisterClick;
                    if (onRegisterClick) {
                        let registerDom = document.getElementById("registerResource");
                        registerDom.onclick = onEvent.onRegisterClick;
                    }
                </#if>

                <#if isShowSearch>
                    // 搜索资源
                    let searchBtnDom = document.getElementById("searchResource");
                    searchBtnDom.onclick = function () {
                        // 获取输入框的值
                        let inputDom = document.getElementById("searchValue");
                        let searchValue = inputDom.value;
                        // 将值补充到筛选条件中
                        filterContentData.${searchName} = searchValue;
                        filterContentViewData.${searchName} = {
                            title: searchValue,
                            value: searchValue
                        }
                        updateHaveSelected();

                        // 触发选择事件
                        onEvent.onSelectFilter(filterContentData);
                    };
                </#if>

                <#if isShowAuthorize>
                // 购物车跳转
                let onAuthorizeClick = onEvent.onAuthorizeClick;
                if (onAuthorizeClick) {
                    let authorizeDom = document.getElementById("macro-authorize");
                    authorizeDom.onclick = onEvent.onAuthorizeClick;
                }
                </#if>
                <#if isShowCart>
                    // 购物车跳转
                    let onCardClick = onEvent.onCardClick;
                    if (onCardClick) {
                        let cardDom = document.getElementById("cart");
                        cardDom.onclick = onEvent.onCardClick;
                    }
                </#if>
                <#if isShowExport>
                    // 导出方案
                    let onExportClick = onEvent.onExportClick;
                    if (onExportClick) {
                        let exportDom = document.getElementById("exportRes");
                        exportDom.onclick = onExportClick;
                    }
                </#if>
                <#if isShowFlush>
                    // 刷新方案
                    let onFlushClick = onEvent.onFlushClick;
                    if (onFlushClick) {
                        let flushDom = document.getElementById("flushRes");
                        flushDom.onclick = onFlushClick;
                    }
                </#if>
            </#if>
        }

        // 更新已选择筛选条件模板
        function updateHaveSelected() {
            // 第一步：处理数据
            let selectedList = [];
            for (let key in filterContentViewData) {
                let value = filterContentViewData[key].value;
                let title = filterContentViewData[key].title;
                if (!isEmpty(value) && value) {
                    selectedList.push({
                        title: title,
                        value: value,
                        name: key
                    })
                }
            }

            // 第二步： 渲染模板数据
            renderTpl("selected-filter-template", "selected-filter-dom", selectedList);

            // 第三步： 当树为空时隐藏重置筛选
            if(selectedList.length === 0) {
                document.getElementById("reset-selected-btn").classList.add("noShow");
            }
        }

        // 删除筛选数据
        function deleteFilterData(dataDom) {
            // 第一步：删除筛选数据
            let name = dataDom.getAttribute("data-name");
            filterContentData[name] = null;
            filterContentViewData[name] = {
                title: null,
                value: null
            };
            // 第二步：重置选择样式
            // 重置搜索
            if (name === "title") {
                let inputDom = document.getElementById("searchValue");
                if (inputDom) {
                    inputDom.value = "";
                }
            } else if (dateData[name]) {
                let dateInputDom = document.getElementsByClassName(name);
                for (let perDom of dateInputDom) {
                    perDom.value = "";
                }
                dateData[name] = ["", ""];
            } else {
                resetPerFilterStyle(name, null);
            }
            // 更新已筛选
            updateHaveSelected();

            // 触发选择事件
            if (onEvent && onEvent.onSelectFilter) {
                onEvent.onSelectFilter(filterContentData);
            }
        }

        // 重置筛选
        function resetFilterData (isUnCheck) {
            // 清空筛选数据
            for (let key in filterContentData) {
                filterContentData[key] = null;
            }
            for (let key in filterContentViewData) {
                filterContentViewData[key] = {
                    title: null,
                    value: null
                }
            }
            updateHaveSelected();

            // 搜索数据置空
            let inputDom = document.getElementById("searchValue");
            if (inputDom) {
                inputDom.value = "";
            }

            // 清空筛选内容状态
            let filterContent = document.getElementsByClassName("mid-cnt");
            for (let perContent of filterContent) {
                let domId = perContent.id;
                resetPerFilterStyle(domId, null);

            }

            // 清空关键字筛选内容
            let keySearchDom = document.getElementsByClassName("search-input");
            for (let perDom of keySearchDom) {
                perDom.value = "";
                // 管理和共享目录在重置筛选时需要将筛选的关键字重置，下面执行了一下筛选关键字的重置
                $('.reset-input-btn').click();
            }

            // 清空时间筛选内容
            let dateInputDom = document.getElementsByClassName("date-input");
            for (let perDom of dateInputDom) {
                perDom.value = "";
            }
            for (let key in dateData) {
                dateData[key] = ["", ""];
            }

            // 触发选择事件
            if (!isUnCheck && onEvent && onEvent.onSelectFilter) {
                onEvent.onSelectFilter(filterContentData);
            }
        }

        // 开关折叠
        function switchBox(dataDom) {
            // 只渲染前两个内容
            isFold = !isFold;
            let tempDataList;
            let tempFilterContentList = JSON.parse(JSON.stringify(filterContentList));

            // 修改开关按钮样式
            dataDom.children[0].classList.remove("icon-caret-down","icon--up")

            if (isFold) {
                tempFilterContentList.splice(2);
                tempDataList = tempFilterContentList;
                dataDom.children[0].classList.add("icon-caret-down");
                dataDom.children[1].textContent = '展开筛选条件';
            } else {
                tempDataList =  filterContentList;
                dataDom.children[0].classList.add("icon--up");
                dataDom.children[1].textContent = '收起筛选条件';
            }
            renderFilterContent(tempDataList);

            // 触发切换事件
            if (onEvent && onEvent.onSwitch) {
                onEvent.onSwitch(document.getElementById("filter-box-view").clientHeight);
            }
        }

        /**
         * 渲染过滤内容
         * @param dataList
         */
        function renderFilterContent (dataList) {
            dataList = dataList || [];
            renderTpl("filter-content-template", "filter-content-dom", dataList);
            // 筛选搜索内容并挂载事件
            dataList.forEach((perData)=> {
                if (perData.isSearch) {
                    const id = perData.name + "-search";
                    let mainDom = document.getElementById(id);
                    let inputDom = mainDom.children[0];
                    let btnDom = mainDom.children[1];
                    btnDom.addEventListener("click", function () {
                        let searchName = inputDom.value;
                        dataList.find(e => e.name === perData.name).values = searchEvent[perData.name](searchName);
                        renderFilterContent(dataList);
                    })
                }
                // 挂载折叠监听事件
                if (perData.isFold) {
                    let id =  perData.name + '-fold';
                    document.getElementById(id).addEventListener("click", function () {
                        let classList = document.getElementById(perData.name).classList;
                        if (classList.value.includes("fold-box")) {
                            this.textContent = " <<< ";
                            document.getElementById(perData.name).classList.remove('fold-box');
                        } else {
                            this.textContent = " >>> ";
                            document.getElementById(perData.name).classList.add('fold-box');
                        }

                        // 触发变动事件
                        if (onEvent && onEvent.onFoldField) {
                            onEvent.onFoldField(document.getElementById("filter-box-view").clientHeight);
                        }
                    })
                }
            })
        }
    </script>
</#macro>

<#--资源目录-->
<#macro resourceCatalog title="资源目录">
    <div class="left-filterbar">
        <div class="catalog-header nav-name">
            <span id="resourceListTitle">${title}</span>
        </div>
        <div class="catalog-content" id="catalog-content-dom"></div>
    </div>

    <#--  sidebar渲染侧边栏方式  -->
    <script id="sidebarTemplate" type="text/html">
        <div id="bigNav" lay-filter="changeNav" class="layui-side"></div>
    </script>

    <#-- layui.tpl渲染侧边栏模式 -->
    <script id="layuiTemplate" type="text/html">
        <div id="bigNav" lay-filter="changeNav" class="layui-side">
            <div class="layui-side-scroll" id="sidebarRender">
                <div class="sidebar-tpl">
                    <ul class="layui-nav layui-nav-tree beg-navbar layui-inline">
                        <!--一级子菜单-->
                        {{#  layui.each(d, function(index, first){ }}
                        <li class="layui-nav-item layui-nav-itemed">
                            <a href="javascript:;" purl="" ptitle="0" style="padding-left: 10px;">
                                <!--<i class="iconfont icon-renwu" data-icon="icon-renwu" style="top: 4px;"></i>-->
                                <img src="images/statistic.png" alt="" style="height: 17px; margin-bottom: 2px;">
                                <cite>{{ first.title }}</cite>
                                <i class="layui-icon layui-icon-down layui-nav-more" style="font-size: 12px; top: 4px; height: auto; border-color: transparent;"></i>
                            </a>
                            <dl class="layui-nav-child">
                                <!--二级子菜单-->
                                {{#  layui.each(first.children, function(index, second){ }}
                                {{# if(second.children && second.children.length > 0){ }}
                                <dd title="{{ second.title }}" class="layui-nav-item">
                                    <a href="javascript:;">
                                        <cite class="catalogNode" data-url="{{ second.value }}" purl="{{ first.value }}" data-exttype="{{ second.extType }}" data-treeKey="{{ first.key }}"  ptitle="{{ first.title }}">
                                            {{ second.title }}</cite>
                                    </a>
                                    {{# }else{ }}
                                <dd title="{{ second.title }}" >
                                    <a href="javascript:;">
                                        <cite class="catalogNode" data-url="{{ second.value }}" purl="{{ first.value }}" data-exttype="{{ second.extType }}" data-treeKey="{{ first.key }}" ptitle="{{ first.title }}"style="margin-left: 18px;">
                                            {{ second.title }}</cite>
                                    </a>
                                    {{# } }}
                                    {{# if(second.children && second.children.length > 0){ }}
                                    <dl class="layui-nav-child">
                                        <!--三级子菜单-->
                                        {{#  layui.each(second.children, function(index, third){ }}
                                        {{# if(third.children && third.children.length > 0){ }}
                                        <dd title="{{ third.title }}" class="layui-nav-item" >
                                            <a href="javascript:;">
                                                <cite class="catalogNode" data-url="{{ third.value }}" purl="{{ second.value }}" data-treeKey="{{ first.key }}" data-exttype="{{ third.extType }}" ptitle="{{ second.title }}">
                                                    {{ third.title }}</cite>
                                            </a>
                                            {{# }else{ }}
                                        <dd title="{{ third.title }}" >
                                            <a href="javascript:;">
                                                <cite class="catalogNode" data-url="{{ third.value }}" purl="{{ second.value }}" data-treeKey="{{ first.key }}" data-exttype="{{ third.extType }}" ptitle="{{ second.title }}" >
                                                    {{ third.title }}</cite>
                                            </a>
                                            {{# } }}
                                            {{# if(third.children && third.children.length > 0){ }}
                                            <dl class="layui-nav-child">
                                                <!--四级子菜单-->
                                                {{#  layui.each(third.children, function(index, forth){ }}
                                                {{# if(forth.children && forth.children.length > 0){ }}
                                                <dd title="{{ forth.title }}" class="layui-nav-item">
                                                    <a href="javascript:;" class="catalogNode"
                                                       data-url="{{ forth.value }}" purl="{{ third.value }}" data-treeKey="{{ first.key }}" data-exttype="{{ forth.extType }}" ptitle="{{ third.title }}">
                                                        <cite>{{ forth.title }}</cite>
                                                    </a>
                                                    <dl class="layui-nav-child">
                                                        <!--五级子菜单-->
                                                        {{#  layui.each(forth.children, function(index, fifth){ }}
                                                        <dd title="{{ fifth.title }}" >
                                                            <a href="javascript:;" class="catalogNode imgNav" style="padding-left: 88px;"
                                                               data-url="{{ fifth.value }}" purl="{{ forth.value }}" data-treeKey="{{ first.key }}" data-exttype="{{ fifth.extType }}" ptitle="{{ forth.title }}">
                                                                <img src="images/archives.png" alt="" style="height: 12px; margin-bottom: 3px;">
                                                                <cite>{{ fifth.title }}</cite>
                                                            </a>
                                                        </dd>
                                                        {{#  }); }}
                                                    </dl>
                                                </dd>
                                                {{# }else{ }}
                                                <dd title="{{ forth.title }}" >
                                                    <a href="javascript:;" class="catalogNode imgNav" style="padding-left: 71px;"
                                                       data-url="{{ forth.value }}" purl="{{ third.value }}" data-treeKey="{{ first.key }}" data-exttype="{{ forth.extType }}" ptitle="{{ third.title }}">
                                                        <img src="images/archives.png" alt="" style="height: 12px; margin-bottom: 3px;">
                                                        <cite>{{ forth.title }}</cite>
                                                    </a>
                                                </dd>
                                                {{# } }}
                                                {{#  }); }}
                                            </dl>
                                            {{# } }}
                                        </dd>
                                        {{#  }); }}
                                    </dl>
                                    {{# } }}
                                </dd>
                                {{#  }); }}
                            </dl>
                        </li>
                        {{#  }); }}
                    </ul>
                </div>
            </div>
        </div>
    </script>

    <#-- sidebar结合swiper渲染侧边栏模式 -->
    <script id="swiperTemplate" type="text/html">
        <div class="sidebar-swiper gt-swipertab">
            <div class="swiper-slide swiper-slide-box swipertabcontainer">
                <div class="swiperprev swiper-switch-button" id="swiper-prev">
                    <i class="layui-icon layui-icon-left "></i>
                </div>
                <div class="swipernext swiper-switch-button" id="swiper-next">
                    <i class="layui-icon layui-icon-right"></i>
                </div>
                <div class="swipertab" id="swiper-header">
                    <div class="swiper-wrapper">
                        {{#  layui.each(d, function(index, item){ }}
                            {{# if(index === 0){ }}
                            <div class="swiper-slide swiper-selected">{{item.title}}</div>
                            {{# } else{ }}
                            <div class="swiper-slide">{{item.title}}</div>
                            {{# } }}
                        {{#  }); }}
                    </div>
                </div>
            </div>
            <div class="swiper-container swiper-container-box swipertabcnt" id="swiper-content">
                <div class="swiper-wrapper">
                    {{#  layui.each(d, function(index, item){ }}
                        <div class="swiper-slide swiper-no-swiping">
                            {{# if (item.children.length > 0) { }}
                            <div id="bigNav-{{index}}" lay-filter="changeNav" class="layui-side"></div>
                            {{# } }}
                        </div>
                    {{#  }); }}
                </div>
            </div>
        </div>
    </script>

    <script>
        let nodeDict = new Map();   // 树节点字典
        let filterRes = null;   // 资源过滤功能
        let typeOfValueMapping = {};
        let tplTypeGlobal; // 模板类型
        let treeDataGlobal; // 树数据
        let TITLE_DICTIONARY = {
            'RESC': "按主体分类",
            'FBJG': "按机构分类",
            'REST': "按资源类型分类",
            'ZBXT': "按坐标分类",
            'PUBLISH': "按共享类型分类"
        }

        // 初始化资源目录
        function initResCatalog(tplType, treeData) {
            tplTypeGlobal = tplType;
            treeDataGlobal = treeData;
            filterRes = treeData.filterRes;
            switch (tplType) {
                case "sidebar": {
                    renderLeftNavBySidebar(treeData.data);
                    break;
                }
                case "sidebarTab": {
                    renderLeftNavWithTab(treeData.data);
                    break;
                }
                case "layTpl": {
                    renderLeftNavByLayTpl(treeData.data);
                    break;
                }
                default:
                    break;
            }
            handleCiteClick();
        }

        // 通过sidebar工具渲染资源目录树
        function renderLeftNavBySidebar(data) {
            document.getElementById('catalog-content-dom').innerHTML = document.getElementById('sidebarTemplate').innerHTML;
            layui.sidebar.render({
                el: '#bigNav',
                data: {"data": rebuildData(data, false)}
            });
            // renderSidebarFunc();
        }

        // 通过sidebar工具渲染带有tab工具的资源目录树
        function renderLeftNavWithTab(data) {
            let newData = rebuildData(data,true);
            renderTpl('swiperTemplate', 'catalog-content-dom', newData);
            renderSwiper();
            newData.forEach((item, index) => {
                if (item.children.length > 0) {
                    layui.sidebar.render({
                        el: "#bigNav-" + index,
                        data: {"data" : item.children}
                    });
                    // renderSidebarFunc();
                }
            })
        }

        // 通过layui模板渲染资源目录树
        function renderLeftNavByLayTpl(data) {
            let nav = [];

            for (let i = 0; i < data.length; i++) {
                let catalogObj = data[i];
                let catalogData = catalogObj.data;

                let item = {
                    "children": manageTreeData(catalogData, catalogObj.type),
                    "value": "",
                    "icon": "iconfont iconappstore",
                    "spread": true,
                    "extType": catalogObj.type,
                    "title": catalogObj.title,
                    "key": i
                };
                nav.push(item);
            }

            renderTpl('layuiTemplate', 'catalog-content-dom', nav);
            layui.element.render();
            // 节点点击事件
            $('.catalogNode').on('click', function (elem) {
                $("#bigNav a").removeClass("layui-this");
                $("#bigNav dd").removeClass("layui-this");
                // 过滤掉数量
                let title = $(this).text();
                if (title.indexOf("(") !== -1) {
                    title = title.substring(0,title.indexOf("("))
                }
                filterRes($(this).attr("data-url"), $(this).attr("data-exttype"), title, $(this).attr("data-treeKey"));
                if ($(this).hasClass("imgNav")) {
                    $(this).addClass("layui-this");
                }
            });
        }

        // swiper实例化
        function renderSwiper() {
            // 实例化头部切换
            let swiperHeader = new Swiper('#swiper-header', {
                slidesPerView: 3,
                paginationClickable: true,
                spaceBetween: 5,
                freeMode: false,
                loop: false,
                prevButton:'#swiper-prev',
                nextButton:'#swiper-next'
            });

            // 实例化内容切换
            let swiperContent = new Swiper('#swiper-content', {
                direction: 'horizontal',
                loop: false,
                noSwiping:true,
                autoHeight: false
            });
            swiperHeader.slides.each(function(index, val) {
                let ele = $(this);
                ele.on("click", function() {
                    // 请求不同内容
                    setCurrentSlide(ele, index);
                    swiperContent.slideTo(index, 500, false);
                });
            });

            function setCurrentSlide(ele, index) {
                $(".swipertab .swiper-slide").removeClass("swiper-selected");
                ele.addClass("swiper-selected");
            }
        }

        // layui.tpl组合资源目录树
        function manageTreeData(list, type) {
            let temMap = {};
            let treeList = [];
            if (!isEmpty(list)) {

                list.forEach(node => {
                    node.children = [];
                    node.spread = false;
                    node.extType = type;
                    temMap[node.id] = node;
                })

                list.forEach(item => {
                    let parent = temMap[item.parentId];
                    if (!isEmpty(parent)) {
                        parent.children.push(item);
                    } else {
                        treeList.push(item);
                    }
                })

                return treeList;
            } else {
                console.log("当前树节点没有数据！")
            }
        }

        // sidebar将接口返回的数据组织成指定的树形结构
        function rebuildData(obj, addIcon) {
            let result = [];
            Object.keys(obj).forEach(key => {
                let title;
                let tempList = [];

                switch (key) {
                    case 'RESC':
                        title = TITLE_DICTIONARY['RESC'];
                        break;
                    case 'REST':
                        title = TITLE_DICTIONARY['REST'];
                        break;
                    case 'ZBXT':
                        title = TITLE_DICTIONARY['ZBXT'];
                        break;
                    case 'FBJG':
                        title = TITLE_DICTIONARY['FBJG'];
                        break
                    default:
                        return
                }

                // 添加每个子节点数据
                obj[key].forEach( function (child) {
                    let temp = {
                        "id": child.id,
                        "parentId": child.parentId || key,
                        "title": child.title,
                        "href": child.value,
                        "children": []
                    };
                    tempList.push(temp);
                    nodeDict.set(child.value, key);

                    // 完善映射数据
                    typeOfValueMapping[child.value] = key;
                })

                let perRootChildren = list2Tree(tempList, 'parentId');
                // 最外层添加图标
                if (addIcon) {
                    perRootChildren = perRootChildren.map( e=> {
                        e["icon"] = "iconfont icon-mulu";
                        return e;
                    });
                }
                // 重构根节点数据
                let root = {
                    "id": key,
                    "icon": "iconfont icon-mulu",
                    "href": key,
                    "title": title,
                    "parentId": null,
                    "children": perRootChildren,
                    "spread": true
                };
                result.push(root);
            })

            return result;
        }

        // 挂载点击事件
        function handleCiteClick() {
            let citeElemList = document.getElementsByTagName("cite");

            if (citeElemList.length === 0) {
                return;
            }

            for (let i = 0; i < citeElemList.length; i++) {
                // 构建参数
                let citeElem = citeElemList[i];
                let parentElem = citeElem.parentElement;
                let value = parentElem.dataset.url;
                let type = typeOfValueMapping[value];
                let title = citeElem.textContent.split("(")[0];

                // 处理点击事件
                if (!isEmpty(value) && !isEmpty(type)) {
                    citeElem.addEventListener("click", function () {
                        // 清除所有选中样式
                        let ddDomList = document.getElementsByTagName("dd");
                        for (let i = 0; i < ddDomList.length; i++) {
                            let ddDom = ddDomList[i];
                            ddDom.classList.remove("layui-this");
                        }
                        let dlDomList = document.getElementsByTagName("dl");
                        for (let i = 0; i < dlDomList.length; i++) {
                            let dlDom = dlDomList[i];
                            dlDom.classList.remove("layui-this");
                        }
                        //
                        // // 更新选中样式
                        // parentElem.parentElement.classList.add("layui-this")

                        // 触发点击事件
                        filterRes(value, type, title);
                    })
                }

            }

        }
    </script>
</#macro>

<#--排序方式-->
<#macro sortBox>
    <div class="order-box" id="order-dom"></div>

    <script id="order-template" type="text/html">
        <div class="order-label">排序方式</div>
        <span class="per-order-box">
            {{#  layui.each(d, function(index, perOrder){ }}
            <span class="order-span" id="{{perOrder.value}}" onclick="orderMethod(this)" data-sortMethod="{{perOrder.sortMethod}}" data-value="{{perOrder.value}}">{{perOrder.title}}</span>
            {{#  }); }}
        </span>
    </script>

    <script>
        let onSortEvent; // 事件挂载
        let selectedDomId; // 选中的domId
        /**
        * 初始化事件
        * @param dataList
        */
        function initSortBox (data){
            // 置空选中的domId
            selectedDomId = null;

            let dataList = data.dataList || [];
            renderTpl("order-template", "order-dom", dataList);
            onSortEvent = {
                click: data.click
            }
        }

        /**
         * 排序事件
         * @param dataValue {String} 排序数据值
         */
        function sortByDataValue(dataValue) {
            let dom = document.getElementById(dataValue);
            if (dom) {
                orderMethod(dom);
            }
        }

        /**
        * 排序事件(再次点击取消排序)
        * @param dataDom
        */
        function orderMethod (dataDom) {
            // 获取处理数据
            let value = dataDom.getAttribute("data-value");
            let sortMethod = dataDom.getAttribute("data-sortMethod");

            // 清除选中样式
            for (let child of dataDom.parentElement.children) {
                child.style.color = "#000";
            }

            // 处理二次点击事件
            let domId = dataDom.id;
            let where;
            if (selectedDomId === domId) {
                selectedDomId = null;
                where = {
                    "sort": null
                }
            } else {
                dataDom.style.color = '#177de4';
                selectedDomId = dataDom.id;
                where = {
                    "sort": value + "," + sortMethod
                }
            }

            // 出发回调事件
            onSortEvent.click(where);
        }
    </script>
</#macro>

<#--图片-->
<#macro img src="images/error/white.png" alt="" classStr="">
    <img src="${src}" alt="${alt}" class="${classStr}" onerror="this.src='images/error/white.png'"/>
</#macro>

<#macro textHTML>
    <div></div>
</#macro>
