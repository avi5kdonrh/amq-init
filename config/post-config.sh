#!/bin/bash
echo "############## Example Custom Script ###############"
echo "##                                                ##"
echo "##      This is an example configure script.      ##"
echo "##                                                ##"
echo "####################################################"
echo "#### The config dir locates at ${CONFIG_INSTANCE_DIR} ####"
ls ${CONFIG_INSTANCE_DIR}
cp /amq/lib/* ${CONFIG_INSTANCE_DIR}/lib/
#echo Adding a new account "test" with password "test"
#printf '\n' >> ${CONFIG_INSTANCE_DIR}/etc/artemis-users.properties 
#echo "test = test" >> ${CONFIG_INSTANCE_DIR}/etc/artemis-users.properties
# visitor has role 'viewer'
# /etc/artemis-roles.properties
#echo "adding test role as viewer"
#printf '\n' >> "${CONFIG_INSTANCE_DIR}"/etc/artemis-roles.properties
#echo "viewer = test" >> ${CONFIG_INSTANCE_DIR}/etc/artemis-roles.properties
## Add role 'viewer' to HAWTIO_ROLE so that it can login to the console
#sed -i "s/HAWTIO_ROLE='admin'/HAWTIO_ROLE='admin,viewer'/g" ${CONFIG_INSTANCE_DIR}/etc/artemis.profile
#sed -i "s/<critical-analyzer-policy>HALT<\/critical-analyzer-policy>/<critical-analyzer-policy>LOG<\/critical-analyzer-policy>/g" ${CONFIG_INSTANCE_DIR}/etc/broker.xml
#sed -i "/<\/security-settings>/ s/.*/\\n<security-setting match=\"topic\">\n<permission type=\"createNonDurableQueue\" roles=\"admin\"\/>\n<permission type=\"deleteNonDurableQueue\" roles=\"admin\"\/>\n<permission type=\"createDurableQueue\" roles=\"admin\"\/>\n<permission type=\"deleteDurableQueue\" roles=\"admin\"\/>\n<permission type=\"createAddress\" roles=\"admin\"\/>\n<permission type=\"deleteAddress\" roles=\"admin\"\/>\n<permission type=\"consume\" roles=\"admin,viewer\"\/>\n<permission type=\"browse\" roles=\"admin\"\/>\n<permission type=\"send\" roles=\"admin,viewer\"\/>\n<\!-- we need this otherwise .\/artemis data imp wouldn't work -->\n<permission type=\"manage\" roles=\"admin\"\/>\n<\/security-setting>\n&/" ${CONFIG_INSTANCE_DIR}/etc/broker.xml

#sed -i "/<\/core>/ s/.*/\\n<jmx-management-enabled>false<\/jmx-management-enabled>\n&/" ${CONFIG_INSTANCE_DIR}/etc/broker.xml

sed -i "/<\/core>/ s/.*/\\n<store>\\n    <database-store>\\n        <data-source-properties>\\n            <data-source-property key=\"driverClassName\" value=\"com.mysql.jdbc.Driver\" \/>\\n            <data-source-property key=\"url\" value=\"jdbc:mysql:\/\/mysql:3306\/mysql\" \/>\\n            <data-source-property key=\"username\" value=\"root\" \/>\\n            <data-source-property key=\"password\" value=\"password\" \/>\\n            <data-source-property key=\"poolPreparedStatements\" value=\"true\" \/>\\n        <\/data-source-properties>\\n        <bindings-table-name>BINDINGS<\/bindings-table-name>\\n        <message-table-name>MESSAGES<\/message-table-name>\\n        <large-message-table-name>LARGE_MESSAGES<\/large-message-table-name>\\n        <page-store-table-name>PAGE_STORE<\/page-store-table-name>\\n        <node-manager-store-table-name>NODE_MANAGER_STORE<\/node-manager-store-table-name>\\n    <\/database-store>\\n<\/store>\\n&/" ${CONFIG_INSTANCE_DIR}/etc/broker.xml

echo "#### Custom config done. ####"
