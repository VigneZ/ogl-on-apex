prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- Oracle APEX export file
--
-- You should run this script using a SQL client connected to the database as
-- the owner (parsing schema) of the application or as a database user with the
-- APEX_ADMINISTRATOR_ROLE role.
--
-- This export file has been automatically generated. Modifying this file is not
-- supported by Oracle and can lead to unexpected application and/or instance
-- behavior now or in the future.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_imp.import_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.5'
,p_default_workspace_id=>793364249401688935
,p_default_application_id=>11641
,p_default_id_offset=>0
,p_default_owner=>'WKSP_OUOGL'
);
end;
/
 
prompt APPLICATION 11641 - OGL APEX Plugin Test App
--
-- Application Export:
--   Application:     11641
--   Name:            OGL APEX Plugin Test App
--   Date and Time:   14:31 Tuesday May 20, 2025
--   Exported By:     VIGNESHWARAN.GOPALAN@ORACLE.COM
--   Flashback:       0
--   Export Type:     Component Export
--   Manifest
--     PLUGIN: 1442931895561147244
--   Manifest End
--   Version:         24.2.5
--   Instance ID:     69413411569574
--

begin
  -- replace components
  wwv_flow_imp.g_mode := 'REPLACE';
end;
/
prompt --application/shared_components/plugins/dynamic_action/oracle_ogl_embed_apex
begin
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(1442931895561147244)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'ORACLE.OGL.EMBED.APEX'
,p_display_name=>'OGL on APEX'
,p_category=>'INIT'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'FUNCTION render_ogl (',
'    p_dynamic_action IN apex_plugin.t_dynamic_action,',
'    p_plugin         IN apex_plugin.t_plugin',
')',
'RETURN apex_plugin.t_dynamic_action_render_result',
'IS',
'  l_app_id          VARCHAR2(50) := p_dynamic_action.attribute_01;',
'  l_server_domain   VARCHAR2(50) := p_dynamic_action.attribute_02;',
'  l_enable_tracking VARCHAR2(5)  := p_dynamic_action.attribute_04;',
'  l_environment     VARCHAR2(5) := p_dynamic_action.attribute_05;',
'  l_page_format     VARCHAR2(20) := p_dynamic_action.attribute_06;',
'  l_config_json     CLOB;',
'  l_result          apex_plugin.t_dynamic_action_render_result;',
'BEGIN',
'  -- Debugging',
'  IF apex_application.g_debug THEN',
'    apex_plugin_util.debug_dynamic_action(',
'      p_plugin         => p_plugin,',
'      p_dynamic_action => p_dynamic_action',
'    );',
'  END IF;',
'',
'  -- Build iridizeConfig JSON',
'  apex_json.initialize_clob_output;',
'  apex_json.open_object;',
'  apex_json.write(''appId'', l_app_id);',
'  apex_json.write(''serverUrl'', l_server_domain);',
'',
'  IF l_enable_tracking = ''Y'' THEN',
'    apex_json.write(''enableTracking'', TRUE);',
'  END IF;',
'',
'  apex_json.write(''environment'', l_environment);',
'  ',
'  apex_json.write(''page_format'', l_page_format);',
'  apex_json.close_object;',
'  l_config_json := apex_json.get_clob_output;',
'',
'  -- Inject iridizeConfig object into the page',
'  apex_javascript.add_inline_code(',
'    p_code => ''window.iridizeConfig = '' || l_config_json || '';''',
'  );',
'',
'  -- Load the GuidedTour.min.js script (make sure the file exists at the correct location)',
'  apex_javascript.add_library(',
'    p_name           => ''GuidedTour.min'',',
'    p_directory      => p_plugin.file_prefix,',
'    p_version        => NULL,',
'    p_skip_extension => FALSE',
'  );',
'',
'  -- Set dummy JavaScript function for dynamic action (no action directly)',
'  l_result.javascript_function := ''function(){null}'';',
'',
'  RETURN l_result;',
'END render_ogl;'))
,p_api_version=>1
,p_render_function=>'render_ogl'
,p_substitute_attributes=>true
,p_version_scn=>44755165591970
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Oracle APEX (Oracle Application Express) is a low-code application development platform developed by Oracle Corporation. It allows developers to build and deploy web, mobile, and desktop applications with a user-friendly, browser-based interface. APE'
||'X enables rapid application development with features like wizards, drag-and-drop layout builders, and property editors. ',
'',
'Oracle Guided Learning (OGL) is a digital adoption platform that delivers in-application guidance, helping organizations adopt new products, processes, and policies. It''s designed to simplify and accelerate the adoption of web-based applications by p'
||'roviding users with personalized, step-by-step, and contextual support within the application itself. OGL is a tool for training and change management, offering a way to communicate new updates, manage continuous change, and provide support to users '
||'as they need it. ',
'',
'',
'This Plugin helps in setting up OGL on Oracle APEX Applications.'))
,p_version_identifier=>'1.0'
,p_files_version=>60
);
wwv_flow_imp_shared.create_plugin_attr_group(
 p_id=>wwv_flow_imp.id(1429650789403532965)
,p_plugin_id=>wwv_flow_imp.id(1442931895561147244)
,p_title=>'OGL Configuration'
,p_display_sequence=>50
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(1442932413498150204)
,p_plugin_id=>wwv_flow_imp.id(1442931895561147244)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'OGL APPID'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
,p_attribute_group_id=>wwv_flow_imp.id(1429650789403532965)
,p_help_text=>'Enter the App ID for this application.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(1442932725546151616)
,p_plugin_id=>wwv_flow_imp.id(1442931895561147244)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'OGL Server Domain'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'guidedlearning.oracle.com'
,p_is_translatable=>false
,p_attribute_group_id=>wwv_flow_imp.id(1429650789403532965)
,p_help_text=>'Enter the OGL Server Domain Name.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(1442933265422154057)
,p_plugin_id=>wwv_flow_imp.id(1442931895561147244)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>30
,p_prompt=>'OGL User Tracking'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'Y'
,p_is_translatable=>false
,p_attribute_group_id=>wwv_flow_imp.id(1429650789403532965)
,p_help_text=>'Switch to Yes to track APEX user based analytics, enable Survey and Task List.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(1442933658356156622)
,p_plugin_id=>wwv_flow_imp.id(1442931895561147244)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>40
,p_prompt=>'OGL Environment'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_default_value=>'prod'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_attribute_group_id=>wwv_flow_imp.id(1429650789403532965)
,p_help_text=>'Select Development/Production mode.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(1442933960134158280)
,p_plugin_attribute_id=>wwv_flow_imp.id(1442933658356156622)
,p_display_sequence=>10
,p_display_value=>'Development'
,p_return_value=>'dev'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(1442934378122159098)
,p_plugin_attribute_id=>wwv_flow_imp.id(1442933658356156622)
,p_display_sequence=>20
,p_display_value=>'Production'
,p_return_value=>'prod'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(1699555382784555832)
,p_plugin_id=>wwv_flow_imp.id(1442931895561147244)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'OGL Page Tracking Format'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_default_value=>'document.title'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_attribute_group_id=>wwv_flow_imp.id(1429650789403532965)
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(1700645548119554116)
,p_plugin_attribute_id=>wwv_flow_imp.id(1699555382784555832)
,p_display_sequence=>10
,p_display_value=>'Title'
,p_return_value=>'document.title'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(1699556710775544896)
,p_plugin_attribute_id=>wwv_flow_imp.id(1699555382784555832)
,p_display_sequence=>20
,p_display_value=>'Path'
,p_return_value=>'location.pathname'
,p_help_text=>'The format of the page in OGL Analytics'
);
end;
/
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '77696E646F772E6F6E6C6F6164203D2066756E6374696F6E2829207B0A202020206966202877696E646F772E69726964697A65436F6E66696729207B0A202020202020202077696E646F772E69726964697A65203D2077696E646F772E69726964697A65';
wwv_flow_imp.g_varchar2_table(2) := '207C7C2066756E6374696F6E28652C20742C206E29207B0A20202020202020202020202072657475726E2069726964697A652E6170692E63616C6C28652C20742C206E293B0A20202020202020207D3B0A202020202020202069726964697A652E617069';
wwv_flow_imp.g_varchar2_table(3) := '203D2069726964697A652E617069207C7C207B0A202020202020202020202020713A205B5D2C0A20202020202020202020202063616C6C3A2066756E6374696F6E28652C20742C206E29207B0A2020202020202020202020202020202069726964697A65';
wwv_flow_imp.g_varchar2_table(4) := '2E6170692E712E70757368287B206D6574686F643A20652C20646174613A20742C2063616C6C6261636B3A206E207D293B0A2020202020202020202020207D0A20202020202020207D3B0A0A202020202020202069726964697A652E6C616E673D646F63';
wwv_flow_imp.g_varchar2_table(5) := '756D656E742E646F63756D656E74456C656D656E742E6C616E673B0A0A202020202020202069726964697A652E6170704964203D2077696E646F772E69726964697A65436F6E6669672E61707049643B0A0A20202020202020206966202877696E646F77';
wwv_flow_imp.g_varchar2_table(6) := '2E69726964697A65436F6E6669672E656E7669726F6E6D656E7429207B0A20202020202020202020202069726964697A652E656E76203D2077696E646F772E69726964697A65436F6E6669672E656E7669726F6E6D656E743B0A20202020202020207D0A';
wwv_flow_imp.g_varchar2_table(7) := '0A20202020202020206966202877696E646F772E69726964697A65436F6E6669672E656E61626C65547261636B696E6729207B0A20202020202020202020202069726964697A6528226170692E6669656C64732E736574222C207B20757365725F69643A';
wwv_flow_imp.g_varchar2_table(8) := '20617065782E656E762E4150505F55534552207D293B0A20202020202020207D0A0A202020202020200A202020202020202069726964697A6528276170692E726F7574652E757064617465272C207B27726F757465273A6576616C2877696E646F772E69';
wwv_flow_imp.g_varchar2_table(9) := '726964697A65436F6E6669672E706167655F666F726D6174297D293B0A20202020202020200A0A202020202020202069726964697A652E6D696E203D2027273B200A202020202020202076617220736372697074203D20646F63756D656E742E63726561';
wwv_flow_imp.g_varchar2_table(10) := '7465456C656D656E74282273637269707422293B0A20202020202020207363726970742E737263203D202268747470733A2F2F22202B2077696E646F772E69726964697A65436F6E6669672E73657276657255726C202B20222F706C617965722F6C6174';
wwv_flow_imp.g_varchar2_table(11) := '6573742F7374617469632F6A732F69726964697A654C6F616465722E6D696E2E6A73223B0A20202020202020207363726970742E74797065203D2022746578742F6A617661736372697074223B0A20202020202020207363726970742E6173796E63203D';
wwv_flow_imp.g_varchar2_table(12) := '20747275653B0A20202020202020200A2020202020202020646F63756D656E742E626F64792E617070656E644368696C6428736372697074293B0A202020207D20656C7365207B0A2020202020202020636F6E736F6C652E6572726F7228226972696469';
wwv_flow_imp.g_varchar2_table(13) := '7A65436F6E666967206973206E6F7420617661696C61626C652E22293B0A202020207D0A7D3B0A';
end;
/
begin
wwv_flow_imp_shared.create_plugin_file(
 p_id=>wwv_flow_imp.id(1442935264850167487)
,p_plugin_id=>wwv_flow_imp.id(1442931895561147244)
,p_file_name=>'GuidedTour.js'
,p_mime_type=>'text/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '77696E646F772E6F6E6C6F61643D66756E6374696F6E28297B69662877696E646F772E69726964697A65436F6E666967297B77696E646F772E69726964697A653D77696E646F772E69726964697A657C7C66756E6374696F6E28692C652C6E297B726574';
wwv_flow_imp.g_varchar2_table(2) := '75726E2069726964697A652E6170692E63616C6C28692C652C6E297D2C69726964697A652E6170693D69726964697A652E6170697C7C7B713A5B5D2C63616C6C3A66756E6374696F6E28692C652C6E297B69726964697A652E6170692E712E7075736828';
wwv_flow_imp.g_varchar2_table(3) := '7B6D6574686F643A692C646174613A652C63616C6C6261636B3A6E7D297D7D2C69726964697A652E6C616E673D646F63756D656E742E646F63756D656E74456C656D656E742E6C616E672C69726964697A652E61707049643D77696E646F772E69726964';
wwv_flow_imp.g_varchar2_table(4) := '697A65436F6E6669672E61707049642C77696E646F772E69726964697A65436F6E6669672E656E7669726F6E6D656E7426262869726964697A652E656E763D77696E646F772E69726964697A65436F6E6669672E656E7669726F6E6D656E74292C77696E';
wwv_flow_imp.g_varchar2_table(5) := '646F772E69726964697A65436F6E6669672E656E61626C65547261636B696E67262669726964697A6528226170692E6669656C64732E736574222C7B757365725F69643A617065782E656E762E4150505F555345527D292C69726964697A652822617069';
wwv_flow_imp.g_varchar2_table(6) := '2E726F7574652E757064617465222C7B726F7574653A6576616C2877696E646F772E69726964697A65436F6E6669672E706167655F666F726D6174297D292C69726964697A652E6D696E3D22223B766172207363726970743D646F63756D656E742E6372';
wwv_flow_imp.g_varchar2_table(7) := '65617465456C656D656E74282273637269707422293B7363726970742E7372633D2268747470733A2F2F222B77696E646F772E69726964697A65436F6E6669672E73657276657255726C2B222F706C617965722F6C61746573742F7374617469632F6A73';
wwv_flow_imp.g_varchar2_table(8) := '2F69726964697A654C6F616465722E6D696E2E6A73222C7363726970742E747970653D22746578742F6A617661736372697074222C7363726970742E6173796E633D21302C646F63756D656E742E626F64792E617070656E644368696C64287363726970';
wwv_flow_imp.g_varchar2_table(9) := '74297D656C736520636F6E736F6C652E6572726F72282269726964697A65436F6E666967206973206E6F7420617661696C61626C652E22297D3B';
end;
/
begin
wwv_flow_imp_shared.create_plugin_file(
 p_id=>wwv_flow_imp.id(1699567803198502798)
,p_plugin_id=>wwv_flow_imp.id(1442931895561147244)
,p_file_name=>'GuidedTour.min.js'
,p_mime_type=>'text/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
prompt --application/end_environment
begin
wwv_flow_imp.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false)
);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
