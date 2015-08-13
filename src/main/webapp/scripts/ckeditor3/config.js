/*
 Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
 For licensing, see LICENSE.html or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function (config) {
// 界面语言格式，默认为en
    config.entities = false;
    /*不进行转义*/
    config.language = 'zh-cn';
    config.font_names = '宋体/宋体;黑体/黑体;仿宋/仿宋_GB2312;楷体/楷体_GB2312;隶书/隶书;幼圆/幼圆;微软雅黑/微软';

// 添加行间距
    config.extraPlugins += (config.extraPlugins ? ',lineheight' : 'lineheight');


// 工具栏（基础'Basic'、全能'Full'、自定义）plugins/toolbar/plugin.js

    //config.toolbar = 'Basic'; 

    //config.toolbar = 'Full'; 

    config.toolbar_Full = [
        ['Bold', 'Italic', 'Underline', 'Strike', 'FontSize'],
        ['Cut', 'Copy', 'Paste'],
        ['Undo', 'Redo'],
        ['Image', 'Table', ['Maximize'], 'Source']
    ];

    //工具栏是否可以被收缩
    config.toolbarCanCollapse = true;


// 编辑器样式，有三种：'kama'（默认）、'office2003'、'v2'

    config.skin = 'kama';

// 设置宽高


    config.height = 400;
    // Define changes to default configuration here. For example:
    // config.language = 'fr';
    // config.uiColor = '#AADC6E';
};
