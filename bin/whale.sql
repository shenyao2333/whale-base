/*
 Navicat Premium Data Transfer

 Source Server         : openSource
 Source Server Type    : MySQL
 Source Server Version : 50732
 Source Host           : localhost:3306
 Source Schema         : entfrm-boot2.0

 Target Server Type    : MySQL
 Target Server Version : 50732
 File Encoding         : 65001

 Date: 23/04/2021 18:12:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dev_apiinfo
-- ----------------------------
DROP TABLE IF EXISTS `dev_apiinfo`;
CREATE TABLE `dev_apiinfo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `application_id` int(11) NULL DEFAULT NULL COMMENT '应用编号',
  `table_id` int(11) NULL DEFAULT NULL COMMENT '表编号',
  `table_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表名',
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '自定义编号',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '父编号',
  `type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接口类型',
  `request_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求方式',
  `request_method` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求方法',
  `fdata` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '字段数据',
  `pdata` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '参数数据',
  `scripts` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '脚本',
  `dept_id` int(11) NULL DEFAULT NULL COMMENT '机构编号',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0-正常，1-停用）',
  `create_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标识（0-正常，1-删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '接口信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dev_apiinfo
-- ----------------------------

-- ----------------------------
-- Table structure for dev_column
-- ----------------------------
DROP TABLE IF EXISTS `dev_column`;
CREATE TABLE `dev_column`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `def_value` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '默认值',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '是否必填（1是）',
  `is_add` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '是否为新增字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '是否查询字段（1是）',
  `query_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'eq' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '0-正常，1-删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dev_column
-- ----------------------------

-- ----------------------------
-- Table structure for dev_dataset
-- ----------------------------
DROP TABLE IF EXISTS `dev_dataset`;
CREATE TABLE `dev_dataset`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编码',
  `name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `alias` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据源别名',
  `ftype` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'json' COMMENT '格式类型',
  `cdata` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '配置数据',
  `is_page` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否分页',
  `scripts` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'sql脚本',
  `create_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '删除标识（0-正常，1-删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据源' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dev_dataset
-- ----------------------------

-- ----------------------------
-- Table structure for dev_form
-- ----------------------------
DROP TABLE IF EXISTS `dev_form`;
CREATE TABLE `dev_form`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表单名称',
  `code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表单标识',
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '表单类型',
  `ds_alias` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据库别名',
  `table_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表名',
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '表单数据',
  `auto_create` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '自动创建',
  `version` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '版本号',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dev_form
-- ----------------------------
INSERT INTO `dev_form` VALUES (1, '测试表单', 'test', '0', '1', 'test', '\"{column:[{type:\'input\',label:\'单行文本\',span:24,display:true,prop:\'1616808322555_61191\'},{type:\'textarea\',label:\'多行文本\',span:24,display:true,prop:\'1616818908722_16715\'},{type:\'radio\',label:\'单选框组\',dicData:[{label:\'选项一\',value:\'0\'},{label:\'选项二\',value:\'1\'},{label:\'选项三\',value:\'2\'}],span:12,display:true,props:{label:\'label\',value:\'value\'},prop:\'1616808328794_21064\'},{type:\'timerange\',label:\'时间范围\',span:12,display:true,format:\'HH:mm:ss\',valueFormat:\'HH:mm:ss\',prop:\'1616808492078_95952\'},{type:\'upload\',label:\'上传\',span:24,display:true,showFileList:true,multiple:true,limit:10,propsHttp:{},canvasOption:{},prop:\'1616818404413_51309\'},{type:\'icon\',label:\'图标\',component:\'avue-input-icon\',span:24,display:true,params:{iconList:[{label:\'基本图标\',list:[\'el-icon-info\',\'el-icon-error\',\'el-icon-error\',\'el-icon-success\',\'el-icon-warning\',\'el-icon-question\']},{label:\'方向图标\',list:[\'el-icon-info\',\'el-icon-back\',\'el-icon-arrow-left\',\'el-icon-arrow-down\',\'el-icon-arrow-right\',\'el-icon-arrow-up\']},{label:\'符号图标\',list:[\'el-icon-plus\',\'el-icon-minus\',\'el-icon-close\',\'el-icon-check\']}]},prop:\'1616828635931_82028\'}],labelPosition:\'left\',labelSuffix:\'：\',labelWidth:120,gutter:0,menuBtn:true,submitBtn:true,submitText:\'提交\',emptyBtn:true,emptyText:\'清空\',menuPosition:\'center\'}\"', '0', '1.0', '0', 'entfrm', '2021-03-26 23:32:55', '', '2021-03-27 11:55:19', NULL, '0');

-- ----------------------------
-- Table structure for dev_table
-- ----------------------------
DROP TABLE IF EXISTS `dev_table`;
CREATE TABLE `dev_table`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表描述',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `cols` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '24' COMMENT '分栏',
  `gen_api` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成API',
  `gen_way` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '生成方式',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `menu_id` int(11) NULL DEFAULT NULL COMMENT '父级菜单',
  `gen_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成路径',
  `sub_table_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_field` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联子表的外键名',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '0-正常，1-删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dev_table
-- ----------------------------

-- ----------------------------
-- Table structure for intelligent_business_demo
-- ----------------------------
DROP TABLE IF EXISTS `intelligent_business_demo`;
CREATE TABLE `intelligent_business_demo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `business_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_version` float(11, 2) NOT NULL,
  `field1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `field2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `field3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `field4` int(11) NULL DEFAULT NULL,
  `field5` tinyint(4) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of intelligent_business_demo
-- ----------------------------
INSERT INTO `intelligent_business_demo` VALUES (1, '20', 1.10, '测试单行文本数据', '测试多行文本数据', '123456', 10, NULL);

-- ----------------------------
-- Table structure for intelligent_control_steward
-- ----------------------------
DROP TABLE IF EXISTS `intelligent_control_steward`;
CREATE TABLE `intelligent_control_steward`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `control_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '控件唯一Label',
  `control_tag_icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '控件图标',
  `control_mapping_table` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '控件映射表名',
  `control_field_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '控件映射字段类型',
  `control_field_length` int(11) NULL DEFAULT NULL COMMENT '控件映射字段长度',
  `control_attribute` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '控件详细属性',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `control_mapping_table_prepend` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '控件表面前缀',
  `control_mapping_table_suffix` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '控件表面后缀',
  `control_precision` int(11) NULL DEFAULT NULL COMMENT '控件精度',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '控件大管家' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of intelligent_control_steward
-- ----------------------------
INSERT INTO `intelligent_control_steward` VALUES (7, 'el-input', 'input', 'intelligent_controls_input', 'varchar', 255, '{\n    \"config\": {\n      \"label\": \"单行文本\",\n      \"labelWidth\": null,\n      \"showLabel\": true,\n      \"changeTag\": true,\n      \"tag\": \"el-input\",\n      \"tagIcon\": \"input\",\n      \"defaultValue\": \"1001\",\n      \"required\": true,\n      \"layout\": \"colFormItem\",\n      \"span\": 24,\n      \"document\": \"https://element.eleme.cn/#/zh-CN/component/input\",\n      \"regList\": [],\n      \"formId\": 101,\n      \"renderKey\": \"1011616968959836\",\n      \"vModel\": \"field101\"\n    },\n    \"slot\": {\n      \"prepend\": \"\",\n      \"append\": \"\"\n    },\n    \"attrs\": {\n      \"placeholder\": \"请输入单行文本\",\n      \"clearable\": true,\n      \"prefix-icon\": \"\",\n      \"suffix-icon\": \"\",\n      \"maxlength\": null,\n      \"show-word-limit\": false,\n      \"readonly\": false,\n      \"disabled\": false\n    },\n    \"style\": {\n      \"width\": \"100%\"\n    }\n  }', NULL, NULL, NULL, NULL, '单行文本控件', 'intelligent_controls_', 'input', NULL);
INSERT INTO `intelligent_control_steward` VALUES (8, 'el-textarea', 'textarea', 'intelligent_controls_textarea', 'text', 0, '{\n    \"config\": {\n      \"label\": \"多行文本\",\n      \"labelWidth\": null,\n      \"showLabel\": true,\n      \"tag\": \"el-input\",\n      \"tagIcon\": \"textarea\",\n      \"required\": true,\n      \"layout\": \"colFormItem\",\n      \"span\": 24,\n      \"regList\": [],\n      \"changeTag\": true,\n      \"document\": \"https://element.eleme.cn/#/zh-CN/component/input\",\n      \"formId\": 102,\n      \"renderKey\": \"1021616968962388\",\n      \"vModel\": \"field102\"\n    },\n    \"attrs\": {\n      \"type\": \"textarea\",\n      \"placeholder\": \"请输入多行文本\",\n      \"autosize\": {\n        \"minRows\": 4,\n        \"maxRows\": 4\n      },\n      \"maxlength\": null,\n      \"show-word-limit\": false,\n      \"readonly\": false,\n      \"disabled\": false\n    },\n    \"style\": {\n      \"width\": \"100%\"\n    }\n  }', 'entfrm', '2021-03-29 06:13:26', NULL, NULL, '多行文本控件', 'intelligent_controls_', 'textarea', NULL);
INSERT INTO `intelligent_control_steward` VALUES (9, 'el-password', 'password', 'intelligent_controls_password', 'varchar', 255, '{\n    \"config\": {\n      \"label\": \"密码\",\n      \"showLabel\": true,\n      \"labelWidth\": null,\n      \"changeTag\": true,\n      \"tag\": \"el-input\",\n      \"tagIcon\": \"password\",\n      \"defaultValue\": \"86228228\",\n      \"layout\": \"colFormItem\",\n      \"span\": 24,\n      \"required\": true,\n      \"regList\": [],\n      \"document\": \"https://element.eleme.cn/#/zh-CN/component/input\",\n      \"formId\": 103,\n      \"renderKey\": \"1031616968963517\",\n      \"vModel\": \"field103\"\n    },\n    \"slot\": {\n      \"prepend\": \"\",\n      \"append\": \"\"\n    },\n    \"attrs\": {\n      \"placeholder\": \"请输入密码\",\n      \"show-password\": true,\n      \"clearable\": true,\n      \"prefix-icon\": \"\",\n      \"suffix-icon\": \"\",\n      \"maxlength\": null,\n      \"show-word-limit\": false,\n      \"readonly\": false,\n      \"disabled\": false\n    },\n    \"style\": {\n      \"width\": \"100%\"\n    }\n  }', 'entfrm', '2021-03-29 06:15:10', NULL, NULL, '密码控件', 'intelligent_controls_', 'password', NULL);
INSERT INTO `intelligent_control_steward` VALUES (10, 'el-number', 'number', 'intelligent_controls_number', 'int', 11, '{\n    \"config\": {\n      \"label\": \"计数器\",\n      \"showLabel\": true,\n      \"changeTag\": true,\n      \"labelWidth\": null,\n      \"tag\": \"el-input-number\",\n      \"tagIcon\": \"number\",\n      \"span\": 24,\n      \"layout\": \"colFormItem\",\n      \"required\": true,\n      \"regList\": [],\n      \"document\": \"https://element.eleme.cn/#/zh-CN/component/input-number\",\n      \"formId\": 104,\n      \"renderKey\": \"1041616968965203\",\n      \"vModel\": \"field104\"\n    },\n    \"attrs\": {\n      \"placeholder\": \"计数器\",\n      \"step\": 1,\n      \"step-strictly\": false,\n      \"controls-position\": \"\",\n      \"disabled\": false\n    }\n  }', 'entfrm', '2021-03-29 06:16:34', NULL, NULL, '计数器控件', 'intelligent_controls_', 'number', NULL);
INSERT INTO `intelligent_control_steward` VALUES (11, 'el-select', 'select', 'intelligent_controls_select', 'varchar', 225, '{\n    \"config\": {\n      \"label\": \"下拉选择\",\n      \"showLabel\": true,\n      \"labelWidth\": null,\n      \"tag\": \"el-select\",\n      \"tagIcon\": \"select\",\n      \"layout\": \"colFormItem\",\n      \"span\": 24,\n      \"required\": true,\n      \"regList\": [],\n      \"changeTag\": true,\n      \"document\": \"https://element.eleme.cn/#/zh-CN/component/select\",\n      \"formId\": 105,\n      \"renderKey\": \"1051616971076818\",\n      \"vModel\": \"field105\"\n    },\n    \"slot\": {\n      \"options\": [{\n        \"label\": \"选项一\",\n        \"value\": 1\n      }, {\n        \"label\": \"选项二\",\n        \"value\": 2\n      }]\n    },\n    \"attrs\": {\n      \"placeholder\": \"请选择下拉选择\",\n      \"clearable\": true,\n      \"disabled\": false,\n      \"filterable\": false,\n      \"multiple\": false\n    },\n    \"style\": {\n      \"width\": \"100%\"\n    }\n  }', 'entfrm', '2021-03-29 06:39:47', NULL, NULL, '下拉选择控件', 'intelligent_controls_', 'select', NULL);
INSERT INTO `intelligent_control_steward` VALUES (12, 'el-cascader', 'cascader', 'intelligent_controls_cascader', 'varchar', 255, '{\n    \"config\": {\n      \"label\": \"级联选择\",\n      \"url\": \"https://www.fastmock.site/mock/f8d7a54fb1e60561e2f720d5a810009d/fg/cascaderList\",\n      \"method\": \"get\",\n      \"dataKey\": \"list\",\n      \"showLabel\": true,\n      \"labelWidth\": null,\n      \"tag\": \"el-cascader\",\n      \"tagIcon\": \"cascader\",\n      \"layout\": \"colFormItem\",\n      \"defaultValue\": [],\n      \"dataType\": \"dynamic\",\n      \"span\": 24,\n      \"required\": true,\n      \"regList\": [],\n      \"changeTag\": true,\n      \"document\": \"https://element.eleme.cn/#/zh-CN/component/cascader\",\n      \"formId\": 107,\n      \"renderKey\": \"1071616995731384\",\n      \"vModel\": \"field107\"\n    },\n    \"class\": {\n      \"props\": {\n        \"multiple\": false,\n        \"label\": \"label\",\n        \"value\": \"value\",\n        \"children\": \"children\"\n      }\n    },\n    \"style\": {\n      \"width\": \"100%\"\n    },\n    \"attrs\": {\n      \"placeholder\": \"请选择级联选择\",\n      \"show-all-levels\": true,\n      \"disabled\": false,\n      \"clearable\": true,\n      \"filterable\": false,\n      \"separator\": \"/\",\n      \"options\": [{\n        \"id\": 1,\n        \"value\": 1,\n        \"label\": \"选项1\",\n        \"children\": [{\n          \"id\": 2,\n          \"value\": 2,\n          \"label\": \"选项1-1\"\n        }]\n      }]\n    }\n  }', 'entfrm', '2021-03-29 13:31:02', NULL, NULL, '级联选择控件', 'intelligent_controls_', 'cascader', NULL);
INSERT INTO `intelligent_control_steward` VALUES (13, 'el-radio', 'radio', 'intelligent_controls_radio', 'varchar', 255, '{\n    \"config\": {\n      \"label\": \"单选框组\",\n      \"labelWidth\": null,\n      \"showLabel\": true,\n      \"tag\": \"el-radio-group\",\n      \"tagIcon\": \"radio\",\n      \"changeTag\": true,\n      \"layout\": \"colFormItem\",\n      \"span\": 24,\n      \"optionType\": \"default\",\n      \"regList\": [],\n      \"required\": true,\n      \"border\": false,\n      \"document\": \"https://element.eleme.cn/#/zh-CN/component/radio\",\n      \"formId\": 108,\n      \"renderKey\": \"1081616997562143\",\n      \"vModel\": \"field108\"\n    },\n    \"slot\": {\n      \"options\": [{\n        \"label\": \"选项一\",\n        \"value\": 1\n      }, {\n        \"label\": \"选项二\",\n        \"value\": 2\n      }]\n    },\n    \"style\": {},\n    \"attrs\": {\n      \"size\": \"medium\",\n      \"disabled\": false\n    }\n  }', 'entfrm', '2021-03-29 14:04:55', 'entfrm', '2021-03-29 15:23:49', '单选框组控件', 'intelligent_controls_', 'radio', NULL);
INSERT INTO `intelligent_control_steward` VALUES (14, 'el-checkbox', 'checkbox', 'intelligent_controls_checkbox', 'varchar', 225, '{\n    \"config\": {\n      \"label\": \"多选框组\",\n      \"tag\": \"el-checkbox-group\",\n      \"tagIcon\": \"checkbox\",\n      \"defaultValue\": [1, 2],\n      \"span\": 24,\n      \"showLabel\": true,\n      \"labelWidth\": null,\n      \"layout\": \"colFormItem\",\n      \"optionType\": \"default\",\n      \"required\": true,\n      \"regList\": [],\n      \"changeTag\": true,\n      \"border\": false,\n      \"document\": \"https://element.eleme.cn/#/zh-CN/component/checkbox\",\n      \"formId\": 109,\n      \"renderKey\": \"1091616998068178\",\n      \"vModel\": \"field109\"\n    },\n    \"slot\": {\n      \"options\": [{\n        \"label\": \"选项一\",\n        \"value\": 1\n      }, {\n        \"label\": \"选项二\",\n        \"value\": 2\n      }]\n    },\n    \"style\": {},\n    \"attrs\": {\n      \"size\": \"medium\",\n      \"min\": null,\n      \"disabled\": false\n    }\n  }', 'entfrm', '2021-03-29 14:09:54', 'entfrm', '2021-03-30 06:50:59', '多选框组控件', 'intelligent_controls_', 'checkbox', 0);
INSERT INTO `intelligent_control_steward` VALUES (15, 'el-switch', 'switch', 'intelligent_controls_switch', 'tinyint', 1, '{\n    \"config\": {\n      \"label\": \"开关\",\n      \"tag\": \"el-switch\",\n      \"tagIcon\": \"switch\",\n      \"defaultValue\": false,\n      \"span\": 24,\n      \"showLabel\": true,\n      \"labelWidth\": null,\n      \"layout\": \"colFormItem\",\n      \"required\": true,\n      \"regList\": [],\n      \"changeTag\": true,\n      \"document\": \"https://element.eleme.cn/#/zh-CN/component/switch\",\n      \"formId\": 109,\n      \"renderKey\": \"1091616998223676\",\n      \"vModel\": \"field109\"\n    },\n    \"style\": {},\n    \"attrs\": {\n      \"disabled\": false,\n      \"active-text\": \"\",\n      \"inactive-text\": \"\",\n      \"active-color\": null,\n      \"inactive-color\": null,\n      \"active-value\": true,\n      \"inactive-value\": false\n    }\n  }', 'entfrm', '2021-03-29 14:11:23', NULL, NULL, '开关控件', 'intelligent_controls_', 'switch', NULL);
INSERT INTO `intelligent_control_steward` VALUES (16, 'el-slider', 'slider', 'intelligent_controls_slider', 'int', 11, '{\n    \"config\": {\n      \"label\": \"滑块\",\n      \"tag\": \"el-slider\",\n      \"tagIcon\": \"slider\",\n      \"defaultValue\": 0,\n      \"span\": 24,\n      \"showLabel\": true,\n      \"layout\": \"colFormItem\",\n      \"labelWidth\": null,\n      \"required\": true,\n      \"regList\": [],\n      \"changeTag\": true,\n      \"document\": \"https://element.eleme.cn/#/zh-CN/component/slider\",\n      \"formId\": 109,\n      \"renderKey\": \"1091616998293487\",\n      \"vModel\": \"field109\"\n    },\n    \"attrs\": {\n      \"disabled\": false,\n      \"min\": 0,\n      \"max\": 100,\n      \"step\": 1,\n      \"show-stops\": false,\n      \"range\": false\n    }\n  }', 'entfrm', '2021-03-29 14:12:37', NULL, NULL, '滑块控件', 'intelligent_controls_', 'slider', NULL);
INSERT INTO `intelligent_control_steward` VALUES (17, 'el-time', 'time', 'intelligent_controls_time', 'varchar', 255, '{\n    \"config\": {\n      \"label\": \"时间选择\",\n      \"tag\": \"el-time-picker\",\n      \"tagIcon\": \"time\",\n      \"defaultValue\": null,\n      \"span\": 24,\n      \"showLabel\": true,\n      \"layout\": \"colFormItem\",\n      \"labelWidth\": null,\n      \"required\": true,\n      \"regList\": [],\n      \"changeTag\": true,\n      \"document\": \"https://element.eleme.cn/#/zh-CN/component/time-picker\",\n      \"formId\": 109,\n      \"renderKey\": \"1091616998504572\",\n      \"vModel\": \"field109\"\n    },\n    \"attrs\": {\n      \"placeholder\": \"请选择时间选择\",\n      \"disabled\": false,\n      \"clearable\": true,\n      \"picker-options\": {\n        \"selectableRange\": \"00:00:00-23:59:59\"\n      },\n      \"format\": \"HH:mm:ss\",\n      \"value-format\": \"HH:mm:ss\"\n    },\n    \"style\": {\n      \"width\": \"100%\"\n    }\n  }', 'entfrm', '2021-03-29 14:16:51', 'entfrm', '2021-03-29 18:07:11', '时间选择控件', 'intelligent_controls_', 'time', NULL);
INSERT INTO `intelligent_control_steward` VALUES (18, 'el-time-range', 'time-range', 'intelligent_controls_time_range', 'varchar', 255, '{\n    \"config\": {\n      \"label\": \"时间范围\",\n      \"tag\": \"el-time-picker\",\n      \"tagIcon\": \"time-range\",\n      \"span\": 24,\n      \"showLabel\": true,\n      \"labelWidth\": null,\n      \"layout\": \"colFormItem\",\n      \"defaultValue\": null,\n      \"required\": true,\n      \"regList\": [],\n      \"changeTag\": true,\n      \"document\": \"https://element.eleme.cn/#/zh-CN/component/time-picker\",\n      \"formId\": 110,\n      \"renderKey\": \"1101616998507819\",\n      \"vModel\": \"field110\"\n    },\n    \"style\": {\n      \"width\": \"100%\"\n    },\n    \"attrs\": {\n      \"disabled\": false,\n      \"clearable\": true,\n      \"is-range\": true,\n      \"range-separator\": \"至\",\n      \"start-placeholder\": \"开始时间\",\n      \"end-placeholder\": \"结束时间\",\n      \"format\": \"HH:mm:ss\",\n      \"value-format\": \"HH:mm:ss\"\n    }\n  }', 'entfrm', '2021-03-29 14:18:10', 'entfrm', '2021-03-29 17:59:25', '时间范围控件', 'intelligent_controls_', 'time_range', NULL);
INSERT INTO `intelligent_control_steward` VALUES (19, 'el-date', 'date', 'intelligent_controls_date', 'datetime', 0, '{\n    \"config\": {\n      \"label\": \"日期选择\",\n      \"tag\": \"el-date-picker\",\n      \"tagIcon\": \"date\",\n      \"defaultValue\": null,\n      \"showLabel\": true,\n      \"labelWidth\": null,\n      \"span\": 24,\n      \"layout\": \"colFormItem\",\n      \"required\": true,\n      \"regList\": [],\n      \"changeTag\": true,\n      \"document\": \"https://element.eleme.cn/#/zh-CN/component/date-picker\",\n      \"formId\": 111,\n      \"renderKey\": \"1111616998509005\",\n      \"vModel\": \"field111\"\n    },\n    \"attrs\": {\n      \"placeholder\": \"请选择日期选择\",\n      \"type\": \"date\",\n      \"disabled\": false,\n      \"clearable\": true,\n      \"format\": \"yyyy-MM-dd\",\n      \"value-format\": \"yyyy-MM-dd\",\n      \"readonly\": false\n    },\n    \"style\": {\n      \"width\": \"100%\"\n    }\n  }', 'entfrm', '2021-03-29 14:19:25', NULL, NULL, '日期选择控件', 'intelligent_controls_', 'date', NULL);
INSERT INTO `intelligent_control_steward` VALUES (20, 'el-date-range', 'date-range', 'intelligent_controls_date_range', 'varchar', 255, '{\n    \"config\": {\n      \"label\": \"日期范围\",\n      \"tag\": \"el-date-picker\",\n      \"tagIcon\": \"date-range\",\n      \"defaultValue\": null,\n      \"span\": 24,\n      \"showLabel\": true,\n      \"labelWidth\": null,\n      \"required\": true,\n      \"layout\": \"colFormItem\",\n      \"regList\": [],\n      \"changeTag\": true,\n      \"document\": \"https://element.eleme.cn/#/zh-CN/component/date-picker\",\n      \"formId\": 112,\n      \"renderKey\": \"1121616998510073\",\n      \"vModel\": \"field112\"\n    },\n    \"style\": {\n      \"width\": \"100%\"\n    },\n    \"attrs\": {\n      \"type\": \"daterange\",\n      \"range-separator\": \"至\",\n      \"start-placeholder\": \"开始日期\",\n      \"end-placeholder\": \"结束日期\",\n      \"disabled\": false,\n      \"clearable\": true,\n      \"format\": \"yyyy-MM-dd\",\n      \"value-format\": \"yyyy-MM-dd\",\n      \"readonly\": false\n    }\n  }', 'entfrm', '2021-03-29 14:20:34', 'entfrm', '2021-03-29 17:59:40', '日期范围控件', 'intelligent_controls_', 'date_range', NULL);
INSERT INTO `intelligent_control_steward` VALUES (21, 'el-rate', 'rate', 'intelligent_controls_rate', 'double', 16, '{\n    \"config\": {\n      \"label\": \"评分\",\n      \"tag\": \"el-rate\",\n      \"tagIcon\": \"rate\",\n      \"defaultValue\": 0,\n      \"span\": 24,\n      \"showLabel\": true,\n      \"labelWidth\": null,\n      \"layout\": \"colFormItem\",\n      \"required\": true,\n      \"regList\": [],\n      \"changeTag\": true,\n      \"document\": \"https://element.eleme.cn/#/zh-CN/component/rate\",\n      \"formId\": 113,\n      \"renderKey\": \"1131616998511488\",\n      \"vModel\": \"field113\"\n    },\n    \"style\": {},\n    \"attrs\": {\n      \"max\": 5,\n      \"allow-half\": false,\n      \"show-text\": false,\n      \"show-score\": false,\n      \"disabled\": false\n    }\n  }', 'entfrm', '2021-03-29 14:22:02', 'entfrm', '2021-03-29 18:45:03', '评分组件', 'intelligent_controls_', 'rate', 2);
INSERT INTO `intelligent_control_steward` VALUES (22, 'el-color', 'color', 'intelligent_controls_color', 'varchar', 225, '{\n    \"config\": {\n      \"label\": \"颜色选择\",\n      \"tag\": \"el-color-picker\",\n      \"tagIcon\": \"color\",\n      \"span\": 24,\n      \"defaultValue\": null,\n      \"showLabel\": true,\n      \"labelWidth\": null,\n      \"layout\": \"colFormItem\",\n      \"required\": true,\n      \"regList\": [],\n      \"changeTag\": true,\n      \"document\": \"https://element.eleme.cn/#/zh-CN/component/color-picker\",\n      \"formId\": 114,\n      \"renderKey\": \"1141616998513045\",\n      \"vModel\": \"field114\"\n    },\n    \"attrs\": {\n      \"show-alpha\": false,\n      \"color-format\": \"\",\n      \"disabled\": false,\n      \"size\": \"medium\"\n    }\n  }', 'entfrm', '2021-03-29 14:22:49', NULL, NULL, '颜色选择控件', 'intelligent_controls_', 'color', NULL);

-- ----------------------------
-- Table structure for intelligent_controls_cascader
-- ----------------------------
DROP TABLE IF EXISTS `intelligent_controls_cascader`;
CREATE TABLE `intelligent_controls_cascader`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attrs_placeholder` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `attrs_options` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `config_document` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_render_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_v_model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_show_label` tinyint(1) NULL DEFAULT NULL,
  `config_required` tinyint(1) NULL DEFAULT NULL,
  `attrs_clearable` tinyint(1) NULL DEFAULT NULL,
  `class_props_children` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_tag_icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_default_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `config_reg_list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `config_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_label_width` int(11) NULL DEFAULT NULL,
  `config_form_id` int(11) NULL DEFAULT NULL,
  `config_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_data_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `attrs_filterable` tinyint(1) NULL DEFAULT NULL,
  `config_layout` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `attrs_separator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_span` int(11) NULL DEFAULT NULL,
  `attrs_disabled` tinyint(1) NULL DEFAULT NULL,
  `style_width` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_data_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `class_props_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_change_tag` tinyint(1) NULL DEFAULT NULL,
  `class_props_multiple` tinyint(1) NULL DEFAULT NULL,
  `attrs_show_all_levels` tinyint(1) NULL DEFAULT NULL,
  `class_props_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `field_length` int(11) NULL DEFAULT NULL,
  `field_current` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `data_mapping_table` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `form_extend_id` int(11) NULL DEFAULT NULL,
  `data_mapping_table_prefix` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `data_mapping_table_suffix` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of intelligent_controls_cascader
-- ----------------------------

-- ----------------------------
-- Table structure for intelligent_controls_checkbox
-- ----------------------------
DROP TABLE IF EXISTS `intelligent_controls_checkbox`;
CREATE TABLE `intelligent_controls_checkbox`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `config_default_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `config_reg_list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `slot_options` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `config_label_width` int(11) NULL DEFAULT NULL,
  `config_form_id` int(11) NULL DEFAULT NULL,
  `attrs_min` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_border` tinyint(1) NULL DEFAULT NULL,
  `config_layout` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `attrs_size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_document` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_span` int(11) NULL DEFAULT NULL,
  `config_option_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_render_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `attrs_disabled` tinyint(1) NULL DEFAULT NULL,
  `config_v_model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_show_label` tinyint(1) NULL DEFAULT NULL,
  `config_required` tinyint(1) NULL DEFAULT NULL,
  `config_change_tag` tinyint(1) NULL DEFAULT NULL,
  `config_tag_icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `field_length` int(11) NULL DEFAULT NULL,
  `field_current` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `data_mapping_table` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `form_extend_id` int(11) NULL DEFAULT NULL,
  `data_mapping_table_prefix` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `data_mapping_table_suffix` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of intelligent_controls_checkbox
-- ----------------------------

-- ----------------------------
-- Table structure for intelligent_controls_color
-- ----------------------------
DROP TABLE IF EXISTS `intelligent_controls_color`;
CREATE TABLE `intelligent_controls_color`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `config_default_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_reg_list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `config_label_width` int(11) NULL DEFAULT NULL,
  `config_form_id` int(11) NULL DEFAULT NULL,
  `config_layout` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `attrs_size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_document` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_span` int(11) NULL DEFAULT NULL,
  `config_render_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `attrs_disabled` tinyint(1) NULL DEFAULT NULL,
  `config_v_model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_show_label` tinyint(1) NULL DEFAULT NULL,
  `config_required` tinyint(1) NULL DEFAULT NULL,
  `config_change_tag` tinyint(1) NULL DEFAULT NULL,
  `config_tag_icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `attrs_show_alpha` tinyint(1) NULL DEFAULT NULL,
  `attrs_color_format` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `field_length` int(11) NULL DEFAULT NULL,
  `field_current` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `data_mapping_table` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `form_extend_id` int(11) NULL DEFAULT NULL,
  `data_mapping_table_prefix` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `data_mapping_table_suffix` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of intelligent_controls_color
-- ----------------------------

-- ----------------------------
-- Table structure for intelligent_controls_date
-- ----------------------------
DROP TABLE IF EXISTS `intelligent_controls_date`;
CREATE TABLE `intelligent_controls_date`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `config_default_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `attrs_placeholder` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_reg_list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `attrs_value_format` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `attrs_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_label_width` int(11) NULL DEFAULT NULL,
  `config_form_id` int(11) NULL DEFAULT NULL,
  `attrs_readonly` tinyint(1) NULL DEFAULT NULL,
  `config_layout` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_document` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_span` int(11) NULL DEFAULT NULL,
  `config_render_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `attrs_disabled` tinyint(1) NULL DEFAULT NULL,
  `style_width` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_v_model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_show_label` tinyint(1) NULL DEFAULT NULL,
  `config_required` tinyint(1) NULL DEFAULT NULL,
  `attrs_clearable` tinyint(1) NULL DEFAULT NULL,
  `config_change_tag` tinyint(1) NULL DEFAULT NULL,
  `config_tag_icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `attrs_format` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `field_length` int(11) NULL DEFAULT NULL,
  `field_current` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `data_mapping_table` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `form_extend_id` int(11) NULL DEFAULT NULL,
  `data_mapping_table_prefix` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `data_mapping_table_suffix` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of intelligent_controls_date
-- ----------------------------

-- ----------------------------
-- Table structure for intelligent_controls_date_range
-- ----------------------------
DROP TABLE IF EXISTS `intelligent_controls_date_range`;
CREATE TABLE `intelligent_controls_date_range`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attrs_value_format` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `attrs_readonly` tinyint(1) NULL DEFAULT NULL,
  `config_tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `attrs_start_placeholder` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_document` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_render_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_v_model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_show_label` tinyint(1) NULL DEFAULT NULL,
  `config_required` tinyint(1) NULL DEFAULT NULL,
  `attrs_clearable` tinyint(1) NULL DEFAULT NULL,
  `config_tag_icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `attrs_format` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_default_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_reg_list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `attrs_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_label_width` int(11) NULL DEFAULT NULL,
  `config_form_id` int(11) NULL DEFAULT NULL,
  `config_layout` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `attrs_range_separator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_span` int(11) NULL DEFAULT NULL,
  `attrs_disabled` tinyint(1) NULL DEFAULT NULL,
  `style_width` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `attrs_end_placeholder` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_change_tag` tinyint(1) NULL DEFAULT NULL,
  `field_length` int(11) NULL DEFAULT NULL,
  `field_current` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `data_mapping_table` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `form_extend_id` int(11) NULL DEFAULT NULL,
  `data_mapping_table_prefix` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `data_mapping_table_suffix` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of intelligent_controls_date_range
-- ----------------------------

-- ----------------------------
-- Table structure for intelligent_controls_input
-- ----------------------------
DROP TABLE IF EXISTS `intelligent_controls_input`;
CREATE TABLE `intelligent_controls_input`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attrs_placeholder` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `attrs_readonly` tinyint(1) NULL DEFAULT NULL,
  `config_tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_document` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_render_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_v_model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_show_label` tinyint(1) NULL DEFAULT NULL,
  `config_required` tinyint(1) NULL DEFAULT NULL,
  `attrs_clearable` tinyint(1) NULL DEFAULT NULL,
  `config_tag_icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `attrs_suffix_icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_default_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_reg_list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `attrs_maxlength` int(11) NULL DEFAULT NULL,
  `config_label_width` int(11) NULL DEFAULT NULL,
  `config_form_id` int(11) NULL DEFAULT NULL,
  `config_layout` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_span` int(11) NULL DEFAULT NULL,
  `attrs_prefix_icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `attrs_disabled` tinyint(1) NULL DEFAULT NULL,
  `style_width` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `slot_prepend` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_change_tag` tinyint(1) NULL DEFAULT NULL,
  `slot_append` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `attrs_show_word_limit` tinyint(1) NULL DEFAULT NULL,
  `field_length` int(11) NULL DEFAULT NULL,
  `field_current` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `data_mapping_table` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `form_extend_id` int(11) NULL DEFAULT NULL,
  `data_mapping_table_prefix` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `data_mapping_table_suffix` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 94 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of intelligent_controls_input
-- ----------------------------
INSERT INTO `intelligent_controls_input` VALUES (93, '请输入单行文本', 0, 'el-input', 'https://element.eleme.cn/#/zh-CN/component/input', '1011617062740739', 'field101', 1, 1, 1, 'input', NULL, '单行文本', '1001', NULL, NULL, NULL, 101, 'colFormItem', 24, NULL, 0, '100%', NULL, 1, NULL, 0, 5, 'field1', 'intelligent_business_demo', 'entfrm', '2021-03-30 08:05:59', 36, 'intelligent_business_', 'demo');

-- ----------------------------
-- Table structure for intelligent_controls_number
-- ----------------------------
DROP TABLE IF EXISTS `intelligent_controls_number`;
CREATE TABLE `intelligent_controls_number`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attrs_placeholder` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_reg_list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `config_label_width` int(11) NULL DEFAULT NULL,
  `config_form_id` int(11) NULL DEFAULT NULL,
  `attrs_step_strictly` tinyint(1) NULL DEFAULT NULL,
  `config_layout` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_document` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_span` int(11) NULL DEFAULT NULL,
  `attrs_controls_position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_render_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `attrs_disabled` tinyint(1) NULL DEFAULT NULL,
  `config_v_model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_show_label` tinyint(1) NULL DEFAULT NULL,
  `config_required` tinyint(1) NULL DEFAULT NULL,
  `config_change_tag` tinyint(1) NULL DEFAULT NULL,
  `config_tag_icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `attrs_step` int(11) NULL DEFAULT NULL,
  `config_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `field_length` int(11) NULL DEFAULT NULL,
  `field_current` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `data_mapping_table` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `form_extend_id` int(11) NULL DEFAULT NULL,
  `data_mapping_table_prefix` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `data_mapping_table_suffix` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of intelligent_controls_number
-- ----------------------------
INSERT INTO `intelligent_controls_number` VALUES (5, '计数器', NULL, NULL, 104, 0, 'colFormItem', 'el-input-number', 'https://element.eleme.cn/#/zh-CN/component/input-number', 24, NULL, '1041617062744859', 0, 'field104', 1, 1, 1, 'number', 1, '计数器', 5, 'field4', 'intelligent_business_demo', 'entfrm', '2021-03-30 08:05:59', 36, 'intelligent_business_', 'demo');

-- ----------------------------
-- Table structure for intelligent_controls_password
-- ----------------------------
DROP TABLE IF EXISTS `intelligent_controls_password`;
CREATE TABLE `intelligent_controls_password`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attrs_placeholder` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `attrs_readonly` tinyint(1) NULL DEFAULT NULL,
  `config_tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_document` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_render_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_v_model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_show_label` tinyint(1) NULL DEFAULT NULL,
  `config_required` tinyint(1) NULL DEFAULT NULL,
  `attrs_clearable` tinyint(1) NULL DEFAULT NULL,
  `config_tag_icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `attrs_suffix_icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_default_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_reg_list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `attrs_maxlength` int(11) NULL DEFAULT NULL,
  `config_label_width` int(11) NULL DEFAULT NULL,
  `config_form_id` int(11) NULL DEFAULT NULL,
  `config_layout` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_span` int(11) NULL DEFAULT NULL,
  `attrs_prefix_icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `attrs_disabled` tinyint(1) NULL DEFAULT NULL,
  `style_width` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `slot_prepend` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_change_tag` tinyint(1) NULL DEFAULT NULL,
  `attrs_show_password` tinyint(1) NULL DEFAULT NULL,
  `slot_append` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `attrs_show_word_limit` tinyint(1) NULL DEFAULT NULL,
  `field_length` int(11) NULL DEFAULT NULL,
  `field_current` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `data_mapping_table` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `form_extend_id` int(11) NULL DEFAULT NULL,
  `data_mapping_table_prefix` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `data_mapping_table_suffix` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of intelligent_controls_password
-- ----------------------------
INSERT INTO `intelligent_controls_password` VALUES (21, '请输入密码', 0, 'el-input', 'https://element.eleme.cn/#/zh-CN/component/input', '1031617062743482', 'field103', 1, 1, 1, 'password', NULL, '密码', '86228228', NULL, NULL, NULL, 103, 'colFormItem', 24, NULL, 0, '100%', NULL, 1, 1, NULL, 0, 5, 'field3', 'intelligent_business_demo', 'entfrm', '2021-03-30 08:05:59', 36, 'intelligent_business_', 'demo');

-- ----------------------------
-- Table structure for intelligent_controls_radio
-- ----------------------------
DROP TABLE IF EXISTS `intelligent_controls_radio`;
CREATE TABLE `intelligent_controls_radio`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `config_reg_list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `slot_options` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `config_label_width` int(11) NULL DEFAULT NULL,
  `config_form_id` int(11) NULL DEFAULT NULL,
  `config_border` tinyint(1) NULL DEFAULT NULL,
  `config_layout` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `attrs_size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_document` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_span` int(11) NULL DEFAULT NULL,
  `config_option_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_render_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `attrs_disabled` tinyint(1) NULL DEFAULT NULL,
  `config_v_model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_show_label` tinyint(1) NULL DEFAULT NULL,
  `config_required` tinyint(1) NULL DEFAULT NULL,
  `config_change_tag` tinyint(1) NULL DEFAULT NULL,
  `config_tag_icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `field_length` int(11) NULL DEFAULT NULL,
  `field_current` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `data_mapping_table` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `form_extend_id` int(11) NULL DEFAULT NULL,
  `data_mapping_table_prefix` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `data_mapping_table_suffix` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of intelligent_controls_radio
-- ----------------------------

-- ----------------------------
-- Table structure for intelligent_controls_rate
-- ----------------------------
DROP TABLE IF EXISTS `intelligent_controls_rate`;
CREATE TABLE `intelligent_controls_rate`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `config_default_value` int(11) NULL DEFAULT NULL,
  `config_reg_list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `config_label_width` int(11) NULL DEFAULT NULL,
  `config_form_id` int(11) NULL DEFAULT NULL,
  `config_layout` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `attrs_show_score` tinyint(1) NULL DEFAULT NULL,
  `config_document` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_span` int(11) NULL DEFAULT NULL,
  `config_render_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `attrs_allow_half` tinyint(1) NULL DEFAULT NULL,
  `attrs_disabled` tinyint(1) NULL DEFAULT NULL,
  `config_v_model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `attrs_max` int(11) NULL DEFAULT NULL,
  `config_show_label` tinyint(1) NULL DEFAULT NULL,
  `config_required` tinyint(1) NULL DEFAULT NULL,
  `attrs_show_text` tinyint(1) NULL DEFAULT NULL,
  `config_change_tag` tinyint(1) NULL DEFAULT NULL,
  `config_tag_icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `field_length` int(11) NULL DEFAULT NULL,
  `field_current` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `data_mapping_table` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `form_extend_id` int(11) NULL DEFAULT NULL,
  `data_mapping_table_prefix` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `data_mapping_table_suffix` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of intelligent_controls_rate
-- ----------------------------

-- ----------------------------
-- Table structure for intelligent_controls_select
-- ----------------------------
DROP TABLE IF EXISTS `intelligent_controls_select`;
CREATE TABLE `intelligent_controls_select`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attrs_placeholder` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_reg_list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `slot_options` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `config_label_width` int(11) NULL DEFAULT NULL,
  `config_form_id` int(11) NULL DEFAULT NULL,
  `attrs_filterable` tinyint(1) NULL DEFAULT NULL,
  `config_layout` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_document` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_span` int(11) NULL DEFAULT NULL,
  `config_render_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `attrs_disabled` tinyint(1) NULL DEFAULT NULL,
  `style_width` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_v_model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_show_label` tinyint(1) NULL DEFAULT NULL,
  `config_required` tinyint(1) NULL DEFAULT NULL,
  `attrs_clearable` tinyint(1) NULL DEFAULT NULL,
  `config_change_tag` tinyint(1) NULL DEFAULT NULL,
  `config_tag_icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `attrs_multiple` tinyint(1) NULL DEFAULT NULL,
  `config_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `field_length` int(11) NULL DEFAULT NULL,
  `field_current` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `data_mapping_table` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `form_extend_id` int(11) NULL DEFAULT NULL,
  `data_mapping_table_prefix` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `data_mapping_table_suffix` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of intelligent_controls_select
-- ----------------------------

-- ----------------------------
-- Table structure for intelligent_controls_slider
-- ----------------------------
DROP TABLE IF EXISTS `intelligent_controls_slider`;
CREATE TABLE `intelligent_controls_slider`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `config_default_value` int(11) NULL DEFAULT NULL,
  `config_reg_list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `attrs_show_stops` tinyint(1) NULL DEFAULT NULL,
  `config_label_width` int(11) NULL DEFAULT NULL,
  `config_form_id` int(11) NULL DEFAULT NULL,
  `attrs_min` int(11) NULL DEFAULT NULL,
  `config_layout` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_document` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_span` int(11) NULL DEFAULT NULL,
  `config_render_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `attrs_disabled` tinyint(1) NULL DEFAULT NULL,
  `config_v_model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `attrs_max` int(11) NULL DEFAULT NULL,
  `attrs_range` tinyint(1) NULL DEFAULT NULL,
  `config_show_label` tinyint(1) NULL DEFAULT NULL,
  `config_required` tinyint(1) NULL DEFAULT NULL,
  `config_change_tag` tinyint(1) NULL DEFAULT NULL,
  `config_tag_icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `attrs_step` int(11) NULL DEFAULT NULL,
  `config_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `field_length` int(11) NULL DEFAULT NULL,
  `field_current` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `data_mapping_table` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `form_extend_id` int(11) NULL DEFAULT NULL,
  `data_mapping_table_prefix` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `data_mapping_table_suffix` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of intelligent_controls_slider
-- ----------------------------

-- ----------------------------
-- Table structure for intelligent_controls_switch
-- ----------------------------
DROP TABLE IF EXISTS `intelligent_controls_switch`;
CREATE TABLE `intelligent_controls_switch`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `config_default_value` tinyint(1) NULL DEFAULT NULL,
  `config_reg_list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `config_label_width` int(11) NULL DEFAULT NULL,
  `attrs_active_value` tinyint(1) NULL DEFAULT NULL,
  `config_form_id` int(11) NULL DEFAULT NULL,
  `config_layout` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `attrs_active_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `attrs_active_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_document` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_span` int(11) NULL DEFAULT NULL,
  `config_render_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `attrs_disabled` tinyint(1) NULL DEFAULT NULL,
  `config_v_model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_show_label` tinyint(1) NULL DEFAULT NULL,
  `config_required` tinyint(1) NULL DEFAULT NULL,
  `config_change_tag` tinyint(1) NULL DEFAULT NULL,
  `attrs_inactive_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_tag_icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `attrs_inactive_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `attrs_inactive_value` tinyint(1) NULL DEFAULT NULL,
  `config_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `field_length` int(11) NULL DEFAULT NULL,
  `field_current` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `data_mapping_table` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `form_extend_id` int(11) NULL DEFAULT NULL,
  `data_mapping_table_prefix` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `data_mapping_table_suffix` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of intelligent_controls_switch
-- ----------------------------

-- ----------------------------
-- Table structure for intelligent_controls_textarea
-- ----------------------------
DROP TABLE IF EXISTS `intelligent_controls_textarea`;
CREATE TABLE `intelligent_controls_textarea`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attrs_placeholder` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_reg_list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `attrs_maxlength` int(11) NULL DEFAULT NULL,
  `attrs_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_label_width` int(11) NULL DEFAULT NULL,
  `config_form_id` int(11) NULL DEFAULT NULL,
  `attrs_readonly` tinyint(1) NULL DEFAULT NULL,
  `config_layout` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_document` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_span` int(11) NULL DEFAULT NULL,
  `config_render_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `attrs_autosize_min_rows` int(11) NULL DEFAULT NULL,
  `attrs_autosize_max_rows` int(11) NULL DEFAULT NULL,
  `attrs_disabled` tinyint(1) NULL DEFAULT NULL,
  `style_width` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_v_model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_show_label` tinyint(1) NULL DEFAULT NULL,
  `config_required` tinyint(1) NULL DEFAULT NULL,
  `config_change_tag` tinyint(1) NULL DEFAULT NULL,
  `config_tag_icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `attrs_show_word_limit` tinyint(1) NULL DEFAULT NULL,
  `config_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `field_length` int(11) NULL DEFAULT NULL,
  `field_current` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `data_mapping_table` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `form_extend_id` int(11) NULL DEFAULT NULL,
  `data_mapping_table_prefix` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `data_mapping_table_suffix` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of intelligent_controls_textarea
-- ----------------------------
INSERT INTO `intelligent_controls_textarea` VALUES (24, '请输入多行文本', NULL, NULL, 'textarea', NULL, 102, 0, 'colFormItem', 'el-input', 'https://element.eleme.cn/#/zh-CN/component/input', 24, '1021617062742139', 4, 4, 0, '100%', 'field102', 1, 1, 1, 'textarea', 0, '多行文本', 5, 'field2', 'intelligent_business_demo', 'entfrm', '2021-03-30 08:05:59', 36, 'intelligent_business_', 'demo');

-- ----------------------------
-- Table structure for intelligent_controls_time
-- ----------------------------
DROP TABLE IF EXISTS `intelligent_controls_time`;
CREATE TABLE `intelligent_controls_time`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `config_default_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `attrs_picker_options_selectable_range` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `attrs_placeholder` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_reg_list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `attrs_value_format` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_label_width` int(11) NULL DEFAULT NULL,
  `config_form_id` int(11) NULL DEFAULT NULL,
  `config_layout` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_document` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_span` int(11) NULL DEFAULT NULL,
  `config_render_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `attrs_disabled` tinyint(1) NULL DEFAULT NULL,
  `style_width` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_v_model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_show_label` tinyint(1) NULL DEFAULT NULL,
  `config_required` tinyint(1) NULL DEFAULT NULL,
  `attrs_clearable` tinyint(1) NULL DEFAULT NULL,
  `config_change_tag` tinyint(1) NULL DEFAULT NULL,
  `config_tag_icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `attrs_format` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `field_length` int(11) NULL DEFAULT NULL,
  `field_current` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `data_mapping_table` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `form_extend_id` int(11) NULL DEFAULT NULL,
  `data_mapping_table_prefix` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `data_mapping_table_suffix` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of intelligent_controls_time
-- ----------------------------

-- ----------------------------
-- Table structure for intelligent_controls_time_range
-- ----------------------------
DROP TABLE IF EXISTS `intelligent_controls_time_range`;
CREATE TABLE `intelligent_controls_time_range`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `config_default_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_reg_list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `attrs_value_format` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_label_width` int(11) NULL DEFAULT NULL,
  `config_form_id` int(11) NULL DEFAULT NULL,
  `config_layout` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `attrs_range_separator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `attrs_start_placeholder` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_document` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_span` int(11) NULL DEFAULT NULL,
  `config_render_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `attrs_disabled` tinyint(1) NULL DEFAULT NULL,
  `style_width` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_v_model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `attrs_end_placeholder` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_show_label` tinyint(1) NULL DEFAULT NULL,
  `config_required` tinyint(1) NULL DEFAULT NULL,
  `attrs_clearable` tinyint(1) NULL DEFAULT NULL,
  `config_change_tag` tinyint(1) NULL DEFAULT NULL,
  `config_tag_icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `attrs_format` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `config_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `attrs_is_range` tinyint(1) NULL DEFAULT NULL,
  `field_length` int(11) NULL DEFAULT NULL,
  `field_current` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `data_mapping_table` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `form_extend_id` int(11) NULL DEFAULT NULL,
  `data_mapping_table_prefix` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `data_mapping_table_suffix` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of intelligent_controls_time_range
-- ----------------------------

-- ----------------------------
-- Table structure for intelligent_data_conf
-- ----------------------------
DROP TABLE IF EXISTS `intelligent_data_conf`;
CREATE TABLE `intelligent_data_conf`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '数据配置ID',
  `form_extend_id` int(11) NULL DEFAULT NULL COMMENT '表单扩展id',
  `data_mapping_table_prepend` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '数据映射表前缀',
  `data_mapping_table` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '数据映射表名-自定义填写-后缀',
  `field_length` int(11) NULL DEFAULT NULL COMMENT '字段数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of intelligent_data_conf
-- ----------------------------
INSERT INTO `intelligent_data_conf` VALUES (20, 36, 'intelligent_business_', 'demo', 5);

-- ----------------------------
-- Table structure for intelligent_demo_user
-- ----------------------------
DROP TABLE IF EXISTS `intelligent_demo_user`;
CREATE TABLE `intelligent_demo_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone` int(11) NULL DEFAULT NULL,
  `remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of intelligent_demo_user
-- ----------------------------
INSERT INTO `intelligent_demo_user` VALUES (20, '测试用户', 123456789, '测试');

-- ----------------------------
-- Table structure for intelligent_form_extend
-- ----------------------------
DROP TABLE IF EXISTS `intelligent_form_extend`;
CREATE TABLE `intelligent_form_extend`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表单扩展模板编码',
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '表单扩展编码',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '表单扩展模板名称',
  `drawing_controls` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '渲染控件数据集合',
  `id_global` int(11) NULL DEFAULT NULL COMMENT '记录目前控件全局ID-自增长',
  `tree_node_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '级联下拉树形选项局部ID-内部标识-目前实现控件独立',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '表单扩展创建用户',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '表单扩展插件时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '表单扩展修改用户\n',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '表单扩展修改时间',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '表单扩展备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '表单扩展表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of intelligent_form_extend
-- ----------------------------
INSERT INTO `intelligent_form_extend` VALUES (36, 'form1', '表单案例模板', '[{\"slot\":{\"prepend\":\"\",\"append\":\"\"},\"attrs\":{\"clearable\":true,\"prefix-icon\":\"\",\"readonly\":false,\"disabled\":false,\"placeholder\":\"请输入单行文本\",\"show-word-limit\":false,\"suffix-icon\":\"\"},\"style\":{\"width\":\"100%\"},\"config\":{\"formId\":101,\"defaultValue\":\"1001\",\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"label\":\"单行文本\",\"showLabel\":true,\"required\":true,\"renderKey\":\"1011617062740739\",\"layout\":\"colFormItem\",\"tagIcon\":\"input\",\"changeTag\":true,\"tag\":\"el-input\",\"regList\":[],\"span\":24,\"vModel\":\"field101\"}},{\"attrs\":{\"type\":\"textarea\",\"readonly\":false,\"disabled\":false,\"placeholder\":\"请输入多行文本\",\"show-word-limit\":false,\"autosize\":{\"minRows\":4,\"maxRows\":4}},\"style\":{\"width\":\"100%\"},\"config\":{\"formId\":102,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"label\":\"多行文本\",\"showLabel\":true,\"required\":true,\"renderKey\":\"1021617062742139\",\"layout\":\"colFormItem\",\"tagIcon\":\"textarea\",\"changeTag\":true,\"tag\":\"el-input\",\"regList\":[],\"span\":24,\"vModel\":\"field102\"}},{\"slot\":{\"prepend\":\"\",\"append\":\"\"},\"attrs\":{\"clearable\":true,\"prefix-icon\":\"\",\"show-password\":true,\"readonly\":false,\"disabled\":false,\"placeholder\":\"请输入密码\",\"show-word-limit\":false,\"suffix-icon\":\"\"},\"style\":{\"width\":\"100%\"},\"config\":{\"formId\":103,\"defaultValue\":\"86228228\",\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"label\":\"密码\",\"showLabel\":true,\"required\":true,\"renderKey\":\"1031617062743482\",\"layout\":\"colFormItem\",\"tagIcon\":\"password\",\"changeTag\":true,\"tag\":\"el-input\",\"regList\":[],\"span\":24,\"vModel\":\"field103\"}},{\"attrs\":{\"step-strictly\":false,\"controls-position\":\"\",\"step\":1,\"disabled\":false,\"placeholder\":\"计数器\"},\"config\":{\"formId\":104,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input-number\",\"label\":\"计数器\",\"showLabel\":true,\"required\":true,\"renderKey\":\"1041617062744859\",\"layout\":\"colFormItem\",\"tagIcon\":\"number\",\"changeTag\":true,\"tag\":\"el-input-number\",\"regList\":[],\"span\":24,\"vModel\":\"field104\"}}]', 104, '', 'entfrm', '2021-03-30 08:04:19', 'entfrm', '2021-03-30 08:04:32', '表单扩展模板');
INSERT INTO `intelligent_form_extend` VALUES (37, 'form2', '表单模板备用', NULL, NULL, NULL, 'entfrm', '2021-03-30 08:05:08', NULL, NULL, '表单模板备用');
INSERT INTO `intelligent_form_extend` VALUES (38, 'form3', '表单模板测试', NULL, NULL, NULL, 'entfrm', '2021-03-30 08:05:29', NULL, NULL, '表单模板测试');

-- ----------------------------
-- Table structure for oauth_client_details
-- ----------------------------
DROP TABLE IF EXISTS `oauth_client_details`;
CREATE TABLE `oauth_client_details`  (
  `client_id` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `resource_ids` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `client_secret` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `scope` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `authorized_grant_types` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `web_server_redirect_uri` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `authorities` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `access_token_validity` int(11) NULL DEFAULT NULL,
  `refresh_token_validity` int(11) NULL DEFAULT NULL,
  `additional_information` varchar(4096) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `autoapprove` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`client_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oauth_client_details
-- ----------------------------
INSERT INTO `oauth_client_details` VALUES ('entfrm', '', '$2a$10$IYtF5Qg/TBtau1pT.q4LLu8OdtutvopkxCc4nnV4n.KaadVmeodKK', 'server', 'password,refresh_token', '', NULL, NULL, NULL, NULL, 'true');
INSERT INTO `oauth_client_details` VALUES ('test', NULL, '$2a$10$q0DT1hteQMt7LSdmR5GANekY.YYCpxHQh21OCyGDAamxHjiCJaa86', 'test', 'password,refresh_token', NULL, NULL, NULL, NULL, NULL, 'true');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `blob_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('clusteredScheduler', '测试任务', 'demo', '0 * * * * ? *', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('clusteredScheduler', '测试任务', 'demo', NULL, 'com.cetccq.platform.biz.quartz.config.TmQuartzFactory', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000B7363686564756C654A6F627372002E636F6D2E70696734636C6F75642E706967782E6461656D6F6E2E71756172747A2E656E746974792E5379734A6F6200000000000000010200174C0009636C6173734E616D657400124C6A6176612F6C616E672F537472696E673B4C0008637265617465427971007E00094C000A63726561746554696D657400194C6A6176612F74696D652F4C6F63616C4461746554696D653B4C000E63726F6E45787072657373696F6E71007E00094C000B657865637574655061746871007E00094C00106A6F624578656375746553746174757371007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400134C6A6176612F6C616E672F496E74656765723B4C00076A6F624E616D6571007E00094C00086A6F624F7264657271007E00094C00096A6F6253746174757371007E00094C000D6A6F6254656E616E745479706571007E00094C00076A6F625479706571007E00094C000A6D6574686F644E616D6571007E00094C00116D6574686F64506172616D7356616C756571007E00094C000D6D697366697265506F6C69637971007E00094C00086E65787454696D6571007E000A4C000C70726576696F757354696D6571007E000A4C000672656D61726B71007E00094C0009737461727454696D6571007E000A4C000874656E616E74496471007E000B4C0008757064617465427971007E00094C000A75706461746554696D6571007E000A78720035636F6D2E62616F6D69646F752E6D796261746973706C75732E657874656E73696F6E2E6163746976657265636F72642E4D6F64656C0000000000000001020000787074000464656D6F74000561646D696E7372000D6A6176612E74696D652E536572955D84BA1B2248B20C00007870770A05000007E303190E00F17874000D30202A202A202A202A203F202A7400007400013074000464656D6F737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000174000CE6B58BE8AF95E4BBBBE58AA17400013574000133740001317400013274000A64656D6F4D6574686F6474000970696734636C6F7564740001337371007E0010770905000007E3031916E2787371007E0010770A05000007E30319161CCD78740020E6BC94E7A4BA537072696E67204265616EE79A84E5AE9AE697B6E4BBBBE58AA17371007E0010770A05000007E303191600DE7871007E001874000561646D696E7371007E0010770A05000007E303190E00F1787800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('clusteredScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('clusteredScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('clusteredScheduler', 'lengleng1553564320591', 1553568907589, 10000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_IBFK_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `int_prop_1` int(11) NULL DEFAULT NULL,
  `int_prop_2` int(11) NULL DEFAULT NULL,
  `long_prop_1` bigint(20) NULL DEFAULT NULL,
  `long_prop_2` bigint(20) NULL DEFAULT NULL,
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL,
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL,
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_IBFK_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `next_fire_time` bigint(13) NULL DEFAULT NULL,
  `prev_fire_time` bigint(13) NULL DEFAULT NULL,
  `priority` int(11) NULL DEFAULT NULL,
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) NULL DEFAULT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `misfire_instr` smallint(2) NULL DEFAULT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('clusteredScheduler', '测试任务', 'demo', '测试任务', 'demo', NULL, 1553568960000, 1553568900000, 5, 'WAITING', 'CRON', 1553564598000, 0, NULL, 2, '');

-- ----------------------------
-- Table structure for sys_application
-- ----------------------------
DROP TABLE IF EXISTS `sys_application`;
CREATE TABLE `sys_application`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '应用名称',
  `type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '应用类型',
  `is_sys` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '系统',
  `industry` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '行业',
  `cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '封面',
  `version` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '版本',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `sort` int(11) NULL DEFAULT 1 COMMENT '排序',
  `dept_id` int(11) NULL DEFAULT NULL COMMENT '机构编号',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态',
  `create_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标识（0-正常，1-删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '应用管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_application
-- ----------------------------
INSERT INTO `sys_application` VALUES (1, '通用管理', '1', '0', '通用', NULL, '1.0.1', '通用管理', 1, 1, '1', 'entfrm', '2020-04-23 19:20:29', 'entfrm', '2020-04-23 20:06:36', NULL, '0');
INSERT INTO `sys_application` VALUES (2, '开发工具', '1', '1', '其他', NULL, '1.0.0', '开发工具', 1, 1, '1', 'entfrm', '2020-05-15 22:55:31', 'entfrm', '2020-05-15 23:09:16', NULL, '0');

-- ----------------------------
-- Table structure for sys_area
-- ----------------------------
DROP TABLE IF EXISTS `sys_area`;
CREATE TABLE `sys_area`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NULL DEFAULT NULL,
  `ancestors` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所有父级编号',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区域名称',
  `code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区域编码',
  `sort` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区域类型',
  `create_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_area
-- ----------------------------

-- ----------------------------
-- Table structure for sys_backup
-- ----------------------------
DROP TABLE IF EXISTS `sys_backup`;
CREATE TABLE `sys_backup`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路径',
  `create_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '0-正常，1-删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_backup
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `is_sys` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '系统内置 0-是|1-否',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '初始密码', 'user.initPassword', '123456', '0', 'entfrm', '2020-03-15 21:51:13', '', NULL, NULL, '0');

-- ----------------------------
-- Table structure for sys_datasource
-- ----------------------------
DROP TABLE IF EXISTS `sys_datasource`;
CREATE TABLE `sys_datasource`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `driver_class_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据驱动',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'url地址',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `alias` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '别名',
  `create_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  `del_flag` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_datasource
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构编码',
  `name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构名称',
  `parent_id` int(11) NULL DEFAULT 0 COMMENT '父级编号',
  `ancestors` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '祖级列表',
  `sort` int(11) NULL DEFAULT 1 COMMENT '排序',
  `contacts` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址',
  `email` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `create_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (1, '100001', '重庆总公司', 0, '0', 1, 'entfrm', '15688888888', NULL, NULL, '0', 'entfrm', '2020-02-13 20:55:57', NULL, '2020-03-19 20:49:29', NULL, '0');
INSERT INTO `sys_dept` VALUES (2, '10000101', '北京分公司', 1, '0,1', 1, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '2020-03-15 20:22:11', NULL, '0');
INSERT INTO `sys_dept` VALUES (3, '10000102', '昆明分公司', 1, '0,1', 2, '123', '', NULL, NULL, '0', NULL, NULL, 'entfrm', '2020-03-15 20:37:02', NULL, '0');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `is_sys` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '0-是|1-否',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '0-正常，1-删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES (1, '用户性别', 'user_sex', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-03-17 14:19:40', '用户性别列表', '0');
INSERT INTO `sys_dict` VALUES (2, '菜单状态', 'menu_status', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-03-17 14:19:41', '菜单状态列表', '0');
INSERT INTO `sys_dict` VALUES (3, '是否', 'yes_no', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-03-17 14:19:42', '是否列表', '0');
INSERT INTO `sys_dict` VALUES (4, '状态', 'status', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-03-17 14:19:42', '状态列表', '0');
INSERT INTO `sys_dict` VALUES (5, '成功失败', 'success_fail', '0', '0', 'admin', '2019-08-24 10:02:57', 'admin', '2020-03-17 14:19:43', '成功失败列表', '0');
INSERT INTO `sys_dict` VALUES (6, '文件类别', 'file_type', '0', '0', 'entfrm', '2020-03-17 13:57:44', 'entfrm', '2020-03-20 22:48:19', '文件类别列表', '0');
INSERT INTO `sys_dict` VALUES (7, '数据库类型', 'datasource_type', '0', '0', 'entfrm', '2020-03-21 11:33:14', 'entfrm', '2020-03-22 09:56:10', '数据库类型列表', '0');
INSERT INTO `sys_dict` VALUES (8, '任务类型', 'job_type', '0', '0', 'entfrm', '2020-03-21 21:21:46', NULL, NULL, '任务类型列表', '0');
INSERT INTO `sys_dict` VALUES (9, '登录类型', 'login_type', '0', '0', 'entfrm', '2020-03-22 09:55:59', NULL, NULL, '登录类型列表', '0');
INSERT INTO `sys_dict` VALUES (10, '快捷方式类型', 'shortcut_type', '0', '0', 'entfrm', '2020-03-27 09:48:05', 'entfrm', '2020-03-27 10:14:27', '快捷方式类型列表', '0');
INSERT INTO `sys_dict` VALUES (11, '模型分类', 'model_category', '0', '0', 'entfrm', '2020-04-04 22:09:36', NULL, NULL, '', '0');
INSERT INTO `sys_dict` VALUES (12, '请假类型', 'leave_type', '0', '0', 'entfrm', '2020-04-05 10:08:18', NULL, NULL, '', '0');
INSERT INTO `sys_dict` VALUES (13, '任务状态', 'job_status', '0', '0', 'entfrm', '2020-04-11 18:54:20', NULL, NULL, '', '0');
INSERT INTO `sys_dict` VALUES (14, '请假状态', 'leave_status', '0', '0', 'entfrm', '2020-04-12 14:30:52', NULL, NULL, '请假状态列表', '0');
INSERT INTO `sys_dict` VALUES (15, '应用类型', 'application_type', '0', '0', 'entfrm', '2020-04-23 18:54:07', NULL, NULL, '', '0');
INSERT INTO `sys_dict` VALUES (16, '消息类型', 'msg_type', '0', '0', 'entfrm', '2020-05-10 16:02:20', NULL, NULL, '', '0');
INSERT INTO `sys_dict` VALUES (17, '应用状态', 'application_status', '0', '0', 'entfrm', '2020-05-15 22:56:49', NULL, NULL, '应用状态列表', '0');
INSERT INTO `sys_dict` VALUES (18, '消息通知类型', 'content_type', '0', '0', 'entfrm', '2020-05-25 15:45:41', NULL, NULL, '', '0');
INSERT INTO `sys_dict` VALUES (19, '数据格式类型', 'data_type', '0', '0', 'entfrm', '2020-06-13 08:51:07', NULL, NULL, '', '0');
INSERT INTO `sys_dict` VALUES (20, '表单类型', 'form_type', '0', '0', 'entfrm', '2021-03-26 23:30:49', NULL, NULL, '', '0');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `dict_id` int(11) NULL DEFAULT NULL COMMENT '字典编号',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型',
  `label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签名',
  `value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据值',
  `sort` int(10) NOT NULL COMMENT '排序（升序）',
  `create_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, 'user_sex', '男', '0', 1, NULL, '2019-08-13 18:33:37', NULL, '2019-08-13 18:33:40', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (2, 1, 'user_sex', '女', '1', 2, NULL, '2019-08-13 18:34:03', NULL, '2019-08-13 18:34:07', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (3, 2, 'menu_status', '隐藏', '1', 2, NULL, '2019-08-13 18:33:37', NULL, '2019-08-19 15:42:29', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (4, 2, 'menu_status', '显示', '0', 1, NULL, '2019-08-13 18:33:37', NULL, '2019-08-19 15:42:28', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (5, 3, 'yes_no', '是', '0', 1, NULL, '2019-08-13 18:33:37', 'admin', '2020-03-17 12:05:05', '', '0');
INSERT INTO `sys_dict_data` VALUES (6, 3, 'yes_no', '否', '1', 2, NULL, '2019-08-13 18:33:37', 'admin', '2020-03-17 12:05:06', '', '0');
INSERT INTO `sys_dict_data` VALUES (7, 4, 'status', '停用', '1', 2, NULL, '2019-08-13 18:34:03', 'admin', '2019-08-19 15:43:00', '', '0');
INSERT INTO `sys_dict_data` VALUES (8, 4, 'status', '正常', '0', 1, NULL, '2019-08-13 18:33:37', NULL, '2019-08-19 15:42:59', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (9, NULL, 'success_fail', '成功', '0', 10, 'admin', '2019-08-24 11:48:18', 'entfrm', '2019-08-24 11:48:17', '', '0');
INSERT INTO `sys_dict_data` VALUES (10, NULL, 'success_fail', '失败', '1', 20, 'admin', '2019-08-24 11:48:27', NULL, '2019-08-24 11:48:26', '', '0');
INSERT INTO `sys_dict_data` VALUES (11, NULL, 'file_type', '图片', 'image', 1, 'entfrm', '2020-03-20 22:48:39', NULL, '2020-03-28 16:27:48', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (12, NULL, 'file_type', '媒体', 'media', 2, 'entfrm', '2020-03-20 22:48:48', 'entfrm', '2020-03-28 16:28:32', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (13, NULL, 'file_type', '文档', 'file', 3, 'entfrm', '2020-03-20 22:49:03', NULL, '2020-03-28 16:28:21', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (14, NULL, 'datasource_type', 'Mysql', 'com.mysql.cj.jdbc.Driver', 1, 'entfrm', '2020-03-21 11:33:59', 'entfrm', '2020-03-21 11:33:59', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (15, NULL, 'datasource_type', 'Sqlserver', 'com.microsoft.sqlserver.jdbc.SQLServerDriver', 2, 'entfrm', '2020-03-21 11:34:59', 'entfrm', '2020-03-21 11:34:58', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (16, NULL, 'datasource_type', 'Postgresql', 'org.postgresql.Driver', 3, 'entfrm', '2020-03-21 11:36:16', NULL, '2020-03-21 11:36:15', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (17, NULL, 'job_type', 'Java类', '1', 1, 'entfrm', '2020-03-21 21:22:35', NULL, '2020-03-21 21:22:35', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (18, NULL, 'job_type', 'Spring bean名称', '2', 2, 'entfrm', '2020-03-21 21:22:50', NULL, '2020-03-21 21:22:50', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (19, NULL, 'job_type', 'Rest调用', '3', 3, 'entfrm', '2020-03-21 21:23:06', NULL, '2020-03-21 21:23:05', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (20, NULL, 'job_type', 'Jar调用', '4', 4, 'entfrm', '2020-03-21 21:23:19', NULL, '2020-03-21 21:23:18', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (21, NULL, 'job_type', '其他', '5', 0, 'entfrm', '2020-03-21 21:23:24', NULL, '2020-03-21 21:23:24', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (22, NULL, 'login_type', '登录', '0', 1, 'entfrm', '2020-03-22 09:56:41', NULL, '2020-03-22 09:56:40', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (23, NULL, 'login_type', '退出', '1', 2, 'entfrm', '2020-03-22 09:56:51', NULL, '2020-03-22 09:56:51', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (24, NULL, 'shortcut_type', '顶部', '1', 1, 'entfrm', '2020-03-27 09:48:24', NULL, '2020-03-27 09:48:23', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (25, NULL, 'shortcut_type', '首页', '2', 2, 'entfrm', '2020-03-27 09:48:38', NULL, '2020-03-27 09:48:38', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (26, NULL, 'model_category', '办公流程', 'office', 1, 'entfrm', '2020-04-04 22:10:14', NULL, '2020-04-04 22:10:13', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (27, NULL, 'model_category', '项目流程', 'project', 2, 'entfrm', '2020-04-04 22:10:27', NULL, '2020-04-04 22:10:26', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (28, NULL, 'leave_type', '事假', '1', 1, 'entfrm', '2020-04-05 10:08:52', NULL, '2020-04-05 10:08:52', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (29, NULL, 'leave_type', '病假', '2', 2, 'entfrm', '2020-04-05 10:09:05', NULL, '2020-04-05 10:09:05', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (30, NULL, 'leave_type', '产假', '3', 3, 'entfrm', '2020-04-05 10:09:37', 'entfrm', '2020-04-05 10:09:37', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (31, NULL, 'job_status', '未发布', '1', 1, 'entfrm', '2020-04-11 18:54:37', NULL, '2020-04-11 18:54:37', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (32, NULL, 'job_status', '运行中', '2', 2, 'entfrm', '2020-04-11 18:54:48', NULL, '2020-04-11 18:54:47', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (33, NULL, 'job_status', '暂停', '3', 3, 'entfrm', '2020-04-11 18:54:57', NULL, '2020-04-11 18:54:57', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (34, NULL, 'leave_status', '未提交', '0', 0, 'entfrm', '2020-04-12 14:31:12', NULL, '2020-04-12 14:31:11', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (35, NULL, 'leave_status', '未审批', '1', 1, 'entfrm', '2020-04-12 14:31:29', NULL, '2020-04-12 14:31:28', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (36, NULL, 'leave_status', '批准', '2', 2, 'entfrm', '2020-04-12 14:31:38', NULL, '2020-04-12 14:31:38', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (37, NULL, 'leave_status', '驳回', '9', 3, 'entfrm', '2020-04-12 14:31:51', '小狗', '2020-04-12 14:31:51', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (38, NULL, 'application_type', 'PC', '1', 1, 'entfrm', '2020-04-23 18:54:36', NULL, '2020-04-23 18:54:36', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (39, NULL, 'application_type', 'APP', '2', 2, 'entfrm', '2020-04-23 18:54:44', NULL, '2020-04-23 18:54:44', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (40, NULL, 'application_type', '小程序', '3', 3, 'entfrm', '2020-04-23 18:54:58', NULL, '2020-04-23 18:54:57', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (41, NULL, 'msg_type', '短信', '0', 0, 'entfrm', '2020-05-10 16:02:40', NULL, '2020-05-10 16:02:40', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (42, NULL, 'msg_type', '邮件', '1', 1, 'entfrm', '2020-05-10 16:02:50', NULL, '2020-05-10 16:02:50', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (43, NULL, 'application_status', '未发布', '0', 0, 'entfrm', '2020-05-15 22:57:27', NULL, '2020-05-15 22:57:27', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (44, NULL, 'application_status', '已发布', '1', 1, 'entfrm', '2020-05-15 22:57:36', NULL, '2020-05-15 22:57:35', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (45, NULL, 'msg_type', 'PC', '2', 2, 'entfrm', '2020-05-25 15:44:18', NULL, '2020-05-25 15:44:17', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (46, NULL, 'msg_type', 'APP', '3', 3, 'entfrm', '2020-05-25 15:44:44', NULL, '2020-05-25 15:44:43', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (47, NULL, 'msg_type', '微信', '4', 4, 'entfrm', '2020-05-25 15:44:56', NULL, '2020-05-25 15:44:56', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (48, NULL, 'content_type', '通知', '0', 0, 'entfrm', '2020-05-25 15:46:28', NULL, '2020-05-25 15:46:28', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (49, NULL, 'content_type', '公告', '1', 1, 'entfrm', '2020-05-25 15:46:38', NULL, '2020-05-25 15:46:38', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (50, NULL, 'content_type', '其他', '2', 2, 'entfrm', '2020-05-25 15:46:46', NULL, '2020-05-25 15:46:45', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (51, NULL, 'data_type', 'json', 'json', 1, 'entfrm', '2020-06-13 08:51:24', NULL, '2020-06-13 08:51:24', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (52, NULL, 'form_type', '普通表单', '0', 0, 'entfrm', '2021-03-26 23:31:12', NULL, '2021-03-26 23:31:12', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (53, NULL, 'form_type', '工作流表单', '1', 1, 'entfrm', '2021-03-26 23:31:20', NULL, '2021-03-26 23:31:19', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (54, NULL, 'leave_status', '作废', '8', 4, '小狗', '2021-04-15 01:03:15', NULL, '2021-04-15 01:03:14', '作废流程', '0');

-- ----------------------------
-- Table structure for sys_file_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_file_info`;
CREATE TABLE `sys_file_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名称',
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件类型',
  `format` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件格式',
  `size` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件大小',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件保存路径',
  `thumbnail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缩略图',
  `dept_id` int(11) NULL DEFAULT NULL COMMENT '机构编号',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_file_info
-- ----------------------------

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `job_order` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组内执行顺利，值越大执行优先级越高，最大值9，最小值1',
  `job_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '1、java类;2、spring bean名称;3、rest调用;4、jar调用;9其他',
  `execute_path` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'job_type=3时，rest调用地址，仅支持rest get协议,需要增加String返回值，0成功，1失败;job_type=4时，jar路径;其它值为空',
  `params_value` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参数值',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '3' COMMENT '错误策略（1立即执行 2执行一次 3放弃执行）',
  `job_tenant_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '1、多租户任务;2、非多租户任务',
  `job_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（1、未发布;2、运行中;3、暂停;4、删除;）',
  `job_execute_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1异常）',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT '初次执行时间',
  `previous_time` datetime(0) NULL DEFAULT NULL COMMENT '上次执行时间',
  `next_time` datetime(0) NULL DEFAULT NULL COMMENT '下次执行时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, 'demoMethod', 'demo', '5', '2', 'demo.demoMethod', '1', '0 * * * * ? *', '3', '1', '3', '0', '2020-05-21 16:17:11', '2020-06-02 10:37:00', '2020-06-02 10:38:00', 'admin', '2019-03-25 14:00:14', 'entfrm', '2021-04-04 17:20:50', '演示Spring Bean的定时任务', '0');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_id` int(11) NOT NULL COMMENT '任务id',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务组名',
  `job_order` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组内执行顺利，值越大执行优先级越高，最大值9，最小值1',
  `job_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '1、java类;2、spring bean名称;3、rest调用;4、jar调用;9其他',
  `execute_path` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'job_type=3时，rest调用地址，仅支持post协议;job_type=4时，jar路径;其它值为空',
  `params_value` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数值',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'cron执行表达式',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `job_log_status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `execute_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '执行时间',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务执行日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `login_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录类型',
  `login_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_addr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '用户代理',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 639 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------
INSERT INTO `sys_login_log` VALUES (638, 'entfrm', '0', '127.0.0.1', 'XX XX', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36', '0', '', '2021-04-23 18:08:27');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '父菜单ID',
  `parent_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父菜单IDS',
  `application_id` int(11) NULL DEFAULT 1 COMMENT '应用编号',
  `type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单类型 ',
  `path` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '前端URL',
  `component` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT 'VUE页面',
  `perms` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单权限标识',
  `icon` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `no_cache` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '路由缓存',
  `sort` int(11) NULL DEFAULT 1 COMMENT '排序值',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `create_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '删除标识（0-正常,1-删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 247 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, NULL, 1, 'M', 'system', '#', '', 'system', '0', 10, '0', 'admin', '2019-03-16 11:33:00', 'admin', '2020-03-16 20:45:21', '系统管理模块', '0');
INSERT INTO `sys_menu` VALUES (2, '运维监控', 0, NULL, 1, 'M', 'monitor', '#', '', 'monitor', '0', 20, '0', 'admin', '2019-03-16 11:33:00', 'admin', '2020-03-17 19:14:27', '运维监控模块', '0');
INSERT INTO `sys_menu` VALUES (3, '开发工具', 0, NULL, 2, 'M', 'toolkit', '#', '', 'tool', '0', 30, '0', 'admin', '2019-03-16 11:33:00', 'admin', '2021-03-26 22:01:59', '开发工具模块', '0');
INSERT INTO `sys_menu` VALUES (4, '机构管理', 1, NULL, 1, 'C', 'dept', 'system/dept/index', '', 'tree', '0', 1, '0', NULL, '2020-03-13 19:31:20', NULL, '2020-03-14 20:55:41', NULL, '0');
INSERT INTO `sys_menu` VALUES (5, '角色管理', 1, NULL, 1, 'C', 'role', 'system/role/index', '', 'peoples', '0', 2, '0', NULL, '2020-03-13 19:32:09', NULL, '2020-03-16 22:11:57', NULL, '0');
INSERT INTO `sys_menu` VALUES (6, '用户管理', 1, NULL, 1, 'C', 'user', 'system/user/index', '', 'user', '0', 3, '0', NULL, '2020-03-13 19:32:30', NULL, '2020-03-16 22:11:59', NULL, '0');
INSERT INTO `sys_menu` VALUES (7, '菜单管理', 1, NULL, 1, 'C', 'menu', 'system/menu/index', '', 'tree-table', '0', 4, '0', NULL, '2020-03-13 19:33:24', NULL, '2020-03-16 22:12:01', NULL, '0');
INSERT INTO `sys_menu` VALUES (8, '机构新增', 4, NULL, 1, 'F', NULL, '#', 'dept_add', NULL, '0', 1, '0', NULL, '2020-03-12 20:42:47', NULL, '2020-03-16 20:42:51', NULL, '0');
INSERT INTO `sys_menu` VALUES (9, '机构修改', 4, NULL, 1, 'F', NULL, '#', 'dept_edit', NULL, '0', 2, '0', NULL, '2020-03-12 20:42:52', NULL, '2020-03-16 20:42:56', NULL, '0');
INSERT INTO `sys_menu` VALUES (10, '机构删除', 4, NULL, 1, 'F', NULL, '#', 'dept_del', NULL, '0', 3, '0', NULL, '2020-03-12 20:42:57', NULL, '2020-03-16 20:43:02', NULL, '0');
INSERT INTO `sys_menu` VALUES (11, '机构查看', 4, NULL, 1, 'F', NULL, '#', 'dept_view', NULL, '0', 4, '0', NULL, '2020-03-12 20:43:03', NULL, '2020-03-16 20:43:06', NULL, '0');
INSERT INTO `sys_menu` VALUES (12, '机构导入', 4, NULL, 1, 'F', NULL, '#', 'dept_import', NULL, '0', 5, '0', 'entfrm', '2020-03-16 20:40:08', 'entfrm', '2020-03-16 20:42:10', NULL, '0');
INSERT INTO `sys_menu` VALUES (13, '角色新增', 5, NULL, 1, 'F', NULL, '#', 'role_add', NULL, '0', 1, '0', 'entfrm', '2020-03-16 11:50:24', NULL, '2020-03-16 20:41:51', NULL, '0');
INSERT INTO `sys_menu` VALUES (14, '角色修改', 5, NULL, 1, 'F', NULL, '#', 'role_edit', NULL, '0', 2, '0', 'entfrm', '2020-03-16 11:51:05', NULL, '2020-03-16 20:41:44', NULL, '0');
INSERT INTO `sys_menu` VALUES (15, '角色删除', 5, NULL, 1, 'F', NULL, '#', 'role_del', NULL, '0', 3, '0', 'entfrm', '2020-03-16 11:51:21', NULL, '2020-03-16 20:41:41', NULL, '0');
INSERT INTO `sys_menu` VALUES (16, '角色查看', 5, NULL, 1, 'F', NULL, '#', 'role_view', NULL, '0', 4, '0', 'entfrm', '2020-03-16 11:51:40', NULL, '2020-03-16 20:41:37', NULL, '0');
INSERT INTO `sys_menu` VALUES (17, '数据权限', 5, NULL, 1, 'F', NULL, '#', 'role_data', NULL, '0', 5, '0', 'entfrm', '2020-03-16 12:15:50', NULL, '2020-03-16 20:41:34', NULL, '0');
INSERT INTO `sys_menu` VALUES (18, '用户添加', 6, NULL, 1, 'F', NULL, '#', 'user_add', NULL, '0', 1, '0', 'entfrm', '2020-03-16 20:31:15', NULL, '2020-03-16 20:41:31', NULL, '0');
INSERT INTO `sys_menu` VALUES (19, '用户修改', 6, NULL, 1, 'F', NULL, '#', 'user_edit', NULL, '0', 2, '0', 'entfrm', '2020-03-16 20:32:19', 'entfrm', '2020-03-16 20:41:28', NULL, '0');
INSERT INTO `sys_menu` VALUES (20, '用户删除', 6, NULL, 1, 'F', NULL, '#', 'user_del', NULL, '0', 3, '0', 'entfrm', '2020-03-16 20:32:41', NULL, '2020-03-16 20:41:25', NULL, '0');
INSERT INTO `sys_menu` VALUES (21, '用户查看', 6, NULL, 1, 'F', NULL, '#', 'user_view', NULL, '0', 4, '0', 'entfrm', '2020-03-16 20:33:11', NULL, '2020-03-16 20:41:20', NULL, '0');
INSERT INTO `sys_menu` VALUES (22, '重置密码', 6, NULL, 1, 'F', NULL, '#', 'user_reset', NULL, '0', 5, '0', 'entfrm', '2020-03-16 20:34:22', 'entfrm', '2020-03-16 20:41:17', NULL, '0');
INSERT INTO `sys_menu` VALUES (23, '用户导入', 6, NULL, 1, 'F', NULL, '#', 'user_import', NULL, '0', 6, '0', 'entfrm', '2020-03-16 20:34:49', NULL, '2020-03-16 20:41:14', NULL, '0');
INSERT INTO `sys_menu` VALUES (24, '用户导出', 6, NULL, 1, 'F', NULL, '#', 'user_export', NULL, '0', 7, '0', 'entfrm', '2020-03-16 20:35:12', NULL, '2020-03-16 20:41:12', NULL, '0');
INSERT INTO `sys_menu` VALUES (25, '菜单新增', 7, NULL, 1, 'F', NULL, '#', 'menu_add', NULL, '0', 1, '0', 'entfrm', '2020-03-16 20:38:18', NULL, '2020-03-16 20:41:10', NULL, '0');
INSERT INTO `sys_menu` VALUES (26, '菜单修改', 7, NULL, 1, 'F', NULL, '#', 'menu_edit', NULL, '0', 2, '0', 'entfrm', '2020-03-16 20:38:41', 'entfrm', '2020-03-16 20:41:07', NULL, '0');
INSERT INTO `sys_menu` VALUES (27, '菜单删除', 7, NULL, 1, 'F', NULL, '#', 'menu_del', NULL, '0', 3, '0', 'entfrm', '2020-03-16 20:39:04', NULL, '2020-03-16 20:41:04', NULL, '0');
INSERT INTO `sys_menu` VALUES (28, '菜单查看', 7, NULL, 1, 'F', NULL, '#', 'menu_view', NULL, '0', 4, '0', 'entfrm', '2020-03-16 20:39:39', NULL, '2020-03-16 20:41:01', NULL, '0');
INSERT INTO `sys_menu` VALUES (29, '字典管理', 1, '6', 1, 'C', 'dict', 'system/dict/index', '', 'dict', '0', 5, '0', 'entfrm', '2020-03-16 11:33:00', '', '2020-03-16 11:33:00', '字典管理菜单', '0');
INSERT INTO `sys_menu` VALUES (30, '字典新增', 29, NULL, 1, 'F', NULL, '#', 'dict_add', NULL, '0', 1, '0', 'entfrm', '2020-03-16 20:50:45', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (31, '字典修改', 29, NULL, 1, 'F', NULL, '#', 'dict_edit', NULL, '0', 2, '0', 'entfrm', '2020-03-16 20:51:01', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (32, '字典删除', 29, NULL, 1, 'F', NULL, '#', 'dict_del', NULL, '0', 3, '0', 'entfrm', '2020-03-16 20:52:18', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (33, '字典查看', 29, NULL, 1, 'F', NULL, '#', 'dict_view', NULL, '0', 4, '0', 'entfrm', '2020-03-16 20:52:38', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (34, '数据增加', 29, NULL, 1, 'F', NULL, '#', 'dictData_add', NULL, '0', 5, '0', 'entfrm', '2020-03-16 21:49:18', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (35, '数据修改', 29, NULL, 1, 'F', NULL, '#', 'dictData_edit', NULL, '0', 6, '0', 'entfrm', '2020-03-16 21:49:36', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (36, '数据删除', 29, NULL, 1, 'F', NULL, '#', 'dictData_del', NULL, '0', 7, '0', 'entfrm', '2020-03-16 21:50:00', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (37, '数据查看', 29, NULL, 1, 'F', NULL, '#', 'dictData_view', NULL, '0', 8, '0', 'entfrm', '2020-03-16 21:50:19', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (38, '参数管理', 1, NULL, 1, 'C', 'config', 'system/config/index', NULL, 'list', '0', 6, '0', 'entfrm', '2020-03-16 22:06:52', NULL, '2020-03-16 22:11:13', NULL, '0');
INSERT INTO `sys_menu` VALUES (39, '参数新增', 38, NULL, 1, 'F', NULL, '#', 'config_add', NULL, '0', 1, '0', 'entfrm', '2020-03-16 22:07:16', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (40, '参数修改', 38, NULL, 1, 'F', NULL, '#', 'config_edit', NULL, '0', 2, '0', 'entfrm', '2020-03-16 22:07:30', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (41, '参数删除', 38, NULL, 1, 'F', NULL, '#', 'config_del', NULL, '0', 3, '0', 'entfrm', '2020-03-16 22:07:43', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (42, '参数查看', 38, NULL, 1, 'F', NULL, '#', 'config_view', NULL, '0', 4, '0', 'entfrm', '2020-03-16 22:08:06', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (43, '快捷方式', 1, NULL, 1, 'C', 'shortcut', 'system/shortcut/index', NULL, 'link', '0', 7, '0', 'entfrm', '2020-03-17 17:53:08', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (44, '文件管理', 1, NULL, 1, 'C', 'fileInfo', 'system/fileInfo/index', NULL, 'zip', '0', 8, '0', 'entfrm', '2020-03-17 17:56:28', 'entfrm', '2020-03-20 22:33:35', NULL, '0');
INSERT INTO `sys_menu` VALUES (45, '终端管理', 1, NULL, 1, 'C', 'clientDetails', 'system/clientDetails/index', NULL, 'phone', '0', 9, '0', 'entfrm', '2020-03-17 17:57:46', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (46, '数据备份', 1, NULL, 1, 'C', 'backup', 'system/backup/index', NULL, 'date-range', '0', 11, '0', 'entfrm', '2020-03-17 18:02:21', NULL, '2020-03-18 22:20:28', NULL, '0');
INSERT INTO `sys_menu` VALUES (47, '令牌管理', 2, NULL, 1, 'C', 'token', 'monitor/token/index', NULL, 'post', '0', 1, '0', 'entfrm', '2020-03-17 17:59:55', 'entfrm', '2020-05-10 22:32:05', NULL, '0');
INSERT INTO `sys_menu` VALUES (48, '定时任务', 2, NULL, 1, 'C', 'job', 'monitor/job/index', NULL, 'time-range', '0', 2, '0', 'entfrm', '2020-03-17 18:08:23', NULL, '2020-03-18 22:20:23', NULL, '0');
INSERT INTO `sys_menu` VALUES (49, '数据监控', 2, NULL, 1, 'C', 'druid', 'monitor/druid/index', NULL, 'druid', '0', 3, '0', 'entfrm', '2020-03-17 18:08:56', NULL, '2020-03-20 18:53:07', NULL, '0');
INSERT INTO `sys_menu` VALUES (50, '服务监控', 2, NULL, 1, 'C', 'server', 'monitor/server/index', NULL, 'server', '0', 4, '0', 'entfrm', '2020-03-17 18:09:39', 'entfrm', '2020-03-20 19:23:24', NULL, '0');
INSERT INTO `sys_menu` VALUES (51, 'API监控', 2, NULL, 1, 'C', 'apiStat', 'monitor/apiStat/index', 'apiStat_view', 'chart', '0', 6, '0', 'entfrm', '2020-03-17 18:15:13', 'entfrm', '2020-05-17 16:48:20', NULL, '0');
INSERT INTO `sys_menu` VALUES (52, '日志监控', 2, NULL, 1, 'M', 'log', '#', NULL, 'monitor', '0', 7, '0', 'entfrm', '2020-03-17 18:12:01', NULL, '2020-05-17 16:48:23', NULL, '0');
INSERT INTO `sys_menu` VALUES (53, '登录日志', 52, NULL, 1, 'C', 'loginLog', 'monitor/loginLog/index', NULL, 'logininfor', '0', 1, '0', 'entfrm', '2020-03-17 18:12:56', NULL, '2020-03-18 22:31:53', NULL, '0');
INSERT INTO `sys_menu` VALUES (54, '操作日志', 52, NULL, 1, 'C', 'operLog', 'monitor/operLog/index', NULL, 'log', '0', 2, '0', 'entfrm', '2020-03-17 18:13:52', 'entfrm', '2020-03-18 22:31:36', NULL, '0');
INSERT INTO `sys_menu` VALUES (55, '接口文档', 3, NULL, 2, 'C', 'swagger', 'toolkit/swagger/index', NULL, 'swagger', '0', 4, '0', 'entfrm', '2020-03-17 18:18:38', 'entfrm', '2021-03-26 21:59:08', NULL, '0');
INSERT INTO `sys_menu` VALUES (56, '模板管理', 3, NULL, 2, 'M', 'template', '#', NULL, 'drag', '0', 5, '0', 'entfrm', '2020-03-17 18:19:52', 'entfrm', '2021-03-26 21:59:08', NULL, '1');
INSERT INTO `sys_menu` VALUES (57, '表单构建', 3, NULL, 2, 'C', 'build', 'toolkit/build/index', NULL, 'form', '0', 6, '0', 'entfrm', '2020-03-17 18:21:32', 'entfrm', '2021-03-27 09:12:17', NULL, '1');
INSERT INTO `sys_menu` VALUES (58, '工作流', 0, NULL, 2, 'M', 'activiti', '#', NULL, 'skill', '1', 4, '0', 'entfrm', '2020-03-17 18:22:36', 'entfrm', '2020-03-20 23:09:48', NULL, '0');
INSERT INTO `sys_menu` VALUES (59, '终端新增', 45, NULL, 1, 'F', NULL, '#', 'clientDetails_add', NULL, '0', 1, '0', 'entfrm', '2020-03-18 15:18:36', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (60, '终端修改', 45, NULL, 1, 'F', NULL, '#', 'clientDetails_edit', NULL, '0', 2, '0', 'entfrm', '2020-03-18 15:18:53', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (61, '终端删除', 45, NULL, 1, 'F', NULL, '#', 'clientDetails_del', NULL, '0', 3, '0', 'entfrm', '2020-03-18 15:19:06', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (62, '终端查看', 45, NULL, 1, 'F', NULL, '#', 'clientDetails_view', NULL, '0', 4, '0', 'entfrm', '2020-03-18 15:19:29', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (63, '登录日志删除', 53, NULL, 1, 'F', NULL, '#', 'loginLog_del', NULL, '0', 1, '0', 'entfrm', '2020-03-19 11:50:34', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (64, '登录日志查看', 53, NULL, 1, 'F', NULL, '#', 'loginLog_view', NULL, '0', 2, '0', 'entfrm', '2020-03-19 11:50:59', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (65, '登录日志导出', 53, NULL, 1, 'F', NULL, '#', 'loginLog_export', NULL, '0', 3, '0', 'entfrm', '2020-03-19 11:52:05', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (66, '操作日志删除', 54, NULL, 1, 'F', NULL, '#', 'operLog_del', NULL, '0', 1, '0', 'entfrm', '2020-03-19 11:52:25', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (67, '操作日志查看', 54, NULL, 1, 'F', NULL, '#', 'operLog_view', NULL, '0', 2, '0', 'entfrm', '2020-03-19 11:52:45', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (68, '操作日志导出', 54, NULL, 1, 'F', NULL, '#', 'operLog_export', NULL, '0', 3, '0', 'entfrm', '2020-03-19 11:53:09', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (69, '备份新增', 46, NULL, 1, 'F', NULL, '#', 'backup_add', NULL, '0', 1, '0', 'entfrm', '2020-03-20 21:59:58', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (70, '备份还原', 46, NULL, 1, 'F', NULL, '#', 'backup_restore', NULL, '0', 2, '0', 'entfrm', '2020-03-20 22:00:23', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (71, '备份删除', 46, NULL, 1, 'F', NULL, '#', 'backup_del', NULL, '0', 3, '0', 'entfrm', '2020-03-20 22:00:41', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (72, '备份查看', 46, NULL, 1, 'F', NULL, '#', 'backup_view', NULL, '0', 4, '0', 'entfrm', '2020-03-20 22:44:05', NULL, '2020-03-20 22:44:39', NULL, '0');
INSERT INTO `sys_menu` VALUES (73, '文件上传', 44, NULL, 1, 'F', NULL, '#', 'fileInfo_add', NULL, '0', 1, '0', 'entfrm', '2020-03-20 22:41:42', NULL, '2020-03-20 22:44:35', NULL, '0');
INSERT INTO `sys_menu` VALUES (74, '文件启用', 44, NULL, 1, 'F', NULL, '#', 'fileInfo_edit', NULL, '0', 2, '0', 'entfrm', '2020-03-20 22:42:07', 'entfrm', '2020-03-20 22:44:32', NULL, '0');
INSERT INTO `sys_menu` VALUES (75, '文件删除', 44, NULL, 1, 'F', NULL, '#', 'fileInfo_del', NULL, '0', 3, '0', 'entfrm', '2020-03-20 22:42:30', NULL, '2020-03-20 22:44:29', NULL, '0');
INSERT INTO `sys_menu` VALUES (76, '文件查看', 44, NULL, 1, 'F', NULL, '#', 'fileInfo_view', NULL, '0', 4, '0', 'entfrm', '2020-03-20 22:43:06', NULL, '2020-03-20 22:44:26', NULL, '0');
INSERT INTO `sys_menu` VALUES (77, '文件分享', 44, NULL, 1, 'F', NULL, '#', 'fileInfo_share', NULL, '0', 5, '0', 'entfrm', '2020-03-20 22:43:37', 'entfrm', '2020-03-20 22:44:23', NULL, '0');
INSERT INTO `sys_menu` VALUES (78, '数据库管理', 3, NULL, 2, 'C', 'datasource', 'toolkit/datasource/index', NULL, 'druid', '0', 1, '0', 'entfrm', '2020-03-21 11:05:47', 'entfrm', '2021-03-26 21:59:08', NULL, '0');
INSERT INTO `sys_menu` VALUES (79, '数据表管理', 3, NULL, 2, 'C', 'datatable', 'toolkit/datatable/index', NULL, 'table', '0', 2, '0', 'entfrm', '2020-03-21 11:07:23', 'entfrm', '2021-03-26 21:59:08', NULL, '0');
INSERT INTO `sys_menu` VALUES (81, '数据库新增', 78, NULL, 1, 'F', NULL, '#', 'datasource_add', NULL, '0', 1, '0', 'entfrm', '2020-03-21 11:27:26', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (82, '数据库修改', 78, NULL, 1, 'F', NULL, '#', 'datasource_edit', NULL, '0', 2, '0', 'entfrm', '2020-03-21 11:27:46', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (83, '数据库删除', 78, NULL, 1, 'F', NULL, '#', 'datasource_del', NULL, '0', 3, '0', 'entfrm', '2020-03-21 11:27:59', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (84, '数据库查看', 78, NULL, 1, 'F', NULL, '#', 'datasource_view', NULL, '0', 4, '0', 'entfrm', '2020-03-21 11:28:11', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (85, '模型管理', 58, NULL, 1, 'C', 'model', 'activiti/model/index', NULL, 'edit', '1', 1, '0', 'entfrm', '2020-03-24 12:48:54', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (86, '模型新增', 85, NULL, 1, 'F', NULL, '#', 'model_add', NULL, '1', 1, '0', 'entfrm', '2020-03-24 12:52:47', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (87, '模型删除', 85, NULL, 1, 'F', NULL, '#', 'model_del', NULL, '1', 2, '0', 'entfrm', '2020-03-24 12:53:43', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (88, '模型查看', 85, NULL, 1, 'F', NULL, '#', 'model_view', NULL, '1', 3, '0', 'entfrm', '2020-03-24 12:53:56', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (89, '模型部署', 85, NULL, 1, 'F', NULL, '#', 'model_deploy', NULL, '1', 4, '0', 'entfrm', '2020-03-24 12:54:19', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (90, '表新增', 79, NULL, 1, 'F', NULL, '#', 'datatable_add', NULL, '0', 1, '0', 'entfrm', '2020-03-25 14:59:45', 'entfrm', '2020-03-25 15:00:14', NULL, '0');
INSERT INTO `sys_menu` VALUES (91, '表修改', 79, NULL, 1, 'F', NULL, '#', 'datatable_edit', NULL, '0', 2, '0', 'entfrm', '2020-03-25 15:00:31', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (92, '表删除', 79, NULL, 1, 'F', NULL, '#', 'datatable_del', NULL, '0', 3, '0', 'entfrm', '2020-03-25 15:00:49', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (93, '表查看', 79, NULL, 1, 'F', NULL, '#', 'datatable_view', NULL, '0', 4, '0', 'entfrm', '2020-03-25 15:01:06', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (94, '表配置', 79, NULL, 1, 'F', NULL, '#', 'datatable_config', NULL, '0', 5, '0', 'entfrm', '2020-03-25 15:02:39', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (95, '代码生成', 79, NULL, 1, 'F', NULL, '#', 'datatable_gen', NULL, '0', 6, '0', 'entfrm', '2020-03-25 15:03:06', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (96, '任务新增', 48, NULL, 1, 'F', NULL, '#', 'job_add', NULL, '0', 1, '0', 'entfrm', '2020-03-26 15:34:44', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (97, '任务编辑', 48, NULL, 1, 'F', NULL, '#', 'job_edit', NULL, '0', 2, '0', 'entfrm', '2020-03-26 15:34:59', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (98, '任务删除', 48, NULL, 1, 'F', NULL, '#', 'job_del', NULL, '0', 3, '0', 'entfrm', '2020-03-26 15:35:17', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (99, '任务查看', 48, NULL, 1, 'F', NULL, '#', 'job_view', NULL, '0', 4, '0', 'entfrm', '2020-03-26 15:35:32', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (100, '任务暂定', 48, NULL, 1, 'F', NULL, '#', 'job_stop', NULL, '0', 5, '0', 'entfrm', '2020-03-26 15:37:16', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (101, '任务启动', 48, NULL, 1, 'F', NULL, '#', 'job_start', NULL, '0', 6, '0', 'entfrm', '2020-03-26 15:37:35', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (102, '任务重置', 48, NULL, 1, 'F', NULL, '#', 'job_refresh', NULL, '0', 7, '0', 'entfrm', '2020-03-26 15:37:56', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (103, '任务日志查看', 48, NULL, 1, 'F', NULL, '#', 'jobLog_view', NULL, '0', 8, '0', 'entfrm', '2020-03-26 15:38:19', 'entfrm', '2020-03-26 15:38:35', NULL, '0');
INSERT INTO `sys_menu` VALUES (104, '任务日志删除', 48, NULL, 1, 'F', NULL, '#', 'jobLog_del', NULL, '0', 9, '0', 'entfrm', '2020-03-26 15:38:51', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (105, '快捷方式新增', 43, NULL, 1, 'F', NULL, '#', 'shortcut_add', NULL, '0', 1, '0', 'entfrm', '2020-03-27 09:44:13', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (106, '快捷方式修改', 43, NULL, 1, 'F', NULL, '#', 'shortcut_edit', NULL, '0', 2, '0', 'entfrm', '2020-03-27 09:44:36', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (107, '快捷方式删除', 43, NULL, 1, 'F', NULL, '#', 'shortcut_del', NULL, '0', 3, '0', 'entfrm', '2020-03-27 09:44:57', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (108, '快捷方式查看', 43, NULL, 1, 'F', NULL, '#', 'shortcut_view', NULL, '0', 4, '0', 'entfrm', '2020-03-27 09:45:16', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (109, '数据源管理', 3, NULL, 2, 'C', 'dataset', 'toolkit/dataset/index', NULL, 'star', '1', 2, '0', 'entfrm', '2020-02-02 00:00:00', 'entfrm', '2021-03-26 22:17:28', '数据源菜单', '0');
INSERT INTO `sys_menu` VALUES (110, '数据源新增', 109, NULL, 1, 'F', NULL, '#', 'dataset_add', '#', '1', 1, '0', 'entfrm', '2020-02-02 00:00:00', 'entfrm', '2020-02-02 00:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES (111, '数据源修改', 109, NULL, 1, 'F', NULL, '#', 'dataset_edit', '#', '1', 2, '0', 'entfrm', '2020-02-02 00:00:00', 'entfrm', '2020-02-02 00:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES (112, '数据源删除', 109, NULL, 1, 'F', NULL, '#', 'dataset_del', '#', '1', 3, '0', 'entfrm', '2020-02-02 00:00:00', 'entfrm', '2020-02-02 00:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES (113, '数据源查询', 109, NULL, 1, 'F', NULL, '#', 'dataset_view', '#', '1', 4, '0', 'entfrm', '2020-02-02 00:00:00', 'entfrm', '2020-02-02 00:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES (114, '数据源导出', 109, NULL, 1, 'F', NULL, '#', 'dataset_export', '#', '1', 5, '0', 'entfrm', '2020-02-02 00:00:00', 'entfrm', '2020-02-02 00:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES (121, '流程定义', 58, NULL, 1, 'C', 'process', 'activiti/process/index', NULL, 'list', '0', 2, '0', 'entfrm', '2020-04-04 22:33:12', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (122, '模型设计', 85, NULL, 1, 'F', NULL, '#', 'model_design', NULL, '0', 4, '0', 'entfrm', '2020-04-04 22:36:13', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (123, '流程图', 121, NULL, 1, 'F', NULL, '#', 'process_img', NULL, '0', 1, '0', 'entfrm', '2020-04-04 22:49:07', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (124, '流程状态改变', 121, NULL, 1, 'F', NULL, '#', 'process_change', NULL, '0', 2, '0', 'entfrm', '2020-04-04 22:49:46', NULL, '2020-04-05 00:40:17', NULL, '0');
INSERT INTO `sys_menu` VALUES (125, '流程删除', 121, NULL, 1, 'F', NULL, '#', 'process_del', NULL, '0', 3, '0', 'entfrm', '2020-04-04 22:50:05', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (126, '流程查看', 121, NULL, 1, 'F', NULL, '#', 'process_view', NULL, '0', 4, '0', 'entfrm', '2020-04-04 22:50:30', 'entfrm', '2020-04-04 22:50:35', NULL, '0');
INSERT INTO `sys_menu` VALUES (127, '请假管理', 58, NULL, 1, 'C', 'leave', 'activiti/leave/index', NULL, 'tree-table', '0', 3, '0', 'entfrm', '2020-04-04 22:51:56', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (128, '请假新增', 127, NULL, 1, 'F', NULL, '#', 'leave_add', NULL, '0', 1, '0', 'entfrm', '2020-04-04 22:52:44', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (129, '请假修改', 127, NULL, 1, 'F', NULL, '#', 'leave_edit', NULL, '0', 2, '0', 'entfrm', '2020-04-04 22:53:01', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (130, '请假删除', 127, NULL, 1, 'F', NULL, '#', 'leave_del', NULL, '0', 3, '0', 'entfrm', '2020-04-04 22:53:13', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (131, '请假查看', 127, NULL, 1, 'F', NULL, '#', 'leave_view', NULL, '0', 4, '0', 'entfrm', '2020-04-04 22:53:26', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (132, '请假导出', 127, NULL, 1, 'F', NULL, '#', 'leave_export', NULL, '0', 5, '0', 'entfrm', '2020-04-04 22:53:45', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (133, '流程任务', 58, NULL, 1, 'C', 'task', 'activiti/task/index', NULL, 'checkbox', '0', 4, '0', 'entfrm', '2020-04-04 22:55:03', NULL, '2020-04-12 16:27:31', NULL, '0');
INSERT INTO `sys_menu` VALUES (134, '审批', 133, NULL, 1, 'F', NULL, '#', 'task_check', NULL, '0', 1, '0', 'entfrm', '2020-04-04 22:56:31', 'entfrm', '2020-04-12 16:27:33', NULL, '0');
INSERT INTO `sys_menu` VALUES (135, '批注', 133, NULL, 1, 'F', NULL, '#', 'task_comment', NULL, '0', 2, '0', 'entfrm', '2020-04-04 22:56:46', 'entfrm', '2020-04-12 16:19:54', NULL, '0');
INSERT INTO `sys_menu` VALUES (136, '流程追踪', 133, NULL, 1, 'F', NULL, '#', 'task_track', NULL, '0', 3, '0', 'entfrm', '2020-04-04 22:57:19', 'entfrm', '2020-04-05 13:04:51', NULL, '0');
INSERT INTO `sys_menu` VALUES (137, '任务查看', 133, NULL, 1, 'F', NULL, '#', 'task_view', NULL, '0', 4, '0', 'entfrm', '2020-04-04 22:57:19', 'entfrm', '2020-04-05 13:04:59', NULL, '0');
INSERT INTO `sys_menu` VALUES (138, '模板新增', 56, NULL, 1, 'F', NULL, '#', 'template_add', NULL, '1', 1, '0', 'entfrm', '2020-04-12 16:28:51', NULL, '2020-12-11 23:10:15', NULL, '1');
INSERT INTO `sys_menu` VALUES (139, '应用管理', 1, NULL, 1, 'C', 'application', 'system/application/index', NULL, 'tool', '1', 0, '0', 'entfrm', '2020-04-23 18:35:21', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (140, '应用新增', 139, NULL, 1, 'F', NULL, '#', 'application_add', '#', '1', 1, '0', 'entfrm', '2020-02-02 00:00:00', 'entfrm', '2020-02-02 00:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES (141, '应用修改', 139, NULL, 1, 'F', NULL, '#', 'application_edit', '#', '1', 2, '0', 'entfrm', '2020-02-02 00:00:00', 'entfrm', '2020-02-02 00:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES (142, '应用删除', 139, NULL, 1, 'F', NULL, '#', 'application_del', '#', '1', 3, '0', 'entfrm', '2020-02-02 00:00:00', 'entfrm', '2020-02-02 00:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES (143, '应用查询', 139, NULL, 1, 'F', NULL, '#', 'application_view', '#', '1', 4, '0', 'entfrm', '2020-02-02 00:00:00', 'entfrm', '2020-02-02 00:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES (144, '应用导出', 139, NULL, 1, 'F', NULL, '#', 'application_export', '#', '1', 5, '0', 'entfrm', '2020-02-02 00:00:00', 'entfrm', '2020-02-02 00:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES (145, 'redis监控', 2, NULL, 1, 'C', 'redis', 'monitor/redis/index', NULL, 'component', '1', 5, '0', 'entfrm', '2020-04-24 22:26:31', 'entfrm', '2020-05-17 16:49:59', NULL, '0');
INSERT INTO `sys_menu` VALUES (146, '接口构建', 3, NULL, 2, 'C', 'apiinfo', 'toolkit/apiinfo/index', NULL, 'star', '1', 5, '0', 'entfrm', '2020-02-02 00:00:00', 'entfrm', '2021-03-26 21:59:08', '接口菜单', '0');
INSERT INTO `sys_menu` VALUES (147, '接口新增', 146, NULL, 1, 'F', NULL, '#', 'apiinfo_add', '#', '1', 1, '0', 'entfrm', '2020-02-02 00:00:00', 'entfrm', '2020-02-02 00:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES (148, '接口修改', 146, NULL, 1, 'F', NULL, '#', 'apiinfo_edit', '#', '1', 2, '0', 'entfrm', '2020-02-02 00:00:00', 'entfrm', '2020-02-02 00:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES (149, '接口删除', 146, NULL, 1, 'F', NULL, '#', 'apiinfo_del', '#', '1', 3, '0', 'entfrm', '2020-02-02 00:00:00', 'entfrm', '2020-02-02 00:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES (150, '接口查询', 146, NULL, 1, 'F', NULL, '#', 'apiinfo_view', '#', '1', 4, '0', 'entfrm', '2020-02-02 00:00:00', 'entfrm', '2020-02-02 00:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES (151, '接口导出', 146, NULL, 1, 'F', NULL, '#', 'apiinfo_export', '#', '1', 5, '0', 'entfrm', '2020-02-02 00:00:00', 'entfrm', '2020-02-02 00:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES (159, '令牌删除', 47, NULL, 1, 'F', NULL, '#', 'token_del', NULL, '1', 1, '0', 'entfrm', '2020-04-21 12:28:59', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (160, '令牌查看', 47, NULL, 1, 'F', NULL, '#', 'token_view', NULL, '1', 2, '0', 'entfrm', '2020-04-21 12:29:19', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (229, '表单管理', 3, NULL, 1, 'C', 'form', 'toolkit/form/index', '', 'build', '1', 3, '0', 'entfrm', '2020-02-02 00:00:00', 'entfrm', '2021-03-27 09:12:41', '表单管理菜单', '0');
INSERT INTO `sys_menu` VALUES (230, '表单管理新增', 229, NULL, 1, 'F', '', '#', 'form_add', '#', '1', 1, '0', 'entfrm', '2020-02-02 00:00:00', 'entfrm', '2020-02-02 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES (231, '表单管理修改', 229, NULL, 1, 'F', '', '#', 'form_edit', '#', '1', 2, '0', 'entfrm', '2020-02-02 00:00:00', 'entfrm', '2020-02-02 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES (232, '表单管理删除', 229, NULL, 1, 'F', '', '#', 'form_del', '#', '1', 3, '0', 'entfrm', '2020-02-02 00:00:00', 'entfrm', '2020-02-02 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES (233, '表单管理查询', 229, NULL, 1, 'F', '', '#', 'form_view', '#', '1', 4, '0', 'entfrm', '2020-02-02 00:00:00', 'entfrm', '2020-02-02 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES (234, '表单管理导出', 229, NULL, 1, 'F', '', '#', 'form_export', '#', '1', 5, '0', 'entfrm', '2020-02-02 00:00:00', 'entfrm', '2020-02-02 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES (235, '表单设计', 229, NULL, 2, 'F', NULL, '#', 'form_design', NULL, '1', 6, '0', 'entfrm', '2021-03-26 23:33:55', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (236, '智能化配置', 0, NULL, 2, 'M', 'intelligent', '#', NULL, 'intelligent', '1', 40, '0', 'entfrm', '2021-03-30 04:58:39', 'entfrm', '2021-03-30 04:58:52', NULL, '0');
INSERT INTO `sys_menu` VALUES (237, '控件大管家', 236, NULL, 2, 'C', 'steward', 'intelligent/controlSteward/index', NULL, 'controls', '1', 1, '0', 'entfrm', '2021-03-30 05:07:43', 'entfrm', '2021-03-30 05:08:12', NULL, '0');
INSERT INTO `sys_menu` VALUES (238, '表单扩展模板', 236, NULL, 2, 'C', 'formExtend', 'intelligent/formExtend/index', NULL, 'template', '1', 2, '0', 'entfrm', '2021-03-30 05:09:20', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (239, '表单扩展模板查看', 238, NULL, 2, 'F', NULL, '#', 'form_extend_view', NULL, '1', 1, '0', 'entfrm', '2021-03-30 05:10:24', 'entfrm', '2021-03-30 05:11:19', NULL, '0');
INSERT INTO `sys_menu` VALUES (240, '表单扩展模板新增', 238, NULL, 1, 'F', NULL, '#', 'form_extend_add', NULL, '1', 2, '0', 'entfrm', '2021-03-30 05:11:07', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (241, '表单扩展模板编辑', 238, NULL, 2, 'F', '表单扩展模板编辑', '#', 'form_extend_edit', NULL, '1', 3, '0', 'entfrm', '2021-03-30 05:11:58', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (242, '表单扩展模板删除', 238, NULL, 2, 'F', NULL, '#', 'form_extend_del', NULL, '1', 4, '0', 'entfrm', '2021-03-30 05:12:18', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (243, '表单集成案例', 236, NULL, 1, 'C', 'demoUser', 'intelligent/demoUser/index', NULL, 'demo', '1', 3, '0', 'entfrm', '2021-03-30 05:13:37', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (244, '设计模板', 238, NULL, 2, 'F', NULL, '#', 'form_extend_design', NULL, '1', 5, '0', 'entfrm', '2021-03-30 05:21:32', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (245, '我发起流程', 58, NULL, 2, 'C', 'iInitiatedProcess', 'activiti/iInitiatedProcess/index', NULL, 'initiate', '1', 0, '0', '小狗', '2021-04-14 19:28:25', '小狗', '2021-04-14 19:28:54', NULL, '0');
INSERT INTO `sys_menu` VALUES (246, '表单引擎', 58, NULL, 2, 'C', 'formActivitiEngine', 'activiti/formActivitiEngine/index', NULL, 'form', '1', 0, '0', '小狗', '2021-04-19 23:26:38', '小狗', '2021-04-19 23:26:59', NULL, '0');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志编号',
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '日志类型',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '日志标题',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `user_agent` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '用户代理',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `client_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '终端',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_addr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '请求参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '错误消息',
  `execute_time` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行时间',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1808 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (1806, '1', '菜单修改', 'PUT', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36', 'entfrm', 'entfrm', '/system/menu/update', '127.0.0.1', 'XX XX', '', 0, '', '0', '2021-04-23 18:09:06');
INSERT INTO `sys_oper_log` VALUES (1807, '1', '角色修改', 'PUT', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36', 'entfrm', 'entfrm', '/system/role/update', '127.0.0.1', 'XX XX', '', 0, '', '144', '2021-04-23 18:10:51');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '角色名称',
  `code` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '角色代码',
  `applications` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所属应用',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '2' COMMENT '数据权限范围',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态',
  `create_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '删除标识（0-正常,1-删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '管理员', 'admin', 'app1', '1', 1, '0', 'entfrm', '2020-03-13 20:54:34', 'entfrm', '2020-08-02 21:44:58', NULL, '0');
INSERT INTO `sys_role` VALUES (2, '测试角色', 'test', 'app1', '2', 1, '0', 'entfrm', '2020-03-14 18:15:51', 'entfrm', '2020-08-02 21:44:57', NULL, '0');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `dept_id` int(11) NOT NULL COMMENT '部门ID'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` int(11) NULL DEFAULT NULL,
  `menu_id` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 11);
INSERT INTO `sys_role_menu` VALUES (2, 16);
INSERT INTO `sys_role_menu` VALUES (2, 7);
INSERT INTO `sys_role_menu` VALUES (2, 25);
INSERT INTO `sys_role_menu` VALUES (2, 26);
INSERT INTO `sys_role_menu` VALUES (2, 27);
INSERT INTO `sys_role_menu` VALUES (2, 28);
INSERT INTO `sys_role_menu` VALUES (2, 33);
INSERT INTO `sys_role_menu` VALUES (2, 78);
INSERT INTO `sys_role_menu` VALUES (2, 81);
INSERT INTO `sys_role_menu` VALUES (2, 82);
INSERT INTO `sys_role_menu` VALUES (2, 83);
INSERT INTO `sys_role_menu` VALUES (2, 84);
INSERT INTO `sys_role_menu` VALUES (2, 79);
INSERT INTO `sys_role_menu` VALUES (2, 90);
INSERT INTO `sys_role_menu` VALUES (2, 91);
INSERT INTO `sys_role_menu` VALUES (2, 92);
INSERT INTO `sys_role_menu` VALUES (2, 93);
INSERT INTO `sys_role_menu` VALUES (2, 94);
INSERT INTO `sys_role_menu` VALUES (2, 95);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 55);
INSERT INTO `sys_role_menu` VALUES (2, 57);
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 5);
INSERT INTO `sys_role_menu` VALUES (2, 29);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (3, 109);
INSERT INTO `sys_role_menu` VALUES (3, 110);
INSERT INTO `sys_role_menu` VALUES (3, 111);
INSERT INTO `sys_role_menu` VALUES (3, 112);
INSERT INTO `sys_role_menu` VALUES (3, 113);
INSERT INTO `sys_role_menu` VALUES (3, 114);
INSERT INTO `sys_role_menu` VALUES (3, 3);
INSERT INTO `sys_role_menu` VALUES (1, 58);
INSERT INTO `sys_role_menu` VALUES (1, 245);
INSERT INTO `sys_role_menu` VALUES (1, 246);
INSERT INTO `sys_role_menu` VALUES (1, 85);
INSERT INTO `sys_role_menu` VALUES (1, 86);
INSERT INTO `sys_role_menu` VALUES (1, 87);
INSERT INTO `sys_role_menu` VALUES (1, 88);
INSERT INTO `sys_role_menu` VALUES (1, 89);
INSERT INTO `sys_role_menu` VALUES (1, 122);
INSERT INTO `sys_role_menu` VALUES (1, 121);
INSERT INTO `sys_role_menu` VALUES (1, 123);
INSERT INTO `sys_role_menu` VALUES (1, 124);
INSERT INTO `sys_role_menu` VALUES (1, 125);
INSERT INTO `sys_role_menu` VALUES (1, 126);
INSERT INTO `sys_role_menu` VALUES (1, 127);
INSERT INTO `sys_role_menu` VALUES (1, 128);
INSERT INTO `sys_role_menu` VALUES (1, 129);
INSERT INTO `sys_role_menu` VALUES (1, 130);
INSERT INTO `sys_role_menu` VALUES (1, 131);
INSERT INTO `sys_role_menu` VALUES (1, 132);
INSERT INTO `sys_role_menu` VALUES (1, 133);
INSERT INTO `sys_role_menu` VALUES (1, 134);
INSERT INTO `sys_role_menu` VALUES (1, 135);
INSERT INTO `sys_role_menu` VALUES (1, 136);
INSERT INTO `sys_role_menu` VALUES (1, 137);
INSERT INTO `sys_role_menu` VALUES (1, 1);
INSERT INTO `sys_role_menu` VALUES (1, 139);
INSERT INTO `sys_role_menu` VALUES (1, 140);
INSERT INTO `sys_role_menu` VALUES (1, 141);
INSERT INTO `sys_role_menu` VALUES (1, 142);
INSERT INTO `sys_role_menu` VALUES (1, 143);
INSERT INTO `sys_role_menu` VALUES (1, 144);
INSERT INTO `sys_role_menu` VALUES (1, 4);
INSERT INTO `sys_role_menu` VALUES (1, 8);
INSERT INTO `sys_role_menu` VALUES (1, 9);
INSERT INTO `sys_role_menu` VALUES (1, 10);
INSERT INTO `sys_role_menu` VALUES (1, 11);
INSERT INTO `sys_role_menu` VALUES (1, 12);
INSERT INTO `sys_role_menu` VALUES (1, 5);
INSERT INTO `sys_role_menu` VALUES (1, 13);
INSERT INTO `sys_role_menu` VALUES (1, 14);
INSERT INTO `sys_role_menu` VALUES (1, 15);
INSERT INTO `sys_role_menu` VALUES (1, 16);
INSERT INTO `sys_role_menu` VALUES (1, 17);
INSERT INTO `sys_role_menu` VALUES (1, 6);
INSERT INTO `sys_role_menu` VALUES (1, 18);
INSERT INTO `sys_role_menu` VALUES (1, 19);
INSERT INTO `sys_role_menu` VALUES (1, 20);
INSERT INTO `sys_role_menu` VALUES (1, 21);
INSERT INTO `sys_role_menu` VALUES (1, 22);
INSERT INTO `sys_role_menu` VALUES (1, 23);
INSERT INTO `sys_role_menu` VALUES (1, 24);
INSERT INTO `sys_role_menu` VALUES (1, 7);
INSERT INTO `sys_role_menu` VALUES (1, 25);
INSERT INTO `sys_role_menu` VALUES (1, 26);
INSERT INTO `sys_role_menu` VALUES (1, 27);
INSERT INTO `sys_role_menu` VALUES (1, 28);
INSERT INTO `sys_role_menu` VALUES (1, 29);
INSERT INTO `sys_role_menu` VALUES (1, 30);
INSERT INTO `sys_role_menu` VALUES (1, 31);
INSERT INTO `sys_role_menu` VALUES (1, 32);
INSERT INTO `sys_role_menu` VALUES (1, 33);
INSERT INTO `sys_role_menu` VALUES (1, 34);
INSERT INTO `sys_role_menu` VALUES (1, 35);
INSERT INTO `sys_role_menu` VALUES (1, 36);
INSERT INTO `sys_role_menu` VALUES (1, 37);
INSERT INTO `sys_role_menu` VALUES (1, 38);
INSERT INTO `sys_role_menu` VALUES (1, 39);
INSERT INTO `sys_role_menu` VALUES (1, 40);
INSERT INTO `sys_role_menu` VALUES (1, 41);
INSERT INTO `sys_role_menu` VALUES (1, 42);
INSERT INTO `sys_role_menu` VALUES (1, 43);
INSERT INTO `sys_role_menu` VALUES (1, 105);
INSERT INTO `sys_role_menu` VALUES (1, 106);
INSERT INTO `sys_role_menu` VALUES (1, 107);
INSERT INTO `sys_role_menu` VALUES (1, 108);
INSERT INTO `sys_role_menu` VALUES (1, 44);
INSERT INTO `sys_role_menu` VALUES (1, 73);
INSERT INTO `sys_role_menu` VALUES (1, 74);
INSERT INTO `sys_role_menu` VALUES (1, 75);
INSERT INTO `sys_role_menu` VALUES (1, 76);
INSERT INTO `sys_role_menu` VALUES (1, 77);
INSERT INTO `sys_role_menu` VALUES (1, 45);
INSERT INTO `sys_role_menu` VALUES (1, 59);
INSERT INTO `sys_role_menu` VALUES (1, 60);
INSERT INTO `sys_role_menu` VALUES (1, 61);
INSERT INTO `sys_role_menu` VALUES (1, 62);
INSERT INTO `sys_role_menu` VALUES (1, 46);
INSERT INTO `sys_role_menu` VALUES (1, 69);
INSERT INTO `sys_role_menu` VALUES (1, 70);
INSERT INTO `sys_role_menu` VALUES (1, 71);
INSERT INTO `sys_role_menu` VALUES (1, 72);
INSERT INTO `sys_role_menu` VALUES (1, 2);
INSERT INTO `sys_role_menu` VALUES (1, 47);
INSERT INTO `sys_role_menu` VALUES (1, 159);
INSERT INTO `sys_role_menu` VALUES (1, 160);
INSERT INTO `sys_role_menu` VALUES (1, 48);
INSERT INTO `sys_role_menu` VALUES (1, 96);
INSERT INTO `sys_role_menu` VALUES (1, 97);
INSERT INTO `sys_role_menu` VALUES (1, 98);
INSERT INTO `sys_role_menu` VALUES (1, 99);
INSERT INTO `sys_role_menu` VALUES (1, 100);
INSERT INTO `sys_role_menu` VALUES (1, 101);
INSERT INTO `sys_role_menu` VALUES (1, 102);
INSERT INTO `sys_role_menu` VALUES (1, 103);
INSERT INTO `sys_role_menu` VALUES (1, 104);
INSERT INTO `sys_role_menu` VALUES (1, 49);
INSERT INTO `sys_role_menu` VALUES (1, 50);
INSERT INTO `sys_role_menu` VALUES (1, 145);
INSERT INTO `sys_role_menu` VALUES (1, 51);
INSERT INTO `sys_role_menu` VALUES (1, 52);
INSERT INTO `sys_role_menu` VALUES (1, 53);
INSERT INTO `sys_role_menu` VALUES (1, 63);
INSERT INTO `sys_role_menu` VALUES (1, 64);
INSERT INTO `sys_role_menu` VALUES (1, 65);
INSERT INTO `sys_role_menu` VALUES (1, 54);
INSERT INTO `sys_role_menu` VALUES (1, 66);
INSERT INTO `sys_role_menu` VALUES (1, 67);
INSERT INTO `sys_role_menu` VALUES (1, 68);
INSERT INTO `sys_role_menu` VALUES (1, 3);
INSERT INTO `sys_role_menu` VALUES (1, 78);
INSERT INTO `sys_role_menu` VALUES (1, 81);
INSERT INTO `sys_role_menu` VALUES (1, 82);
INSERT INTO `sys_role_menu` VALUES (1, 83);
INSERT INTO `sys_role_menu` VALUES (1, 84);
INSERT INTO `sys_role_menu` VALUES (1, 79);
INSERT INTO `sys_role_menu` VALUES (1, 90);
INSERT INTO `sys_role_menu` VALUES (1, 91);
INSERT INTO `sys_role_menu` VALUES (1, 92);
INSERT INTO `sys_role_menu` VALUES (1, 93);
INSERT INTO `sys_role_menu` VALUES (1, 94);
INSERT INTO `sys_role_menu` VALUES (1, 95);
INSERT INTO `sys_role_menu` VALUES (1, 109);
INSERT INTO `sys_role_menu` VALUES (1, 110);
INSERT INTO `sys_role_menu` VALUES (1, 111);
INSERT INTO `sys_role_menu` VALUES (1, 112);
INSERT INTO `sys_role_menu` VALUES (1, 113);
INSERT INTO `sys_role_menu` VALUES (1, 114);
INSERT INTO `sys_role_menu` VALUES (1, 229);
INSERT INTO `sys_role_menu` VALUES (1, 230);
INSERT INTO `sys_role_menu` VALUES (1, 231);
INSERT INTO `sys_role_menu` VALUES (1, 232);
INSERT INTO `sys_role_menu` VALUES (1, 233);
INSERT INTO `sys_role_menu` VALUES (1, 234);
INSERT INTO `sys_role_menu` VALUES (1, 235);
INSERT INTO `sys_role_menu` VALUES (1, 55);
INSERT INTO `sys_role_menu` VALUES (1, 146);
INSERT INTO `sys_role_menu` VALUES (1, 147);
INSERT INTO `sys_role_menu` VALUES (1, 148);
INSERT INTO `sys_role_menu` VALUES (1, 149);
INSERT INTO `sys_role_menu` VALUES (1, 150);
INSERT INTO `sys_role_menu` VALUES (1, 151);
INSERT INTO `sys_role_menu` VALUES (1, 236);
INSERT INTO `sys_role_menu` VALUES (1, 237);
INSERT INTO `sys_role_menu` VALUES (1, 238);
INSERT INTO `sys_role_menu` VALUES (1, 239);
INSERT INTO `sys_role_menu` VALUES (1, 240);
INSERT INTO `sys_role_menu` VALUES (1, 241);
INSERT INTO `sys_role_menu` VALUES (1, 242);
INSERT INTO `sys_role_menu` VALUES (1, 244);
INSERT INTO `sys_role_menu` VALUES (1, 243);

-- ----------------------------
-- Table structure for sys_shortcut
-- ----------------------------
DROP TABLE IF EXISTS `sys_shortcut`;
CREATE TABLE `sys_shortcut`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `region` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区域',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `bg_color` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#409EFF' COMMENT '背景颜色',
  `path` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路径',
  `sort` int(11) NULL DEFAULT NULL COMMENT '顺序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '0-正常，1-删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_shortcut
-- ----------------------------
INSERT INTO `sys_shortcut` VALUES (1, '登录日志', '2', 'form', '#2883CD', 'monitor/log/loginLog', 1, 'entfrm', '2020-03-27 10:09:11', '', '2020-03-27 10:12:39', '1', '0');
INSERT INTO `sys_shortcut` VALUES (2, '内容管理', '2', 'edit', '#EB7024', '/cms/article', 2, 'entfrm', '2020-04-15 22:44:58', '', '2020-06-02 08:59:06', NULL, '0');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码',
  `dept_id` int(11) NULL DEFAULT NULL COMMENT '机构ID',
  `dept_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构名称',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `qq` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'QQ',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `login_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后登陆IP',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'entfrm', '管理员', '00', '$2a$10$N0EAFRVjSYipHK/HDqzuEuVJZBabVTD7Z.NrXrnas984.1wjkaLK.', 1, '重庆总公司', '111@qq.com', NULL, '15611111111', '0', '/profile/avatar/avatar1589722134317.png', '0', '', NULL, 'entfrm', '2020-03-13 20:56:44', '', NULL, '全栈工程师', '0');
INSERT INTO `sys_user` VALUES (2, 'test', '测试01', '00', '$2a$10$Yq7NRB8VO4n1AxcThlwJweM1WE8fwvFRl0krQkNihGxiCRW/Gfp/.', 1, '重庆总公司', '', NULL, '', '0', '', '0', '', NULL, 'entfrm', '2020-03-14 18:14:11', '', NULL, NULL, '1');
INSERT INTO `sys_user` VALUES (7, '小猫', '小猫', '00', '$2a$10$algx6IS1lUK6sQX6OakbVOq7dXrShIr2IMrEh8JguRw7VhDy5FwBS', 1, '', '1827945911@qq.com', NULL, '13272461811', '0', '', '0', '', NULL, 'entfrm', '2021-04-04 17:24:07', '', '2021-04-04 17:24:17', NULL, '0');
INSERT INTO `sys_user` VALUES (8, '小可爱', '小可爱', '00', '$2a$10$/ofeR7BxtYaRkmuU6S4Jq.lJ.lLUTN3UPYULqbhcYiOkcQcUQur3q', 1, '', '1827945911@qq.com', NULL, '13272461811', '0', '', '0', '', NULL, 'entfrm', '2021-04-04 17:25:02', '', NULL, NULL, '0');
INSERT INTO `sys_user` VALUES (9, '小狗', '小狗', '00', '$2a$10$W3qfJHogHT3NHtLbasw6gO9iNADkJWsrbczvgNb8H09rhLXAzGA5i', 1, '', '1827945911@qq.com', NULL, '13272461811', '0', '', '0', '', NULL, 'entfrm', '2021-04-04 17:27:49', '', NULL, NULL, '0');
INSERT INTO `sys_user` VALUES (10, '小猪', '小猪', '00', '$2a$10$iLAi75SNyPu5BPFhHk6Os.QyCdl7EqrOpHIOgPlmr3f89EHFK/pRi', 1, '', '1827945911@qq.com', NULL, '13272461811', '0', '', '0', '', NULL, 'entfrm', '2021-04-04 17:28:34', '', NULL, NULL, '0');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` int(11) NULL DEFAULT NULL,
  `role_id` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (4, 2);
INSERT INTO `sys_user_role` VALUES (3, 2);
INSERT INTO `sys_user_role` VALUES (5, 2);
INSERT INTO `sys_user_role` VALUES (8, 2);
INSERT INTO `sys_user_role` VALUES (9, 2);
INSERT INTO `sys_user_role` VALUES (3, 1);
INSERT INTO `sys_user_role` VALUES (4, 1);
INSERT INTO `sys_user_role` VALUES (5, 1);
INSERT INTO `sys_user_role` VALUES (6, 1);
INSERT INTO `sys_user_role` VALUES (7, 1);
INSERT INTO `sys_user_role` VALUES (8, 1);
INSERT INTO `sys_user_role` VALUES (9, 1);
INSERT INTO `sys_user_role` VALUES (10, 1);

SET FOREIGN_KEY_CHECKS = 1;
